function answer =  loadAndJoin
% numDiff - Funktion um mehrere Dateien über ein Filefenster auszuwählen
% und einzulesen. Der Nutzer wird aufgefordert, einen Namen für eine
% Zieldatei anzugeben, sowie eine gewünschte Frequenz. Die einzelenen
% Dateinamen der Datensätze wird entsprechend der neuen Frequeunz
% angepasst. 

% Syntax:  [output1] = function_name(input1,input2,input3)
%                                             
%
% Inputs:
%    null
%    
%
% Outputs:
%    answer - Vom Nutzer angegebenes Zielverzeichnis und Frequenz 
%
% Example: 
%    answer = loadAndJoin
%    
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: (used in) Motorpruefstand.mlapp

% Author: Finn Freiheit 
% DHBW-Stuttgart
% Juni 2021; Last revision: 03.06.2021

%------------- BEGIN CODE --------------
%% 
%% Multiple Datei auswahl durch den User
[file,path] = uigetfile('*.mat','MultiSelect', 'on');
if isequal(file,0)
   disp('User selected Cancel');
end

%% Measurement Structs aus den Dateien werden in Data-Cell gespeichert
N = length(file);
data = cell(1,N);

if N == 1
    disp('es wurde nur eine Datei ausgewählt');
else 
    for i = 1:N
        data{i} = load([path,file{i}]).measurement; 
    end
end

%% Dateiname abfrage
prompt = {'Name der gesammt Messdatei angeben','Frequenz angeben'};
dlgtitle = 'Messdatei Dialog';

answer = inputdlg(prompt,dlgtitle);


%% Split Struct fields, Timestamp field mit der neuen Frequenz anpassen und fields wider zusammen setzten.
fields = fieldnames(data{1});
splitStrings = cell(1,length(fields));

for i = 2:length(fields)
    splitStrings{i-1} = strsplit(fields{i},'_');
    
    for k = 1:length(splitStrings{i-1})
        if strfind(splitStrings{i-1}{k},'Timestamp')
            splitStrings{i-1}{k} = strcat('Timestamp',answer{2});
        end
    end
    
    fields{i} = strjoin(splitStrings{i-1},'_');
end

%% Struct erzeugen 
compMeasurement = struct();
compMeasurement.(fields{1}) = data{1}.(fields{1});

for structInData = 1:length(data)
    orgFieldname = fieldnames(data{structInData});
    for spalte = 2:length(orgFieldname)
        temp = fields{spalte};
        compMeasurement.(temp) = data{structInData}.(orgFieldname{spalte});
    end
end
disp('end');

%% Zusammengefasste Daten in Zielverzeichnis speichern


save (string(answer{1}), 'compMeasurement');


end
%------------- End CODE --------------