% [0 1 2 3],
%     1.5 2.5
load('resultsMAT/Polar_QPSK_designSNR2_N4096_K2048_L8_R12_1e4_CRC8.mat');
%                  Polar_QPSK_designSNR2_N4096_K2730_L8_R12_1e4_CRC8
EbNo = results.EbNo;
FER = results.FER;
BER = results.BER;

load('HeshResults/Polar_N4096_K2048_R12_L8_1.50dB_1e3_CRC8.mat');

% a.EbNo = [EbNo(1:3) results.EbNo ];
% a.FER =  [FER(1:3) results.FER   ];
% a.BER =  [BER(1:3) results.BER   ];

a.EbNo = [EbNo(1:2) results.EbNo EbNo(3)];
a.FER =  [FER(1:2) results.FER   FER(3)];
a.BER =  [BER(1:2) results.BER   BER(3)];

load('HeshResults/ParPolar_N4096_K2048_R12_L8_2.25dB_1e4_CRC8.mat');
% 
% Results.EbNo = [a.EbNo  ];
% Results.FER =  [a.FER   ];
% Results.BER =  [a.BER   ];

Results.EbNo = [a.EbNo results.EbNo  EbNo(4)];
Results.FER =  [a.FER  results.FER   FER(4)];
Results.BER =  [a.BER  results.BER   BER(4)];


filename = sprintf('HeshResults/Polar_N4096_L8_R12');
save(filename,'Results')

subplot(211)
semilogy(Results.EbNo,Results.FER);
hold on;
    
subplot(212)
semilogy(Results.EbNo,Results.BER);
hold on;