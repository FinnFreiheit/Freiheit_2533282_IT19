function achseQuest = plotQuest
% plotQuest - Funktion um den Nutzer abzufragen auf welcher Achse geplotet
% werden soll. 

% Syntax:  [output1] = function_name(input1,input2,input3)
%                                             
%
% Inputs:
%    null
%    
%
% Outputs:
%    achseQuest - Vom Nutzer angegebene Achse auf der geplotet werden soll
%
% Example: 
%    achseQuest = plotQuest
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
%% Achse abfrage
answer = questdlg('welche Y-Achse soll zugewiesen werden', ...
	' Achsen Zuweisung', ...
	'Linke Y-Achse','Rechte Y_Achse','Linke Y-Achse');
% Handle response
switch answer
    case 'Linke Y-Achse'
        achseQuest = 1;
    case 'Rechte Y_Achse'
        achseQuest = 2;
end
end 
%------------- END CODE --------------