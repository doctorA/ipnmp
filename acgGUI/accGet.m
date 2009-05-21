function [debug] = accGet(com, xml, hObject, eventdata, handles) %group 4 change - creating XML file name in the GUI itself so we can easily pass it to EditBox4 & this function
                                                                            %for future use

% Comments are in English until Microsoft implements a standard UTF8
% encoding without three special character tags

dataRead = [];                                                              % Reading port buffer in to variable
dataPooled = [];                                                            % Pulling together leftovers from buffer between reads
dataSized = [];                                                             % Multiplier of data in a packet, ready to be processed
dataStored = [];                                                            % Reshaped raw data, ready to be processed
dataFormated = [];                                                          % Processed and formated raw data

dataSecond = [];                                                            % Processes and formated raw data split in to seconds

brkSwitch = 1;                                                              % When it gracefully exits the dreaded while loop

c = 1;                                                                      % Signal counter

% XML stuff, doing things by hand until we figure out what goes on in memmory with java classes
xmlFileName = xml;      % Generated unique filename based on date and time
xmlFile = fopen(xmlFileName,'w','n','UTF8');                                % Opening a file used to write XML structure

fprintf(xmlFile,'<?xml version="1.0" encoding="utf-8"?>\n');                % Writing XML header
fprintf(xmlFile,'<!-- FERI, LSPO. Accelerometer data -->\n');                                               % Writing data structure comments
fprintf(xmlFile,'<!-- Session with date partitioned into seconds with time -->\n');                         % Writing data structure comments
fprintf(xmlFile,'<!-- Data formated as: status;x;y;z;timer;packet number;checksum A;checksum B; -->\n');    % Writing data structure comments

%fprintf(xmlFile,['<session date="',datestr(now, 'yyyy.mm.dd'),'">\n']);     % Opening <session> structure
fprintf(xmlFile,['<session>\n']);     % Opening <session> structure

% Opening connection to accelerometer device
s = serial(com);
fopen(s);

% Dreaded infinte loop of everything
tic;

%group 4 change - adding </session> tag at the end of the file if there is a
%timeout error
while (exist('acgGUI.lock') ~= 0);                                                  % 'nix style process controll
    [dataRead,count,errmsg] = fread(s,256);   % Read data from serial port buffer
     if (strfind(errmsg,'Timeout')) %detecting possible errors while reading from the data stream
         fclose(s);                 % clear the structure if error exists 
         fprintf(xmlFile,'</session>');                                              % Close <session> structure
         fclose(xmlFile);   
         
         % Camera stop
         warndlg(['Error: Lost connection or encountered a critical error. Terminating...']) %warn the user
         return

     end

    dataPooled = reshape([dataPooled,dataRead'],1,[]);                      % Append new read data to left overs from buffer
    
    if (length(dataPooled) > 14)
        dataSized = dataPooled(:,1:(length(dataPooled) - mod(length(dataPooled),15)));    % Multiplier of data in a packet, ready to be processed
        dataPooled = dataPooled(:,((length(dataPooled) - mod(length(dataPooled),15)) + 1):length(dataPooled));  % What is left over in the buffer
        
        dataStored = reshape(dataSized,15,[]);
        
        for f = 1:1:length(dataStored)
            dataFormated(c,1) = dataStored(3,f);
            dataFormated(c,2) = tcint162int16((dataStored(5,f) * 256) + dataStored(4,f));   % Group 1 fix - adjusting for two's complement encodig
            dataFormated(c,3) = tcint162int16((dataStored(7,f) * 256) + dataStored(6,f));   % Group 1 fix - adjusting for two's complement encodig
            dataFormated(c,4) = tcint162int16((dataStored(9,f) * 256) + dataStored(8,f));   % Group 1 fix - adjusting for two's complement encodig
            dataFormated(c,5) = ((dataStored(11,f) * 256) + dataStored(10,f));
            dataFormated(c,6) = ((dataStored(13,f) * 256) + dataStored(12,f));
            dataFormated(c,7) = dataStored(14,f);
            dataFormated(c,8) = dataStored(15,f);
            
            % At this pointdataFormated(c,(1-8)) has the latest signal, pooled and formated, GRAPH GOES HERE! 
            accGraph(dataFormated(c,2),dataFormated(c,3),dataFormated(c,4),1, hObject, eventdata, handles);
            
            if (dataFormated(c,5) < dataFormated(1,5))                      % Checking to see if timer counter has turned over
                if (dataFormated(c,5) < dataFormated((c - 1),5))            % When in the buffer the timer turned over
                    t = c;
                end
                
                if (((dataFormated((t - 1),5) - dataFormated(1,5)) + dataFormated(c,5)) > 46875)     
                    %fprintf(xmlFile,['<sec time="',datestr(now, 'HH:MM:SS'),'">\n']);   % Opening <sec> structure
                    fprintf(xmlFile,['\t<sec>\n']);   % Opening <sec> structure
                    fprintf(xmlFile,['\t\t<dateTime>', datestr(now,'yyyy.mm.dd HH:MM:SS'), '</dateTime>\n']);
                    
                    dataSecond = dataFormated(1:(c - 1),:);                 % The tripping signal is in the next second, so we need one less
                    dataFormated = dataFormated(c:c,:);                     % The surplus one stays in the buffer
                    
                    for i = 1:1:(c - 1),                                    % For every signal in the second we write it into sec XML deck
                        fprintf(xmlFile,['\t\t<s>',int2str(dataSecond(i,1)),';',int2str(dataSecond(i,2)),';',int2str(dataSecond(i,3)),';',int2str(dataSecond(i,4)),';',int2str(dataSecond(i,5)),';',int2str(dataSecond(i,6)),';',int2str(dataSecond(i,7)),';',int2str(dataSecond(i,8)),';','</s>\n']);
                    end
                    
                    c = 1;
                    
                    fprintf(xmlFile,'\t</sec>\n');                                        % Closing <sec> structure
                end
            else                                                            % If it hasn't turned, things are easyer to break in to seconds
                if ((dataFormated(c,5) - dataFormated(1,5)) > 46875)        % Diference in timer over 46875 means a second has passed
                    %fprintf(xmlFile,['<sec time="',datestr(now, 'HH:MM:SS'),'">\n']);   % Opening <sec> structure
                    fprintf(xmlFile,['\t<sec>\n']);   % Opening <sec> structure
                    fprintf(xmlFile,['\t\t<dateTime>', datestr(now,'yyyy.mm.dd HH:MM:SS'), '</dateTime>\n']);
                    
                    
                    dataSecond = dataFormated(1:(c - 1),:);                 % The tripping signal is in the next second, so we need one less
                    dataFormated = dataFormated(c:c,:);                     % The surplus one stays in the buffer
                    
                    for i = 1:1:(c - 1),                                    % For every signal in the second we write it into sec XML deck
                        fprintf(xmlFile,['\t\t<s>',int2str(dataSecond(i,1)),';',int2str(dataSecond(i,2)),';',int2str(dataSecond(i,3)),';',int2str(dataSecond(i,4)),';',int2str(dataSecond(i,5)),';',int2str(dataSecond(i,6)),';',int2str(dataSecond(i,7)),';',int2str(dataSecond(i,8)),';','</s>\n']);
                    end
                    
                    c = 1;
                    
                    fprintf(xmlFile,'\t</sec>\n');                                            % Closing <sec> structure
                end
            end
            
            c = c + 1;
            
        end
        
    end
    
    pause(0.1);                                                             % If any one has a better idea, patches welcome!!!
%     key = get (gcf, 'CurrentKey');                                          % We get a key
%     if (~isempty(key))                                                      % If it's not empty
%         brkSwitch = 0;                                                      % We set condition to stop the dreaded loop
%     end
    
end

% Closing connection to accelerometer device
fclose(s);

% XML stuff
fprintf(xmlFile,'</session>');                                              % Close <session> structure
fclose(xmlFile);                                                            % Close XML file
%debug = dataFormated;                                                      % Debug output

end
