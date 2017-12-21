
x0 = [5, -2, -3]

options = optimset('GradObj','on'); 
[xmin,fval,exitflag,output]  = fminunc(@fun, x0, options);
disp(sprintf('[*] min funkcji (fminunc) = %f ;x = (%f, %f, %f) ;it =: %f [*]\n',fval,xmin,output.iterations))

[xmin,fval,exitflag,output]  = fminsearch(@fun,x0);
disp(sprintf('[*] min funkcji (fminsearch) = %f ;x = (%f, %f, %f) ;it =: %f [*]\n',fval,xmin,output.iterations))

[xmin,fval,it]=BFGS(@fun,x0,1e-6);
disp(sprintf('[*] min BFGS = %f ;x = (%f, %f, %f) ;it =: %f [*]\n',fval,xmin,it))

[xmin,fval,it]=NajszybszySpadek(@fun,x0,1e-4);
disp(sprintf('[*] min NajszybszySpadek = %f ;x = (%f, %f, %f) ;it =: %f [*]\n',fval,xmin,it))

[xmin,fval,it]=GaussSeidel(@fun,x0,1e-6, 300);
disp(sprintf('[*] min GaussSeidel = %f ;x = (%f, %f, %f) ;it =: %f [*]\n',fval,xmin,it))

[xmin,fval,it]=Newton(@fun,x0,1e-6);
disp(sprintf('[*] min Newton = %f ;x = (%f, %f, %f) ;it =: %f [*]\n',fval,xmin,it))

[xmin,fval,it]=Raphson(@fun,x0,1e-6);
disp(sprintf('[*] min Raphson = %f ;x = (%f, %f, %f) ;it =: %f [*]\n',fval,xmin,it))

[xmin,fval,it]=DFP(@fun,x0,1e-6);
disp(sprintf('[*] min DFP = %f ;x = (%f, %f, %f) ;it =: %f [*]\n',fval,xmin,it))

[xmin,fval,it]=Hooke(@fun, x0, 1e-3);
disp(sprintf('[*] min Hooke = %f ;x = (%f, %f, %f) ;it =: %f [*]\n',fval,xmin,it))

%[xmin,fval,it]=Powell(@fun,x0,1e-6);
%disp(sprintf('[*] min Powell-gold = %f ;x = (%f, %f, %f) ;it =: %f [*]\n',fval,xmin,it))

%[xmin,fval,it]=Powell_mPoint(@fun,x0,1e-6);
%disp(sprintf('[*] min Powell-mPoint = %f ;x = (%f, %f, %f) ;it =: %f [*]\n',fval,xmin,it))