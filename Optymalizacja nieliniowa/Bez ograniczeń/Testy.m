
x0 = [-2, -3, -3]

options = optimset('GradObj','on'); 
[xmin,fval,exitflag,output]  = fminunc(@fun, x0, options);
disp(sprintf('*** minimum funkcji (fminunc) wynosi %f w punkcie (%f, %f, %f)  iteracji jest: %f ***\n',fval,xmin,output.iterations))

[xmin,fval,exitflag,output]  = fminsearch(@fun,x0);
disp(sprintf('*** minimum funkcji (fminsearch) wynosi %f w punkcie (%f, %f, %f)  iteracji jest: %f ***\n',fval,xmin,output.iterations))


[xmin,fval,it]=BFGS(@fun,x0,1e-6);
disp(sprintf('*** min BFGS-gold wynosi %f w punkcie (%f, %f, %f)  iteracji jest: %f ***\n',fval,xmin,it))

[xmin,fval,it]=NajszybszySpadek(@fun,x0,1e-4);
disp(sprintf('*** min NajszybszySpadek wynosi %f w punkcie (%f, %f, %f)  iteracji jest: %f ***\n',fval,xmin,it))

[xmin,fval,it]=GaussSeidel(@fun,x0,1e-6, 300);
disp(sprintf('*** min GaussSeidel wynosi %f w punkcie (%f, %f, %f)  iteracji jest: %f ***\n',fval,xmin,it))

[xmin,fval,it]=BFGS_mPoint(@fun,x0,1e-6);
disp(sprintf('*** min BFGS-mPoint wynosi %f w punkcie (%f, %f, %f)  iteracji jest: %f ***\n',fval,xmin,it))

%[xmin,fval,it]=Powell(@fun,x0,1e-6);
%disp(sprintf('*** min Powell-gold wynosi %f w punkcie (%f, %f, %f)  iteracji jest: %f ***\n',fval,xmin,it))

%[xmin,fval,it]=Powell_mPoint(@fun,x0,1e-6);
%disp(sprintf('*** min Powell-mPoint wynosi %f w punkcie (%f, %f, %f)  iteracji jest: %f ***\n',fval,xmin,it))