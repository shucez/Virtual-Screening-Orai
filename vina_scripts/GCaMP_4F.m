%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Suitable for dealing Fura-2 calcium imaging data from the
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%microscope on the 4th floor---Zhang Shuce
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%---Zhang Shuce Oct.22, 2015
clear;
bg = 2;
raw=xlsread('1.xlsx'); %%%%%%% Please copy all [but the second --"Markers"] colomns to 1.xlsx
dim=size(raw); % obtain the size of the matrix
Ln=dim(1,1); % Number of Time data points
Col=dim(1,2); % Number of colums
NN=1; % normalizing factor to make resting ratio close to 1
region=(Col-1)/4;
time=60*(raw(1:Ln,1)-raw(1,1)); % use this line if raw time is in min
%time=raw(1:Ln,1)-raw(1,1); % use this line if raw time is in sec
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Calculating the corrected ratio
rawF = raw(:,3:4:4*region-1);
for l=1:Ln
    F(l,:) = rawF(l,:) - rawF(l,bg);
end
F(:,bg)=[];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Please edit the following part according to your own experiment degign 
i=1;
for j=1:Ln-1
    itv(j)=time(j+1,1)-time(j,1); % itv: interval after the current time point
    if j>1 & itv(j)>5 % 5 is the least time gap for pausing you're expected to change solutions
        t(i)=time(j+1); % raw time points at which solution change occurs
        bbase(i)=j+1; % relative time points at which solution change occurs
        i=i+1;
    else
        i=i;
    end
end
bbase(i)=Ln+1;
change=numel(bbase)-1;
for l=1:Ln
    ratio(l,:) = F(l,:)./mean(F(1:bbase(1)-1,:)) - 1;
end
apeak(1,:)=mean(ratio(1:bbase(1)-1,:));
for k=1:change
%     apeak(k+1,:)=(mean(ratio(bbase(k):bbase(k+1)-1,:))-apeak(1,:));
    apeak(k+1,:)=(mean(ratio(bbase(k+1)-5:bbase(k+1)-1,:))-apeak(1,:));
    k=k+1;
end
for r=1:region-1
    apeak(k+1,r)=-(apeak(k,r)-apeak(k-1,r))./apeak(k-1,r)*100;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Exporting data to prism
data(:,1)=time;
data(:,2:region)=ratio(1:Ln,:);%-rest;
dlmwrite('0signal.txt', data); % export peak/plateau values
dlmwrite('0apeak.txt', apeak'); % export peak/plateau values
plot(data(1:Ln,1),mean(ratio'),'LineWidth',10,'Color',[.3 0 0]); hold on;
plot(data(1:Ln,1),ratio);  % plot the raw ratio of all individual cells