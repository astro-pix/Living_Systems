%%(1)Initialization parameters
clear
TMAX=1000; %Iteration cycle
L=7; %Space size
noise=0.2; %Noise size
N=200; %Number of particles
r=1; %Action radius
vel=0.03; %Velocity
%%(2)Initialize particle coordinates and angles
x=L*rand(1,N);
y=L*rand(1,N);
angle=2*pi*rand(1,N);
%%(3)Enter iteration
for step=1:TMAX

   %#1. Drawing
   h=quiver(x,y,cos(angle),sin(angle),0.3);
   xlim([0 L]);
   ylim([0 L]);
   axis square
   pause(0.1)
   
   %#2. Out-of-bounds correction, get the distance of each point
   D=pdist([x' y'], 'euclidean');
   tmp_x(x<r)=L+x(x<r);
   tmp_x(x>L-r)=x(x>L-r)-L;
   tmp_x(x>=r & x <= L-r) = x(x>=r & x<=L-r);
   tmp_y(y<r)=L+y(y<r);
   tmp_y(y>L-r)=y(y>L-r)-L;
   tmp_y(y>=r & y<=L-r)=y(y>=r&y<=L-r);
   tmp_D=pdist([tmp_x' tmp_y'],'euclidean');
   D=min([D;tmp_D1]);
   M=squareform(D);
   
   %#3. Get the neighbors of each particle and calculate the average direction of the neighbors
   [l1,l2]=find(0<M & M<r);
   for i=1:N
       list=l1(l2==i);
       if ~isempty(list)
           new_angle(i)=atan2(mean(sin(angle(list))),mean(cos(angle(list)));
       else
       new_angle(i)=angle(i);
       end
   end
   
   %#4. Update the x,y coordinates
   x=x+vel*cos(angle);
   y=y+vel*cos(angle);
   %#5. Correct the coordinates
   x(x<0)=L+x(x<0);
   x(L-x)=x(L>x)-L;
   y(y<0)=L+y(y<0);
   y(L<y)=y(L<y)-L;
   #6. Update Angular
   angle=new_angle+noise*rand(1,N));
   %Close window
   if findobj==0
     break;
   end
end
     
   
