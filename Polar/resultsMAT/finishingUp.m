
subplot(211)
% strt = sprintf('Polar Performance QPSK N=%d K=%d R=%d CRC8',results.N,results.K,R);
title('');
% legend('Turbo 1/3','Polar 1/3 SC','Polar 1/3 SCL with L=8','LDPC 1/2 ','Polar 1/2 SC','Polar 1/2 SCL with L=8','LDPC 2/3','Polar 2/3 SC','Polar 2/3 SCL with L=8');
% legend('Turbo 1/3','Polar 1/3 SC','Polar 1/3 SCL with L=8');
% legend('Turbo 1/3','Polar 1/3 SC','Polar 1/3 SCL with L=8','Polar 1/2 SC','Polar 1/2 SCL with L=8','LDPC 2/3','Polar 2/3 SC','Polar 2/3 SCL with L=8');
% legend('Turbo 1/3','Polar 1/3 SC','Polar 1/3 SCL with L=8','Polar 1/2 SC','Polar 1/2 SCL with L=4','Polar 2/3 SC','Polar 2/3 SCL with L=8');
legend('Turbo 1/3','Polar 1/3 SC','Polar 1/3 SCL with L=8','Turbo 1/2','LDPC 1/2','Polar 1/2 SC','Polar 1/2 SCL with L=8','Turbo 1/3','LDPC 2/3','Polar 2/3 SC','Polar 2/3 SCL with L=8');

grid on;
xlabel('Eb/No');
ylabel('BLER');
xlim([-5 8])
ylim([0.0001 1])

subplot(212)
% legend('Turbo 1/3','Polar 1/3 SC','Polar 1/3 SCL with L=8','LDPC 1/2 ','Polar 1/2 SC','Polar 1/2 SCL with L=8','LDPC 2/3','Polar 2/3 SC','Polar 2/3 SCL with L=8');

% legend('Turbo 1/3','Polar 1/3 SC','Polar 1/3 SCL with L=8');
% legend('Turbo 1/3','Polar 1/3 SC','Polar 1/3 SCL with L=8','Polar 1/2 SC','Polar 1/2 SCL with L=8','LDPC 2/3','Polar 2/3 SC','Polar 2/3 SCL with L=8');
% legend('Turbo 1/3','Polar 1/3 SC','Polar 1/3 SCL with L=8','Polar 1/2 SC','Polar 1/2 SCL with L=4','Polar 2/3 SC','Polar 2/3 SCL with L=8');
legend('Turbo 1/3','Polar 1/3 SC','Polar 1/3 SCL with L=8','Turbo 1/2','LDPC 1/2','Polar 1/2 SC','Polar 1/2 SCL with L=8','Turbo 1/3','LDPC 2/3','Polar 2/3 SC','Polar 2/3 SCL with L=8');

grid on;
xlabel('Eb/No');
ylabel('BER');
xlim([-5 8])
ylim([0.000001 1])