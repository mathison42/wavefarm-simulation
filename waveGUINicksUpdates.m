function varargout = waveGUI(varargin)
% WAVEGUI MATLAB code for waveGUI.fig
%      WAVEGUI, by itself, creates a new WAVEGUI or raises the existing
%      singleton*.
%
%      H = WAVEGUI returns the handle to a new WAVEGUI or the handle to
%      the existing singleton*.
%
%      WAVEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WAVEGUI.M with the given input arguments.
%
%      WAVEGUI('Property','Value',...) creates a new WAVEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before waveGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to waveGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help waveGUI

% Last Modified by GUIDE v2.5 20-Oct-2014 21:40:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @waveGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @waveGUI_OutputFcn, ...
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




% --- Executes just before waveGUI is made visible.
function waveGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to waveGUI (see VARARGIN)

% Create the data to plot
% handles.peaks = peaks(35);
% handles.membrane = membrane;
% [x, y] = meshgrid(-8:0.5:8);
% r = sqrt(x.^2 + y.^2) + eps;
% sinc = sin(r)./r;
% handles.sinc = sinc;
% handles.current_data = handles.peaks;
% surf(handles.current_data);

% Choose default command line output for waveGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes waveGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% global variables
global sensorNum
sensorNum = 0
global wecsNum
wecsNum = 0
global waveElevation
waveElevation = 0.0
global waveFigure
global wecsData
global sensorData

% --- Outputs from this function are returned to the command line.
function varargout = waveGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%graph_init();
% Get default command line output from handles structure
varargout{1} = handles.output;

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;
graph_init();


% --- Executes on slider movement.
function SensorSlider_Callback(hObject, eventdata, handles)
% hObject    handle to SensorSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.sensorTxt, 'String', get(hObject, 'Value'))
global sensorNum
sensorNum = get(hObject, 'Value')

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function SensorSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SensorSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function WECSSlider_Callback(hObject, eventdata, handles)
% hObject    handle to WECSSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.wecsTxt, 'String', get(hObject, 'Value'))
global wecsNum
wecsNum = get(hObject, 'Value')

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function WECSSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WECSSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function WaveElevationSlider_Callback(hObject, eventdata, handles)
% hObject    handle to WaveElevationSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.waveTxt, 'String', get(hObject, 'Value'))
global waveElevation
waveElevation = get(hObject, 'Value')

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function WaveElevationSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaveElevationSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function sensorTable_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to sensorTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to sensorTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sensorTxt as text
%        str2double(get(hObject,'String')) returns contents of sensorTxt as a double


% --- Executes during object creation, after setting all properties.
function sensorTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sensorTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to wecsTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wecsTxt as text
%        str2double(get(hObject,'String')) returns contents of wecsTxt as a double


% --- Executes during object creation, after setting all properties.
function wecsTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wecsTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to waveTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of waveTxt as text
%        str2double(get(hObject,'String')) returns contents of waveTxt as a double


% --- Executes during object creation, after setting all properties.
function waveTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to waveTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on SensorSlider and none of its controls.
function SensorSlider_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to SensorSlider (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

function graph_init
    global sensorNum
    global wecsNum
    global waveElevation
    global waveFigure
    global wecsData
    global sensorData
    %figure; 
    %cla;
    %clf;
    w_width = 100;
    w_length = 100;
    w_Z = ones(w_width,w_length);
    w_color = ones(w_width,w_length);
    w_color(:,:,1) = 0;
    w_color(:,:,2) = 0;
    w_color(:,:,3) = 1;
    wec_count = wecsNum;
    sens_count = sensorNum;
    wec = ones(wec_count,3);
    sens = ones(sens_count,3);
    %           wec_id    ,dimensions(x,y,z)


    %wec/sens x,y assignment
    %for i = 1:wec_count
        %wec(i,:) = [(floor(rand*w_width)+1) (floor(rand*w_length)+1) 1];
    %end
    %for i = 1:sens_count
        %sens(i,:) = [(floor(rand*w_width)+1) (floor(rand*w_length)+1) 1];
    %end
	for i = 1:wec_count
        if isempty(str2double((wecsData(i,1)))) || isempty(str2double((wecsData(i,2))))
            wec(i,:) = [i 1 1]
        elseif not(str2double((wecsData(i,1))) > 0) || not(str2double((wecsData(i,2))) > 0)
            wec(i,:) = [i 1 1]
        else
            wec(i,:) = [str2double((wecsData(i,1))) str2double((wecsData(i,2))) 1]
        end
    end
    for i = 1:sens_count
        if isempty(str2double((sensorData(i,1)))) || isempty(str2double((sensorData(i,2))))
            sens(i,:) = [i 1 1]
        elseif not(str2double((sensorData(i,1))) > 0) || not(str2double((sensorData(i,2))) > 0)
            sens(i,:) = [i 1 1]
        else
            sens(i,:) = [str2double((sensorData(i,1))) str2double((sensorData(i,2))) 1]
        end
    end
    %handle_wec = ones(wec_count);
    hold on;
    handle_w = surf(w_Z,w_color);
    for n = 1:wec_count
           % delete(handle_wec(n));
            handle_wec(n) = plot3(wec(n,1),wec(n,2),wec(n,3),'or');
    end
    for n = 1:sens_count
           % delete(handle_wec(n));
            handle_sens(n) = plot3(sens(n,1),sens(n,2),sens(n,3),'y*');
    end

    increment = 0;
    material dull;
    sine_freq = 0.15;
    %sine_amplitude = 0.3;
    sine_amplitude = waveElevation * .1
    
    
    view(3);

    while 1==1
    
        %water height calcs
        increment = increment + sine_freq;
        if increment >= 2*pi
            increment = increment - 2*pi;
        end
        w_Z(1,:) = sine_amplitude*sin(increment);
        for xx = w_width:-1:2
            w_Z(xx,:) = .5*w_Z(xx,:) + .5*w_Z(xx-1,:);
        end


        %wec/sens height calcs
        for n = 1:wec_count
            wec(n,3) = w_Z(wec(n,2),wec(n,1));
            %assigns z value of each wec n to the value of the water at it's x,y location
        end
        for n = 1:sens_count
            sens(n,3) = w_Z(sens(n,2),sens(n,1));
            %assigns z value of each sens n to the value of the water at it's x,y location
        end


        %plot scene
        delete(handle_w);%delete/redraw water surface
        handle_w = surf(w_Z,w_color,'EdgeAlpha',0,'FaceLighting','gouraud');

        for n = 1:wec_count
            delete(handle_wec(n));%delete/redraw wecs
            handle_wec(n) = plot3(wec(n,1),wec(n,2),wec(n,3),'or');
        end
        for n = 1:sens_count
            delete(handle_sens(n));%delete/redraw sensors
            handle_sens(n) = plot3(sens(n,1),sens(n,2),sens(n,3),'y*');
        end
        axis([0 w_width 0 w_length -1 1]);%refix axes
        light('Position',[-15 0 .2],'Style','local')
        drawnow;
        pause(1/30);
    end
    

    
% --- Executes when entered data in editable cell(s) in sensorTable.
function sensorTable_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to sensorTable (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
global sensorData
sensorData = get(hObject, 'data')



% --- Executes when entered data in editable cell(s) in wecsTable.
function wecsTable_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to wecsTable (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
global wecsData
wecsData = get(hObject, 'data')


% --- Executes during object creation, after setting all properties.
function sensorTable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sensorTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global sensorData
sensorData = get(hObject, 'data')


% --- Executes during object creation, after setting all properties.
function wecsTable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wecsTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global wecsData
wecsData = get(hObject, 'data')
