function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 04-Apr-2018 21:55:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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

% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;
set(handles.aktywny1,'Value',get(handles.aktywny1,'Max'))
set(handles.aktywny2,'Value',get(handles.aktywny2,'Max'))
set(handles.aktywny3,'Value',get(handles.aktywny3,'Max'))

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

function [] = drawFirst(handles)
% DRAWFIRST - funkcja rysuj¹ca lewy wykres
% handles - uchwyty kontrolek w GUI
    global N;
    global xMin;
    global xMax;
    global krok;
    x = xMin:krok:xMax;
    axes(handles.axes1);
    cla;
    hold on;
    axis([xMin, xMax, -3, 3]);
    title('Funkcja f(x) i jej przybli¿enia');
    xlabel('wartosc x'); ylabel('wartosc y');
    opis = 'N=';
    grid on;
    plot(x, func(x), 'k-');
    
    if((get(handles.aktywny1,'Value') == get(handles.aktywny1,'Max')))
        plot(x, szeregSin(x, N(1)), 'g--');
    end
    
    if((get(handles.aktywny2,'Value') == get(handles.aktywny2,'Max')))
        plot(x, szeregSin(x, N(2)), 'b-.');
    end
    
    if((get(handles.aktywny3,'Value') == get(handles.aktywny3,'Max')))
        plot(x, szeregSin(x, N(3)), 'r:');
    end
    legend('sin(x)', strcat(opis,int2str(N(1))), strcat(opis,int2str(N(2))), strcat(opis,int2str(N(3))))
    hold off;
end
    
function [] = drawSecond(handles)
% DRAWSECOND - funkcja rysuj¹ca prawy wykres
% handles - uchwyty kontrolek w GUI
    global N;
    global xMin;
    global xMax;
    global krok;
    x = xMin:krok:xMax;
    axes(handles.axes2);
    cla;
    hold on;
    axis([xMin, xMax, -3, 3]);
    title('B³¹d bezwzglêdny przybli¿enia funkcji');
    xlabel('wartosc x'); ylabel('wartosc y');
    opis = 'N='
    if((get(handles.aktywny1,'Value') == get(handles.aktywny1,'Max')))
        plot(x, szeregBlad(x, N(1)), 'g--');
    end
    
    if((get(handles.aktywny2,'Value') == get(handles.aktywny2,'Max')))
        plot(x, szeregBlad(x, N(2)), 'b-.');
    end
    
    if((get(handles.aktywny3,'Value') == get(handles.aktywny3,'Max')))
        plot(x, szeregBlad(x, N(3)), 'r:');
    end
    legend(strcat(opis,int2str(N(1))), strcat(opis,int2str(N(2))), strcat(opis,int2str(N(3))))
    hold off;
end


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global N;
global xMin;
global xMax;
global krok;
N=[1,2,3];
xMin = 0;
xMax = 8;
krok = 0.1;
drawFirst(handles);
drawSecond(handles);

% Get default command line output from handles structure
varargout{1} = handles.output;
end

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global N;
N(1)=int32(get(hObject, 'Value'));
set(handles.wartosc_1, 'String', int2str(N(1)))
drawFirst(handles);
drawSecond(handles);
end

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end

% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global N;
N(2)=int32(get(hObject, 'Value'));
set(handles.wartosc_2, 'String', int2str(N(2)))
drawFirst(handles);
drawSecond(handles);
end

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global N;
N(3)=int32(get(hObject, 'Value'));
drawFirst(handles);
drawSecond(handles);
set(handles.wartosc_3, 'String', int2str(N(3)))
end

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end



function xMin_Callback(hObject, eventdata, handles)
% hObject    handle to xMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xMin as text
%        str2double(get(hObject,'String')) returns contents of xMin as a double
global xMin;
xMin = str2double(get(hObject,'String'))
drawFirst(handles);
drawSecond(handles);
end

% --- Executes during object creation, after setting all properties.
function xMin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function xMax_Callback(hObject, eventdata, handles)
% hObject    handle to xMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xMax as text
%        str2double(get(hObject,'String')) returns contents of xMax as a double
global xMax;
xMax = str2double(get(hObject,'String'))
drawFirst(handles);
drawSecond(handles);
end

% --- Executes during object creation, after setting all properties.
function xMax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
global krok;
krok = str2double(get(hObject,'String'))
drawFirst(handles);
drawSecond(handles);
end

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
end


% --- Executes on button press in aktywny1.
function aktywny1_Callback(hObject, eventdata, handles)
% hObject    handle to aktywny1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of aktywny1
drawFirst(handles);
drawSecond(handles);
end

% --- Executes on button press in aktywny2.
function aktywny2_Callback(hObject, eventdata, handles)
% hObject    handle to aktywny2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of aktywny2
drawFirst(handles);
drawSecond(handles);
end

% --- Executes on button press in aktywny3.
function aktywny3_Callback(hObject, eventdata, handles)
% hObject    handle to aktywny3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of aktywny3
drawFirst(handles);
drawSecond(handles);
end
