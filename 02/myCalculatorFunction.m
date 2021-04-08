function returnValue = myCalculatorFunction(varargin)

% Aufruf: myCalculatorFunction('Value1',5,'Operator','+','Value2',9)

%Eingabe abfrage forloop :
for i = 1:length(varargin)
    if strcmp(varargin{i},'value1')
        value1 = varargin{i + 1};
    elseif strcmp(varargin{i}, 'value2')
        value2 = varargin{i + 1};
    elseif strcmp(varargin{i}, 'Operator')
        operator = varargin{i + 1};
    end
end

%Switch add, sub, mul, div 

switch operator
    case '+' 
        returnValue = value1 + value2;
    case '-'
        returnValue = value1 - value2;
    case '*'
        returnValue = value1 * value2;
    case  '/'
        if value2 == 0
            error('div null');
        else
            returnValue = value1 / value2;
        end
    otherwise 
        error('not valid Operator');
end
end