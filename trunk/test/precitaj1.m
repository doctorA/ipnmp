function matrika = precitaj1(file_path)
    
    zastavica=0;
    xDoc = xmlread(file_path);
 
    % Find a deep list of all <listitem> elements.
    allListItems = xDoc.getElementsByTagName('s');
    %disp(allListItems)
 
    %Note that the item list index is zero-based.
    for i=0:allListItems.getLength-1
        thisListItem = allListItems.item(i);
        %disp(thisListItem)
        childNode = thisListItem.getFirstChild;
        childText = char(childNode.getData);
        y=strcat(childText);
        
        for j=1:length(y)
           if y(j)==';' && j<length(y)
            y(j)=' ';
           end
           
           if zastavica ~= 1
           temp(1)=y(j);
           zastavica=1;
           else
               temp(end+1)=y(j);
           end
        end
        
    end
    matrika=[str2num(temp)];
      