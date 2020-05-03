

 


EbNo = Results.EbNo; 
BLER = Results.FER ;
BER = Results.BER ;
subplot(211)
% hold on
% turbo13 = semilogy(EbNo,Results.BLER);
semilogy(EbNo,BLER);

hold on;


subplot(212)
% hold on
% turbo13 = semilogy(EbNo,Results.BER);

semilogy(EbNo,BER);
hold on;

