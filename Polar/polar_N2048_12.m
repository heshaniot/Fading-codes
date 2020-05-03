%  N=[128 256 512 1024];
% N_vec = [128];

function polar_N2048_12() 

display('====================================================')

N=2048;
L= 8;
MCsize=1e5; %Monte Carlo size
% %to startparpool
% N=128;
% L_vec = [1];
% MCsize=1e1; %Monte Carlo size
ebn = [0 1 2 3 3.5 4 4.5 4.75];
EbN0dBrange=ebn;
designSNRdB=2;

%  fprintf('N=%d L=%d MCsize=%d',N,L,MCsize);

start = tic

format long
 
label =12;

parfor een=1:8
   EbN0dBrange = ebn(een);
    K=1024 ; %Rate 2/3
    fprintf('QPSK N=%d K=%d L=%d MCsize=%d \n',N,K,L,MCsize);
    plotPC_save1by1_RTupdate(N,K,L,EbN0dBrange,designSNRdB,MCsize,label)
 
end

% legend('8','4','2');
toc(start)