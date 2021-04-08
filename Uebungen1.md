Matrix_A = [1 ,2, 3-4i ; -1, 0, 17];
Matrix_B = [-1 ,6, 101 ; 12, 70, 17];
Matrix_I = eye(3);
Matrix_C = [-1; 12+2i; -12i];

%Aufgabe1

Ergebnis1 = Matrix_A + Matrix_B;
%Ergebnis2 = Matrix_I * Matrix_B; geht nicht
Ergebnis3 = Matrix_B + Matrix_A * Matrix_I;
%Ergebnis4 = (Matrix_I * Matrix_B)' geht nicht
%Ergebnis5 = Matrix_C + Matrix_B; geht nicht
Ergebnis6 = Matrix_I * (Matrix_B * Matrix_I)';
Ergebnis7 = 2 * Matrix_B * (Matrix_I * Matrix_C);
Ergebnis8 = Matrix_B * Matrix_C + Matrix_A;
Ergbenis9= (Matrix_I*(Matrix_A' * (Matrix_B * Matrix_C)))';

%Aufgabe2

Matrix2_A = [ 1, 2, 3-4i ; -1, 0 ,17; -1, 6, 101];
Matrix2_C = [-1, 12+2i, -12i, 0, 1, -1,16];

ErgebnisA= Matrix2_C(1:3:7);
ErgebnisB= Matrix2_C(6: -2: 1);
ErgebnisC= Matrix2_C(2: end-1);
ErgebnisD= Matrix2_A(:,1:3);