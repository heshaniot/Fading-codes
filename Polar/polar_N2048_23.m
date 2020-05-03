%  N=[128 256 512 1024];
% N_vec = [128];

function polar_N2048_23() 

display('====================================================')

N=2048;
L= 8;
MCsize=1e5; %Monte Carlo size
% %to startparpool
% N=128;
% L_vec = [1];
% MCsize=1e1; %Monte Carlo size
ebn = [0 1 2 3 4 4.5 5];
EbN0dBrange=ebn;
designSNRdB=2;

%  fprintf('N=%d L=%d MCsize=%d',N,L,MCsize);

start = tic

format long
 
label =23;

parfor een=1:7
   EbN0dBrange = ebn(een);
    K=1365 ; %Rate 2/3
    fprintf('QPSK N=%d K=%d L=%d MCsize=%d \n',N,K,L,MCsize);
    plotPC_save1by1_RTupdate(N,K,L,EbN0dBrange,designSNRdB,MCsize,label)
 
end

% legend('8','4','2');
toc(start)