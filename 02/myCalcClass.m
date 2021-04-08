classdef myCalcClass < matlab.mixin.SetGet
    
    %Variablen
    properties(Access = private)
    result 
    value1
    value2
    end
    
    % Methoden 
    methods(Access = public)
        
        %Konstuktor muss Public
        function obj = myCalcClass(varargin)
            for i = nargin
                if strcmp(varargin{i}, 'value1')
                    obj.value1 = varargin{i + 1};
                elseif strcmp(varargin{i}, 'value2')
                    obj.value2 = varargin{i + 1};
                end
            end
        end
        
        function add(obj)
            obj.result = obj.value1 + obj.value2;
        end
        
        function value = getResult(obj)
            value = obj.result;
        end
        
    end
    
    
    
end
    