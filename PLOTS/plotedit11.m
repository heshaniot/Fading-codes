function plotedit()

subplot(211)
legend('LDPC-1/3 bler','LDPC-1/2 bler','LDPC-2/3 bler')
%  legend('Turbo-1/3 bler','Turbo-1/2 bler','Turbo-2/3 bler');
%  legend('Polar-1/3 bler','Polar-1/2 bler ','Polar-2/3 bler');

% legend('Turbo-1/3','Turbo-1/2','Turbo-2/3','LDPC-1/3','LDPC-1/2','LDPC-2/3','Polar-1/3','Polar-1/2','Polar-2/3')
xlabel('Eb/No');
ylabel('BLER');
xlim([0 5])
ylim([0.0001 1])

subplot(212)
legend('LDPC-1/3 ber','LDPC-1/2 ber','LDPC-2/3 ber')
%  legend('Turbo-1/3 ber','Turbo-1/2 ber','Turbo-2/3 ber');
%  legend('Polar-1/3 ber','Polar-1/2 ber ','Polar-2/3 ber');
% legend('Turbo-1/3','Turbo-1/2','Turbo-2/3','LDPC-1/3','LDPC-1/2','LDPC-2/3','Polar-1/3','Polar-1/2','Polar-2/3')
xlabel('Eb/No');
ylabel('BER');
xlim([0 5])
ylim([0.00001 1])

end


