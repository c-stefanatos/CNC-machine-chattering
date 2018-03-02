function [ y,u,n,xronos] = chatter( b,Mr,k1,k2,c1,c2,m,a1,a2,beta,hav,ks )
dt=0.0001;
i=1000;%#dt for 1 piece revolution
x1(1:Mr)=0; 
x2(1:Mr)=0;
y(1:Mr)=0;
xronos(1:Mr)=0;
xd1=0; 
xd2=0;
for n=1:Mr
if n<(i+1)%still in first pass
F(n)=ks*b*(hav-y(n));% b variable in mm , y in m
else
F(n)=ks*b*(hav-y(n)+y(n-i));
end
if F(n)<0
F(n)=0;
end
F1=F(n)*cosd(beta-a1);
F2=F(n)*cosd(beta-a2);
xdd1=(F1-c1*xd1-k1*x1(n))/m;
xd1=xd1+xdd1*dt;
x1(n+1)=x1(n)+xd1*dt;
xdd2=(F2-c2*xd2-k2*x2(n))/m;
xd2=xd2+xdd2*dt;
x2(n+1)=x2(n)+xd2*dt;
y(n)=x1(n)*cosd(a1)+x2(n)*cosd(a2);
u(n)=x1(n)*sind(a1)+x2(n)*sind(a2);
xronos(n)=n*dt;%seconds
end
end