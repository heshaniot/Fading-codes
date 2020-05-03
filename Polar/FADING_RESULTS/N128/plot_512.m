% [0 1 2 3],
%     1.5 2.5
clear all
% close all
EbNo_mat1 = -3:1:2;
EbNo_mat2 =EbNo_mat1;
EbNo_mat3 = EbNo_mat1 ;


% EbNo_mat2=  [0 0.5 1      1.5   2 2.5 2.75];
% EbNo_mat3 = [0 0.5 1 1.5  2     2.5   3 3.5 3.75 ];

%%%%%-------128
% R_vec = [13  12 23];
% K_vec = [43 64 85];
% N_vec = [128 128 128];

%%%%%-------1024
R_vec = [13 12 23 ];
K_vec = [170 256 341];
N_vec = [512 512 512];


file = 'N512';
L=1;
for r = 1:length(R_vec)
    R = R_vec(r);
    K = K_vec(r);
    N = N_vec(r);
    
    ebno = eval(sprintf('EbNo_mat%d',r));
    EbNo_vec = ebno ;
    EbNo = [];
    BLER = [];
    BER = [];
    for i=1:length(EbNo_vec)
        
        load(sprintf('Polar_N%d_K%d_R%d_L8_%.2fdB_1e5_CRC8.mat',N,K,R,EbNo_vec(i)));     
        EbNo = [EbNo results.EbNo];
        BLER = [BLER results.FER];
        BER = [BER results.BER];
               
    end
    
     Results.EbNo = EbNo;
     Results.BLER = BLER;
     Results.BER = BER ;
     
     filename = sprintf('Polar_N%d_R%d',N,R);
     save(filename,'Results')

    subplot(211)
    semilogy(Results.EbNo+3,Results.BLER);
    hold on;
%     xlim([0 4])
    grid on
    title('')
    
    subplot(212)
    semilogy(Results.EbNo+3,Results.BER);
    
    hold on;
    grid on
%     xlim([0 4])

    
end
subplot(211)
legend('Polar-1/3 bler','Polar-1/2 bler ','Polar-2/3 bler');

subplot(212)
legend('Polar-1/3 ber','Polar-1/2 ber ','Polar-2/3 ber');


