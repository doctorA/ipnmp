function varargout = GForceGUI(varargin)
% GUI for G-Force reader
% Authors: Blaž Magdiè & Dejan Volk
% Documentation: Žiga S. & Miha M.
% FERI IPNMP 2008/2009, All rights reserved
%
% GFORCEGUI M-file for GForceGUI.fig

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GForceGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GForceGUI_OutputFcn, ...
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
end
% --- Executes just before GForceGUI is made visible.
function GForceGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.

% Choose default command line output for GForceGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using GForceGUI.
% UIWAIT makes GForceGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = GForceGUI_OutputFcn(hObject, eventdata, handles)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
end

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
%Confirmation dialog for closing the main program
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)
end

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
%Calls function accDebug which handles data stream from the G-force meter
%Reads the string in edit1 textbox, saves it into com_port and calls
%accDebug

com_port = get(handles.edit1,'String');
figure
pot = accDebug(com_port);

set(handles.edit4,'String',pot);

end

function edit1_Callback(hObject, eventdata, handles)
end

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
%Virtual COM port button - has a warning dialog integrated into it
%
%If the user clicks yes, this function reads the data typed into textboxes
%"Virtual COM Port 1" and "Virtual COM port 2" and uses functions
%simuliraj, which produces data strings equal to the ones produced by G-force
%meter and accDebug, which reads the data stream from assigned COM port

selection = questdlg(['WARNING: Do not use this feature unless you have established functional virtual ports! Are you sure you want to use this feature?'],...
                     ['WARNING!'],...
                     'Yes','No','Yes');

if strcmp(selection,'No')
    return;
elseif strcmp(selection,'Yes')
    com_port_value1 = get(handles.edit2,'String');
    com_port_value2 = get(handles.edit3,'String');
    
    %pseudo parallelism with scheduling jobs
    %requires extensive CPU power to run both tasks simultaneously
    sched = findResource('scheduler','type','local');
    job=createJob(sched);
    createTask(job, @simuliraj,0,{com_port_value1});
    createTask(job, @accDebug,0,{com_port_value2});
    submit(job);
    delete(sched);
end    
end

function edit2_Callback(hObject, eventdata, handles)
end

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function edit3_Callback(hObject, eventdata, handles)
end

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
%Takes care of interpolation process
%
%Checks if file has no errors, if it does, it warns the user where the
%last error is located, else it starts the interpolation process

selection = questdlg(['WARNING: Interpolation process takes several minutes to complete on slower systems. Are you sure you want to continue?'],...
                     ['WARNING!'],...
                     'Yes','No','Yes');

pot_xml = get(handles.edit4,'String');

if strcmp(selection,'No')
    return;
elseif(strcmp(selection,'Yes') && isempty(pot_xml))
   warndlg(['Error: No data parsed, please run Connect & Plot first'])
   return;
elseif strcmp(selection,'Yes')
    
    err_num = preveri(precitaj1(pot_xml));

    if(err_num ~= 0)
        warndlg(['Error in xml file on line' get(err_num,'String') 'Terminating...'])
    else
        interpolacija(precitaj1(pot_xml));
        msgbox('Interpolation complete','Info','help');
    end
 
end

end



function edit4_Callback(hObject, eventdata, handles)
end

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


