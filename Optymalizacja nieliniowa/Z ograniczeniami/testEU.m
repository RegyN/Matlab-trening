D= [9,4,5;
    4,1,1;
    5,1,2];
c=[-18;
   -5;
   -7];
A=[0,1,1];
b=2;

[x,val,exitFlag] = EliminacjaUogolniona(D,c,A,b)
[x1,val1,exitFlag1] = EliminacjaUogolnionaQR(D,c,A,b)