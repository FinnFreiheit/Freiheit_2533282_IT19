% Funktion: Pro Datei maximal eine Funktion 

function [returnvalue1, returnvalue2]= funktionErste(varargin)

% Funktionsaufruf : funktionErste('value1',1,'value2',2)

for i = 1:length(varargin)
    if strcmp(varargin(i),'value1')
        value1 = varargin(i + 1);
    elseif strcmp(varargin(i), 'value2')
        value2 = varargin(i + 1);
    end
end


%return muss im Kopf definiert werden mit Name des rueckgabe wertes
returnvalue1 = value1 + value2; 
returnvalue2 = value1 - value2; 

end 