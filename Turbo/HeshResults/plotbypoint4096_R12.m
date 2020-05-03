function plotbypoint4096_R12

clear all;

EbNo_vec =  [0 0.5 0.75  1 1.25 1.5 1.75  2];
 iter =     [2 2   3     3 3    3   5     4];

% EbNo_vec =  [0 1 1.5 1.75 2 2.5 2.75];
% iter =      [2 3 3   3    4  5  5];

EbNo = [];
BLER = [];
BER = [];

for point=1:length(EbNo_vec)
%     LDPC_N2040_K1360_R23_QAM_OMS_Iter40_1e4_EbNo0.00_point1
    str = sprintf('Turbo_R12_QAM_N4044_K2016_Iter6_%.2fdB_1e%d.mat',EbNo_vec(point),iter(point));
%     LDPC_N2040_K1020_R12_QAM_OMS_Iter40_1e4_EbNo0.00_point1.mat
    load(str);
    
    EbNo = [EbNo Results.EbNo];
    BLER = [BLER Results.FER];
    BER = [BER Results.BER];
    

end
Results1.EbNo = EbNo;
Results1.BLER = BLER;
Results1.BER = BER;

save('Concat/N4096_R12','Results1')
subplot(211)
% hold on
semilogy(EbNo,BLER);
hold on;


subplot(212)
% hold on
semilogy(EbNo,BER);
hold on;



subplot(211)
% strt = sprintf('Polar Performance QPSK N=%d K=%d R=%d CRC8',results.N,results.K,R);
title('');
% legend('Turbo 1/3','Polar 1/3 SC','Polar 1/3 SCL with L=8','LDPC 1/2 ','Polar 1/2 SC','Polar 1/2 SCL with L=8','LDPC 2/3','Polar 2/3 SC','Polar 2/3 SCL with L=8');
% legend('Turbo 1/3','Polar 1/3 SC','Polar 1/3 SCL with L=8');
% legend('Turbo 1/3','Polar 1/3 SC','Polar 1/3 SCL with L=8','Polar 1/2 SC','Polar 1/2 SCL with L=8','LDPC 2/3','Polar 2/3 SC','Polar 2/3 SCL with L=8');
% legend('Turbo 1/3','Polar 1/3 SC','Polar 1/3 SCL with L=8','Polar 1/2 SC','Polar 1/2 SCL with L=4','Polar 2/3 SC','Polar 2/3 SCL with L=8');

grid on;
xlabel('Eb/No');
ylabel('BLER');
xlim([-1 8])
ylim([0.0001 1])

subplot(212)
% legend('Turbo 1/3','Polar 1/3 SC','Polar 1/3 SCL with L=8','LDPC 1/2 ','Polar 1/2 SC','Polar 1/2 SCL with L=8','LDPC 2/3','Polar 2/3 SC','Polar 2/3 SCL with L=8');

% legend('Turbo 1/3','Polar 1/3 SC','Polar 1/3 SCL with L=8');
% legend('Turbo 1/3','Polar 1/3 SC','Polar 1/3 SCL with L=8','Polar 1/2 SC','Polar 1/2 SCL with L=8','LDPC 2/3','Polar 2/3 SC','Polar 2/3 SCL with L=8');
% legend('Turbo 1/3','Polar 1/3 SC','Polar 1/3 SCL with L=8','Polar 1/2 SC','Polar 1/2 SCL with L=4','Polar 2/3 SC','Polar 2/3 SCL with L=8');

grid on;
xlabel('Eb/No');
ylabel('BER');
xlim([-1 8])
ylim([0.000001 1])