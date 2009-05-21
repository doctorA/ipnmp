function varargout = acgGUI(varargin)
% ACGGUI M-file for acgGUI.fig
%      ACGGUI, by itself, creates a new ACGGUI or raises the existing
%      singleton*.
%
%      H = ACGGUI returns the handle to a new ACGGUI or the handle to
%      the existing singleton*.
%
%      ACGGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ACGGUI.M with the given input arguments.
%
%      ACGGUI('Property','Value',...) creates a new ACGGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before acgGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to acgGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help acgGUI

% Last Modified by GUIDE v2.5 20-May-2009 00:12:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @acgGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @acgGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before acgGUI is made visible.
function acgGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to acgGUI (see VARARGIN)

% Choose default command line output for acgGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes acgGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = acgGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function editGPS_Callback(hObject, eventdata, handles)
% hObject    handle to editGPS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editGPS as text
%        str2double(get(hObject,'String')) returns contents of editGPS as a double


% --- Executes during object creation, after setting all properties.
function editGPS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editGPS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in checkboxACC.
function checkboxACC_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxACC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxACC



% --- Executes on button press in checkboxCAM.
function checkboxCAM_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxCAM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxCAM



% --- Executes on button press in checkboxGPS.
function checkboxGPS_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxGPS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxGPS




function editCAM_Callback(hObject, eventdata, handles)
% hObject    handle to editCAM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCAM as text
%        str2double(get(hObject,'String')) returns contents of editCAM as a double


% --- Executes during object creation, after setting all properties.
function editCAM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCAM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editACC_Callback(hObject, eventdata, handles)
% hObject    handle to editACC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editACC as text
%        str2double(get(hObject,'String')) returns contents of editACC as a double


% --- Executes during object creation, after setting all properties.
function editACC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editACC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editTYPE_Callback(hObject, eventdata, handles)
% hObject    handle to editTYPE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTYPE as text
%        str2double(get(hObject,'String')) returns contents of editTYPE as a double


% --- Executes during object creation, after setting all properties.
function editTYPE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTYPE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function createLock(fileName, session)
lockFile = fopen(fileName,'w','n','UTF8' );
fprintf(lockFile,session);
fclose=(lockFile);

% --- Executes on button press in pushbuttonStart.
function pushbuttonStart_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (exist('acgGUI.lock') == 0)
    
    set(handles.pushbuttonStart,'String','...');
    
    if (exist('acgData','dir') == 0)
        mkdir('acgData');
    end
    
    session = datestr(now, 'yyyy.mm.dd_HH.MM.SS');
    
    sched = findResource('scheduler','type','local');
    job=createJob(sched);
    
    createTask(job, @createLock,0,{'acgGUI.lock', session});
    %createTask(job, @dos,0,{'cd "\Program Files\VideoLAN\VLC" & vlc.exe -I RC --rc-host localhost:4444'});
    
    submit(job);
    delete(sched);
    
    while (exist('acgGUI.lock') == 0);
        pause(0.1);                                                         % Waiting for lock to come up
    end
    
    strArray = get(handles.editTYPE,'String');
    if (iscell(strArray))
        type = strArray{1};
    else
        type = strArray;
    end
    
    if ((get(handles.checkboxCAM,'Value') == 1) || (get(handles.checkboxGPS,'Value') == 1))
        sched = findResource('scheduler','type','local');
        job=createJob(sched);
        
        if (get(handles.checkboxCAM,'Value') == 1)
            strArray = get(handles.editCAM,'String');
            if (iscell(strArray))
                camName = strArray{1};
            else
                camName = strArray;
            end
            %disp(['cd "\Program Files\VideoLAN\VLC" & vlc.exe -I RC --rc-host localhost:4444 dshow:// :dshow-vdev="', camName, '" :dshow-caching=1000 :dshow-width=640 :dshow-height=480 :dshow-fps=10 :sout=#transcode{vcodec=mp4v,vb=2048,scale=1}:duplicate{dst=std{access=file,mux=mp4,dst="C:\acgGUI\acgData\camData_', session, '_', type, '.mpeg']);
            createTask(job, @dos,0,{['cd "\Program Files\VideoLAN\VLC" & vlc.exe -I RC --rc-host localhost:4444 dshow:// :dshow-vdev="', camName, '" :dshow-caching=1000 :dshow-width=640 :dshow-height=480 :dshow-fps=10 :sout=#transcode{vcodec=mp4v,vb=2048,scale=1}:duplicate{dst=std{access=file,mux=mp4,dst="C:\acgGUI\acgData\camData_', session, '_', type, '.mpeg']});
        end
        
        if (get(handles.checkboxGPS,'Value') == 1)
            strArray = get(handles.editGPS,'String');
            if (iscell(strArray))
                gpsComPort = strArray{1};
            else
                gpsComPort = strArray;
            end
    
            createTask(job, @gpsGet,0,{gpsComPort,['acgData/gpsData_', session, '_', type, '.xml']});
        end
        
        submit(job);
        delete(sched);
    end
    
    set(handles.pushbuttonStart,'String','Started!');
    
    if (get(handles.checkboxACC,'Value') == 1)
        strArray = get(handles.editACC,'String');
        if (iscell(strArray))
            accComPort = strArray{1};
        else
            accComPort = strArray;
        end
        
        accGet(accComPort,['acgData/accData_', session, '_', type, '.xml'], hObject, eventdata, handles);
    end
end

% --- Executes on button press in pushbuttonStop.
function pushbuttonStop_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

delete('acgGUI.lock');
dos('camGet.vbs quit');
set(handles.pushbuttonStart,'String','Start');

% --- Executes on button press in pushbuttonSettingsSave.
function pushbuttonSettingsSave_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSettingsSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

xmlFile = fopen('acgGUI.xml','w','n','UTF8');                               % Opening Settings File

fprintf(xmlFile,'<?xml version="1.0" encoding="utf-8"?>\n');                % Writing XML header
fprintf(xmlFile,'<acgGUI>\n');                                              % Opening acgGUI settings card

strArray = get(handles.editACC,'String');
if (iscell(strArray))
    fprintf(xmlFile,['<editACC>',strArray{1},'</editACC>\n']);
else
    fprintf(xmlFile,['<editACC>',strArray,'</editACC>\n']);
end

strArray = get(handles.editCAM,'String');
if (iscell(strArray))
    fprintf(xmlFile,['<editCAM>',strArray{1},'</editCAM>\n']);
else
    fprintf(xmlFile,['<editCAM>',strArray,'</editCAM>\n']);
end

strArray = get(handles.editGPS,'String');
if (iscell(strArray))
    fprintf(xmlFile,['<editGPS>',strArray{1},'</editGPS>\n']);
else
    fprintf(xmlFile,['<editGPS>',strArray,'</editGPS>\n']);
end

strArray = get(handles.checkboxACC,'Value');
if (iscell(strArray))
    fprintf(xmlFile,['<checkboxACC>',strArray{1},'</checkboxACC>\n']);
else
    fprintf(xmlFile,['<checkboxACC>',int2str(strArray),'</checkboxACC>\n']);
end

strArray = get(handles.checkboxCAM,'Value');
if (iscell(strArray))
    fprintf(xmlFile,['<checkboxCAM>',strArray{1},'</checkboxCAM>\n']);
else
    fprintf(xmlFile,['<checkboxCAM>',int2str(strArray),'</checkboxCAM>\n']);
end

strArray = get(handles.checkboxGPS,'Value');
if (iscell(strArray))
    fprintf(xmlFile,['<checkboxGPS>',strArray{1},'</checkboxGPS>\n']);
else
    fprintf(xmlFile,['<checkboxGPS>',int2str(strArray),'</checkboxGPS>\n']);
end

fprintf(xmlFile,'</acgGUI>\n');                                             % Closing acgGUI settings card
fclose(xmlFile);                                                            % Closing Settings File

% --- Executes on button press in pushbuttonSettingsLoad.
function pushbuttonSettingsLoad_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSettingsLoad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

xmlDocument = xmlread('acgGUI.xml');

allListItems = xmlDocument.getElementsByTagName('editACC');
thisListItem = allListItems.item(0);
set(handles.editACC,'String',char(thisListItem.getFirstChild.getData));

allListItems = xmlDocument.getElementsByTagName('editCAM');
thisListItem = allListItems.item(0);
set(handles.editCAM,'String',char(thisListItem.getFirstChild.getData));

allListItems = xmlDocument.getElementsByTagName('editGPS');
thisListItem = allListItems.item(0);
set(handles.editGPS,'String',char(thisListItem.getFirstChild.getData));

allListItems = xmlDocument.getElementsByTagName('checkboxACC');
thisListItem = allListItems.item(0);
if (char(thisListItem.getFirstChild.getData) == '1')
    set(handles.checkboxACC,'Value',1);
else
    set(handles.checkboxACC,'Value',0);
end

allListItems = xmlDocument.getElementsByTagName('checkboxCAM');
thisListItem = allListItems.item(0);
if (char(thisListItem.getFirstChild.getData) == '1')
    set(handles.checkboxCAM,'Value',1);
else
    set(handles.checkboxCAM,'Value',0);
end

allListItems = xmlDocument.getElementsByTagName('checkboxGPS');
thisListItem = allListItems.item(0);
if (char(thisListItem.getFirstChild.getData) == '1')
    set(handles.checkboxGPS,'Value',1);
else
    set(handles.checkboxGPS,'Value',0);
end



