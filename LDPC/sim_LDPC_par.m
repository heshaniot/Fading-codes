% =========================================================================
% Title       : Simulator for Quasi-Cyclic LDPC codes
% File        : sim_LDPC.m
% -------------------------------------------------------------------------
% Description :
%   This file performs the main Monte-Carlo simulation procedure.
%   Encodes LDPC codes described by the codes found in the codes/ folder
%   transmits bits over an AWGN channel and calls the decoding algorithm.
% ------------------------------------------------------------------------- 
% Revisions   :
%   Date       Version  Author  Description
%   20-may-11  1.3      studer  cleanup for reproducible research
%   04-jul-07  1.2      studer  multiple bug fixes
%   02-jul-07  1.1      studer  modularized & improved version
%   05-oct-06  1.0      studer  initial version 
% -------------------------------------------------------------------------
%   (C) 2006-2011 Communication Theory Group                      
%   ETH Zurich, 8092 Zurich, Switzerland                               
%   Author: Dr. Christoph Studer (e-mail: studer@rice.edu)     
% =========================================================================

function sim_LDPC(RunID,TxRx,LDPC) 

  randn('state',RunID)
  rand('state',RunID) 
  
  ttot = tic; 
  %coding parameters
  N = LDPC.tot_bits;
  K = LDPC.inf_bits;
  R = LDPC.rate;
  G = LDPC.G ;
  
  %Eb/No
  EbNodB_range  = TxRx.Sim.EbNo_dB_list;
  EbNo_length = length(EbNodB_range);
  sigma2 = 2; % this is sigma2 No should be sigma2/2
  No = 2*sigma2; 
  
  %simulations
  MCsize = TxRx.Sim.nr_of_channels;
   
  decoderScheduling = TxRx.Decoder.LDPC.Scheduling;

  % -- initialize
  BER = zeros(1,EbNo_length); 
  BLER = zeros(1,EbNo_length);
  log_NumC = zeros(1,EbNo_length); 
  log_NumV = zeros(1,EbNo_length); 
  
  modulationMethod = 'QAM';
  bitsPerSymbol = 2 ; %QAM
  tic;
  fprintf('\nLDPC_N%d_K%d_R12_%s_%s_LDPCIterations%d_1e%d\n',N,K,modulationMethod,TxRx.Decoder.LDPC.Type,TxRx.Decoder.LDPC.Iterations,log10(MCsize));

  
  for k=1:EbNo_length
        titer = tic ;
        BLER_local = zeros(MCsize,1);
        BER_local = zeros(MCsize,1);

        Ec = (K/N)*sigma2*10^(EbNodB_range(k)/10); %Energy per coded bit
        
        parfor trial=1:MCsize

            % -- draw random bits and map to symbol
            c = gf(round(rand(1,K)),1);
            x = c*G; % generate codeword
           
            %QAM modulation
            s = sign((x==0)-0.5); % mapping: 1 to -1.0 and 0 to +1.0
            [tt,Blocklength] = size(s);
            s_reshaped = reshape(s,bitsPerSymbol,Blocklength/bitsPerSymbol); 
            s_mod =  sqrt(Ec)*( s_reshaped(1,:) + 1i*s_reshaped(2,:) );
            
            % -- AWGN channel
            channelNoise = sqrt(sigma2/2)*randn(1,length(x)/bitsPerSymbol)+1i*sqrt(sigma2/2)*randn(1,length(x)/bitsPerSymbol);
            y = s_mod + channelNoise;
            %   noise = randn(1,length(x)); 
%             (K/N)*N0*10^(EbN0dB(j)/10)
%             channelNoise = sqrt(N0/2)*randn(N/bitsPerSymbol,1)+1i*sqrt(N0/2)*randn(N/bitsPerSymbol,1);
%             noise = 1/sqrt(2)*( randn(1,length(x)/bitsPerSymbol) + 1i*randn(1,length(x)/bitsPerSymbol) ); 
%             sigma2 = 10^(-SNR_range(k)/10)  ;  
            %       y = s + noise*sqrt(sigma2);

            % -- compute LLRs & decode    
            %       LLR_A2 =  2*y/sigma2; 

            initialLRs = zeros(1,length(x));
%             initialLRs(1:2:end) = (2/sigma2) * real(y); 
%             initialLRs(2:2:end) = (2/sigma2) * imag(y); 
            initialLRs(1:2:end) = (2*sqrt(Ec)/sigma2) * real(y); 
            initialLRs(2:2:end) = (2*sqrt(Ec)/sigma2) * imag(y);
            LLR_A2= initialLRs;

            switch (decoderScheduling)
                case 'Layered', % layered schedule             
                    [bit_output,LLR_D2,NumC,NumV] = decLDPC_layered(TxRx,LDPC,LLR_A2);
                case 'Flooding', % flooding schedule
                    [bit_output,LLR_D2,NumC,NumV] = decLDPC_flooding(TxRx,LDPC,LLR_A2);
                otherwise,
                    error('Unknown TxRx.Decoder.LDPC.Scheduling method.')  
            end
            
%             log_NumC(k) = log_NumC(k) + NumC;
%             log_NumV(k) = log_NumV(k) + NumV;

            % -- calculate BER
            ref_output = (c==1);   
            tmp = sum(abs(ref_output-bit_output));
            BLER_local(trial) = (tmp>0);
            BER_local(trial) = tmp ;
           
%             BER(k) = BER(k) + tmp;  
%             FER(k) = FER(k) + (tmp>0);

        end
        
        BLER(k) = sum(BLER_local)/MCsize;
        BER(k) = sum(BER_local)/(K*MCsize);

%         if mod(trial,10)==1
%             disp(sprintf('Estimated remaining time is %1.1f minutes.',(toc)/trial*(TxRx.Sim.nr_of_channels-trial)/60));
%         end
        fprintf('\n %d dB (timetaken %.2f seconds)',EbNodB_range(k),toc(titer))
  end

  % -- save results to disk
  Results.TxRx = TxRx;
  Results.EbNo = EbNodB_range;
  Results.LDPC = LDPC;
  Results.BLER = BLER;
  Results.BER = BER;
%   Results.log_NumC = log_NumC/trial;
%   Results.log_NumV = log_NumV/trial;  
% filename = sprintf('resultsMAT/Turbo_N%d_K%d_R13_%s_LIterations%d_1e%d.fig',N,K,modulationMethod,numTurboIterations,log10(MCsize));
% savefig(filename)

  Results.FileName = sprintf('resultsMAT/LDPC_N%d_K%d_%s_%s_Iter%d_1e%d_EbNo%.2f.mat',N,K,modulationMethod,TxRx.Decoder.LDPC.Type,TxRx.Decoder.LDPC.Iterations,log10(MCsize),EbNodB_range);
  save(Results.FileName,'Results');
  
  % -- generate BER plot
%   figure; 
%   subplot(211)
%   semilogy(EbNodB_range,Results.BLER,'bo-')
%   xlabel('SNR [dB]')
%   ylabel('FER')
%   grid on
%   
%   subplot(212)
%   semilogy(EbNodB_range,Results.BER,'bo-')
%   xlabel('SNR [dB]')
%   ylabel('BER')
%   grid on
  %
%   filename = sprintf('resultsMAT/LDPC_N%d_K%d_R12_%s_%s_LDPCIterations%d_1e%d.fig',N,K,modulationMethod,TxRx.Decoder.LDPC.Type,TxRx.Decoder.LDPC.Iterations,log10(MCsize));
%   savefig(filename)

%   axis([ -1 9 1e-6 1])   
  fprintf('\nTotal time %.2f seconds \n',toc(ttot))
return