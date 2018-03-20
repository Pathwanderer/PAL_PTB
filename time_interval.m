clear;
close;
excelname=['DrawInterval_invalid long_done ']; 
Raw=xlsread(excelname);
[row,column]=size(Raw);
i=row;

X=1;T=1;  %X是由时间来判断此行时间间隔是属于任务前或后的条件；T是trial次数
cc=1;     %cc,每个trial的第一次扣指在总trial中的顺序
p=[];
q=[];
k1=[]; k2=[];    %用来存储依据条件安排的结构
Res=[];   %用来存储最后的结果

for i=1:i
if Raw(i,1)>=0&&Raw(i,1)<=8
    X(i)=1; p=[p Raw(i,2)];
elseif Raw(i,1)>=9.5&&Raw(i,1)<=13
    X(i)=2; q=[q Raw(i,2)];
end

% k(2,i-cc+1:,T)=Raw(i,2);
    
if i>1
if Raw(i,1)<Raw(i-1,1)
    cc=i;
    k1=mean(p);
    k2=mean(q);    
    Res(T,1)=T;
    Res(T,2)=k1;
    Res(T,3)=k2;
    p=[];q=[];
    T=T+1;
end 
end
end

save

fid=fopen('Result.txt','a+');
    fprintf(fid,'%g\r\n',Res);
    fclose(fid)


