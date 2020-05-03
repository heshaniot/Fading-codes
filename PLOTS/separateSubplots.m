%   Root
%   Figure    (3)
%   Figure    (2)
%   Figure    (1)
%   Legend    (Polar-1/3, Polar-1/2, Polar-2/3)
%   Axes
%   Legend    (Polar-1/3, Polar-1/2, Polar-2/3)
%   Axes
%   Legend    (LDPC-1/3, LDPC-1/2, LDPC-2/3)
%   Axes
%   Legend    (LDPC-1/3, LDPC-1/2, LDPC-2/3)
%   Axes
%   Legend    (Turbo-1/3, Turbo-1/2, Turbo-2/3)
%   Axes
%   Legend    (Turbo-1/3, Turbo-1/2, Turbo-2/3)
%   Axes
%   Line      (Polar-2/3)
%   Line      (Polar-1/2)
%   Line      (Polar-1/3)
%   Line      (Polar-2/3)
%   Line      (Polar-1/2)
%   Line      (Polar-1/3)
%   Line      (LDPC-2/3)
%   Line      (LDPC-1/2)
%   Line      (LDPC-1/3)
%   Line      (LDPC-2/3)
%   Line      (LDPC-1/2)
%   Line      (LDPC-1/3)
%   Line      (Turbo-2/3)
%   Line      (Turbo-1/2)
%   Line      (Turbo-1/3)
%   Line      (Turbo-2/3)
%   Line      (Turbo-1/2)
%   Line      (Turbo-1/3)


clear all;
close all;
N = 128;

% names=str
name1 = 'Turbo';
name2 = 'LDPC';
name3 = 'Polar';

% names = ['Turbo';'LDPC ';'Polar'];
% names1 = strtrim(names);
h_arr = [];
l = gobjects(2,9);

for i=1:3
%     close all;
    name = eval(sprintf('name%d',i));
    figName = sprintf(['N%d_%s_fading.fig'],N,name);
    open(figName);
    h = findobj ;
    
%     switch i
%         case 1 % Turbo
%             l(1,[1,5,9])= h([10,9,8]);
%             l(2,[1,5,9])= h([7,6,5]);
%         case 2 %Polar
%             l(1,[2,6,10])= h([10,9,8]+9);
%             l(2,[2,6,10])= h([7,6,5]+9);
%         case 3 %LDPC
%             l(1,[3,7,11])= h([14,10,6]+18);
%             l(2,[3,7,11])= h([16,12,8]+18);
%             l(1,[4,8,12])= h([13,9,5]+18);
%             l(2,[4,8,12])= h([15,11,7]+18);
%     end
%     h_arr = [h_arr; h]
end



l(1,[1,2,3])= h([34,33,32]);
l(2,[1,2,3])= h([31,30,29]);

l(1,[4,5,6])= h([28,27,26]);
l(2,[4,5,6])= h([25,24,23]);

l(1,[7,8,9])= h([22,21,20]);  %L=1
l(2,[7,8,9])= h([19,18,17]);


% l(1,[4,8,12])= h([21,19,17]);  %L=8
% l(2,[4,8,12])= h([15,13,11]);
% 

% a=  1



style1 = '-.diamond'; 
style2 = '-.v';  
style3 = '-.h'; 
% style4 = '-.p'; 
style4 = '--diamond'; 
style5 = '--v';  
style6 = '--h'; 
% style8 = '--p';
style7 = '-diamond'; 
style8= '-v';  
style9 = '-h'; 
% style12 = '-p'; 
figure;

col1 = 'b';
col2 = 'g';
col3 = 'm' ;
col4 = 'r' ;
%  ivec =1:9;
ivec = [1 4 7 2 5 8 3 6 9]
% ivec = [1:1:2 4:1:6 8:1:10 12];
for iind =1:length(ivec)
%     'Color',[0,0,0]
 i = ivec(iind);
  colval = mod(iind,3);
  
  switch colval
      case 1
          col = col1;
      case 2
          col = col2;
      case 0
          col = col3;
  end
      
    
    style = eval(sprintf('style%d',iind));

    subplot(211)
    %for black and white
%     semilogy(l(1,i).XData,l(1,i).YData,style,'Color',[0,0,0]);
    semilogy(l(1,i).XData,l(1,i).YData,style,'Color',col);
    hold on;
    
    subplot(212)
    semilogy(l(2,i).XData,l(2,i).YData,style,'Color',col);
%     semilogy(l(2,i).XData,l(2,i).YData,style,'Color',[0,0,0]);
    hold on;
    
end


subplot(211)
% legend('Turbo 1/3','LDPC 1/3','Polar 1/3 SC','Turbo 1/2','LDPC 1/2','Polar 1/2 SC','Turbo 2/3','LDPC 2/3','Polar 2/3 SC');
% legend('Turbo 1/3','LDPC 1/3','Polar 1/3 SC','Polar 1/3 SCL with L=8','Turbo 1/2','LDPC 1/2','Polar 1/2 SC','Polar 1/2 SCL with L=8','Turbo 2/3','LDPC 2/3','Polar 2/3 SC','Polar 2/3 SCL with L=8');
legend('Turbo 1/3','LDPC 1/3','Polar 1/3 ','Turbo 1/2','LDPC 1/2','Polar 1/2','Turbo 2/3','LDPC 2/3','Polar 2/3 ');

grid on
xlim([0 6])
ylim([0.0001 1])
xlabel('E_b /N_0 (dB)');
ylabel('BLER')

subplot(212)
% legend('Turbo 1/3','LDPC 1/3','Polar 1/3 SC','Polar 1/3 SCL with L=8','Turbo 1/2','LDPC 1/2','Polar 1/2 SC','Polar 1/2 SCL with L=8','Turbo 2/3','LDPC 2/3','Polar 2/3 SC','Polar 2/3 SCL with L=8');
% legend('Turbo 1/3','LDPC 1/3','Polar 1/3 SC','Turbo 1/2','LDPC 1/2','Polar 1/2 SC','Turbo 2/3','LDPC 2/3','Polar 2/3 SC');
legend('Turbo 1/3','LDPC 1/3','Polar 1/3 ','Turbo 1/2','LDPC 1/2','Polar 1/2','Turbo 2/3','LDPC 2/3','Polar 2/3 ');

grid on
xlabel('E_b /N_0 (dB)')
ylabel('BER')
xlim([0 6])
ylim([0.00001 1])



