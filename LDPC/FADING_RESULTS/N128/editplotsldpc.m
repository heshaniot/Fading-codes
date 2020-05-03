%   Root
%   Figure    (1)
%   Legend    (Turbo 1/3-AWGN, Turbo 1/2-AWGN, Turbo 2/3-AWGN, Turbo 1/3-fading, Turbo 1/2-fading, Turbo 2/3-fading)
%   Axes
%   Legend    (Turbo 1/3-AWGN, Turbo 1/2-AWGN, Turbo 2/3-AWGN, Turbo 1/3-fading, Turbo 1/2-fading, Turbo 2/3-fading)
%   Axes
%   Line      (Turbo 2/3-fading)
%   Line      (Turbo 1/2-fading)
%   Line      (Turbo 1/3-fading)
%   Line      (Turbo 2/3-AWGN)
%   Line      (Turbo 1/2-AWGN)
%   Line      (Turbo 1/3-AWGN)
%   Line      (Turbo 2/3-fading)
%   Line      (Turbo 1/2-fading)
%   Line      (Turbo 1/3-fading)
%   Line      (Turbo 2/3-AWGN)
%   Line      (Turbo 1/2-AWGN)
%   Line      (Turbo 1/3-AWGN)
% function editPlots()
% 
% subplot(211)
% legend('Turbo 1/3-AWGN','Turbo 1/2-AWGN','Turbo 2/3-AWGN','Turbo 1/3-fading','Turbo 1/2-fading','Turbo 2/3-fading');
% 
% grid on
% xlim([0 6])
% ylim([0.0001 1])
% xlabel('E_b /N_0 (dB)');
% ylabel('BLER')
% 
% subplot(212)
% legend('Turbo 1/3-AWGN','Turbo 1/2-AWGN','Turbo 2/3-AWGN','Turbo 1/3-fading','Turbo 1/2-fading','Turbo 2/3-fading');
% 
% grid on
% xlabel('E_b /N_0 (dB)')
% ylabel('BER')
% xlim([0 6])
% ylim([0.00001 1])
% 


clear all;
close all;
N = 512;

% names=str
% name1 = 'Turbo';
% name2 = 'LDPC';
% name3 = 'Polar';

% names = ['Turbo';'LDPC ';'Polar'];
% names1 = strtrim(names);
h_arr = [];
l = gobjects(2,6);

% for i=1:3
%     close all;
%     name = eval(sprintf('name%d',i));
    figName = sprintf('LDPC_N128_AWGN_vs_fading.fig',N);
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
% end


%Turbo-AWGN
l(1,[1,2,3])= h([18,17,16]); %BLER
l(2,[1,2,3])= h([12,11,10]); %BER

%Turbo-fading
l(1,[4,5,6])= h([15,14,13]); %BLER
l(2,[4,5,6])= h([9,8,7]); %BER





style1 = '-.diamond'; 
% style2 = '-.v';  
% style3 = '-.h'; 
% style4 = '-.p'; 
% style2 = '--diamond'; 
style2 = '--v';  
% style7 = '--h'; 
% style8 = '--p';
% style3 = '-diamond'; 
% style10= '-v';  
style3 = '-h'; 
% style12 = '-p'; 
figure;

col1 = 'b';
col2 = 'g';
col3 = 'm' ;
col4 = 'r' ;
 
% ivec = [1:1:2 4:1:6 8:1:10 12];
% % for i =1:length(ivec)
% %     'Color',[0,0,0]
%  i = ivec(iind);
%   colval = mod(i,4);
for i =1:3
    style = eval(sprintf('style%d',i));

    subplot(211)
   
%     semilogy(l(1,i).XData,l(1,i).YData,style,'Color',[0,0,0]);
    semilogy(l(1,i).XData,l(1,i).YData,style,'Color',col1);
    hold on;
    semilogy(l(1,i+3).XData,l(1,i+3).YData,style,'Color',col2);
   legend('LDPC 1/3-AWGN','LDPC 1/3-fading','LDPC 1/2-AWGN','LDPC 1/2-fading','LDPC 2/3-AWGN','LDPC 2/3-fading');

    xlim([0 5])
    ylim([0.001 1])
    xlabel('E_b /N_0 (dB)');
    ylabel('BLER')
    grid on;
    
    subplot(212)
    semilogy(l(2,i).XData,l(2,i).YData,style,'Color',col1);
    hold on;
    semilogy(l(2,i+3).XData,l(2,i+3).YData,style,'Color',col2);
   legend('LDPC 1/3-AWGN','LDPC 1/3-fading','LDPC 1/2-AWGN','LDPC 1/2-fading','LDPC 2/3-AWGN','LDPC 2/3-fading');

    grid on;
    grid on
    xlabel('E_b /N_0 (dB)')
    ylabel('BER')
    xlim([0 5])
    ylim([0.0001 1])

end
% 
%   switch colval
%       case 1
%           col = col1;
%       case 2
%           col = col2;
%       case 3
%           col = col3;
%       case 0
%           col = col4;
%   end
%       
%     
%     style = eval(sprintf('style%d',i));
% 
%     subplot(211)
%     %for black and white
% %     semilogy(l(1,i).XData,l(1,i).YData,style,'Color',[0,0,0]);
%     semilogy(l(1,i).XData,l(1,i).YData,style,'Color',col);
%     hold on;
%     
%     subplot(212)
%     semilogy(l(2,i).XData,l(2,i).YData,style,'Color',col);
% %     semilogy(l(2,i).XData,l(2,i).YData,style,'Color',[0,0,0]);
%     hold on;
%     
% end
% 
% 
% subplot(211)
% % legend('Turbo 1/3','LDPC 1/3','Polar 1/3 SC','Turbo 1/2','LDPC 1/2','Polar 1/2 SC','Turbo 2/3','LDPC 2/3','Polar 2/3 SC');
% % legend('Turbo 1/3','LDPC 1/3','Polar 1/3 SC','Polar 1/3 SCL with L=8','Turbo 1/2','LDPC 1/2','Polar 1/2 SC','Polar 1/2 SCL with L=8','Turbo 2/3','LDPC 2/3','Polar 2/3 SC','Polar 2/3 SCL with L=8');
% legend('Turbo 1/3','LDPC 1/3','Polar 1/3 SCL with L=8','Turbo 1/2','LDPC 1/2','Polar 1/2 SCL with L=8','Turbo 2/3','LDPC 2/3','Polar 2/3 SCL with L=8');
% 
% grid on
% xlim([0 6])
% ylim([0.0001 1])
% xlabel('E_b /N_0 (dB)');
% ylabel('BLER')
% 
% subplot(212)
% % legend('Turbo 1/3','LDPC 1/3','Polar 1/3 SC','Polar 1/3 SCL with L=8','Turbo 1/2','LDPC 1/2','Polar 1/2 SC','Polar 1/2 SCL with L=8','Turbo 2/3','LDPC 2/3','Polar 2/3 SC','Polar 2/3 SCL with L=8');
% % legend('Turbo 1/3','LDPC 1/3','Polar 1/3 SC','Turbo 1/2','LDPC 1/2','Polar 1/2 SC','Turbo 2/3','LDPC 2/3','Polar 2/3 SC');
% legend('Turbo 1/3','LDPC 1/3','Polar 1/3 SCL with L=8','Turbo 1/2','LDPC 1/2','Polar 1/2 SCL with L=8','Turbo 2/3','LDPC 2/3','Polar 2/3 SCL with L=8');
% 
% grid on
% xlabel('E_b /N_0 (dB)')
% ylabel('BER')
% xlim([0 6])
% ylim([0.0001 1])
% 
% 
% 
