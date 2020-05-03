
% % % POrLAR
clear all;
% close all;
L_vec = [ 1 8];
R=12;
iter= [5 5];
% Polar_QPSK_designSNR2_N512_K170_L8_R12_1e5_CRC8
%  Polar_QPSK_designSNR2_N4096_K1365_L1_R12_1e5_CRC8
for n=1:length(L_vec)
    l = L_vec(n);
    str = sprintf('Polar_QPSK_designSNR2_N1024_K341_L%d_R12_1e%d_CRC8.mat',l,iter(n));
    load(str);

    subplot(211)
%     hold on
    semilogy(results.EbNo,results.FER);
    hold on;
    

    subplot(212)
%     hold on
    semilogy(results.EbNo,results.BER);
    hold on;

end



% subplot(211)
% strt = sprintf('Polar Performance QPSK N=%d K=%d R=%d CRC8',results.N,results.K,R);
% title(strt);
% legend('Polar L=1','Polar L=2','Polar L=4','Polar L=8','Polar L=32');
% grid on;
% xlabel('Eb/No');
% ylabel('FER');
% 
% 
% subplot(212)
% legend('Polar L=1','Polar L=2','Polar L=4','Polar L=8','Polar L=32');
% grid on;
% xlabel('Eb/No');
% ylabel('BER');
% 
% 
% 
% filename = sprintf('Afigs/QPSK_N%d_K%d_R%d_1e5',results.N,results.K,R);
% savefig(filename)







% legend('L=1','L=2','L=4','L=8')

% %LDPC
% subplot(211)
% semilogy(Results.TxRx.Sim.SNR_dB_list,Results.FER);
% grid on;
% hold on;
% title('LDPC N=216 R=1/2 SPA ')
% % legend('L=1','L=2','L=4','L=8')
% 
% subplot(212)
% semilogy(Results.TxRx.Sim.SNR_dB_list,Results.BER);
% grid on;
% hold on;
