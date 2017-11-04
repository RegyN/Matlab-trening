function [x,exitflag] = sympleksGotowiec(f,A,b,lb)
    b=b-dot(A,ones(size(A,1),1)*lb,2)';
    f=[f zeros(1,size(A,1))];
    A=[A eye(size(A,1))];
    z=zeros(size(A,2),1);
    zc=-f;
    c=f;
    bf=b';
    cb=zeros(size(A,1),1);
    indices=size(A,2)-size(A,1)+1:size(A,2);
    while any(zc<0);
        [~,in]=min(zc);
        if not(any(A(:,in)>0))
            exitflag=0;
            return
        end
        set=bf./A(:,in);
        set(A(:,in)<0)=inf;
        [~,out]=min(set);
        outg=indices(out);
        bf(out)=bf(out)/A(out,in);
        A(out,:)=A(out,:)./A(out,in);
        cb(out)=c(in);
        Mul=(A(:,in)./A(out,:)(:,in));
        Mul(out)=0;
        bf=bf-bf(out)*Mul;
        Dif=(A(:,in)./A(out,:)(:,in))*A(out,:);
        Dif(out,:)=zeros(1,size(A,2));
        disp('aktualna tabelka sympleksowa:')
        A=A-Dif;
        disp(A)
        z=dot(A,cb*ones(1,size(A,2)));
        zc=z-c;
        disp('aktualne indeksy bazowe:')
        indices(out)=in;
        disp(indices)
    end
    x=[lb zeros(1,size(A,1))];
    x(indices(:))=x(indices(:))+bf(:)';
    x=x(1:length(lb));
    exitflag=1;
end