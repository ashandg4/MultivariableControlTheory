clc;
clear;
format short;
A1 = [1.667  1.667;
      0.5   -0.5];
A2 = [1 2;
      3 4;
      5 6];
A3 = [5 4 3;
      4 3 2;
      3 2 1];
A4 = [2   -2   -2/3;
      2/3  2   -2;
      2/5  2/3  2];
A = {A1,A2,A3,A4};
for k = 1:4 
    [U,S,V] = svd(A{k});
    
    fprintf('U =\n');
    disp(U);
    
    fprintf('S =\n');
    disp(S);
    
    fprintf('V =\n');
    disp(V);
 
    fprintf('Singular Values =\n');
    disp(diag(S));   
    % Verify A = U*S*V'
    fprintf('U*S*V'' =\n');
    disp(U*S*V');
end