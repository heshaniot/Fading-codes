% [0 1 2 3],
%     1.5 2.5
EbNo_mat1 = [0 0.5 0.75 1 1.5  1.75 2 2.5];
EbNo_mat2=  [0 0.5 0.75 1 1.5  1.75 2 2.25 2.5 3.25];
EbNo_mat3 = [0 0.5 1 1.5 1.75 2 2.5 3 3.25];

R_vec = [13  12    23];
K_vec = [672 1008  1344];
N=2028;
file = 'N2048';
L=1;
for r = 1:length(R_vec)
    R = R_vec(r);
    K = K_vec(r);
    ebno = eval(sprintf('EbNo_mat%d',r));
    EbNo_vec = ebno ;
    EbNo = [];
    FER = [];
    BER = [];
    for i=1:length(EbNo_vec)
        
        load(sprintf('%s/Turbo_R%d_QAM_N%d_K%d_Iter6_%.2fdB_1e4.mat',file,R,N,K,EbNo_vec(i)));     
        EbNo = [EbNo Results.EbNo];
        FER = [FER Results.FER];
        BER = [BER Results.BER];
               
    end
    
     Results.EbNo = EbNo;
     Results.FER = FER;
     Results.BER = BER ;
     
     filename = sprintf('%s/Turbo_N%d_R%d',file,N,R);
     save(filename,'Results')
     

    subplot(211)
    semilogy(Results.EbNo,Results.FER);
    hold on;
    xlim([0 4])
    ylim([0.0001 1])
    subplot(212)
    semilogy(Results.EbNo,Results.BER);
    hold on;
   xlim([0 4])
    ylim([0.00001 1])
    
end

