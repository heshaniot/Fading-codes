%  N=[128 256 512 1024];
% N_vec = [128];

function polar_N1024_12(ebn) 

display('====================================================')

N=1024;
L_vec = [8];
MCsize=1e5; %Monte Carlo size
% %to startparpool
% N=128;
% L_vec = [1];
% MCsize=1e1; %Monte Carlo size

EbN0dBrange=ebn;
designSNRdB=2;

%  fprintf('N=%d L=%d MCsize=%d',N,L,MCsize);

start = tic

format long
 
label =12;

for n=1:length(L_vec)
    L = L_vec(n);
    K=512 ; %Rate 1/2
    fprintf('QPSK N=%d K=%d L=%d MCsize=%d \n',N,K,L,MCsize);
    plotPC_save1by1_RTupdate(N,K,L,EbN0dBrange,designSNRdB,MCsize,label)
 
end

% legend('8','4','2');
toc(start)