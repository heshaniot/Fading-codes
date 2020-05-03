function ldpc4096_R23(ebn) 
%  LDPC_heshani_504b_R23
  % == LDPC SETTINGS ====================================
  RunID=0;
  TxRx.Sim.name = 'LDPC_heshani_4095b_R23';
  TxRx.Sim.nr_of_channels = 1e5; % 1k for good results, 10k for accurate results
%   snr =1;
  no = 1;
  TxRx.Sim.EbNo_dB_list = [ebn];
  TxRx.Decoder.LDPC.Scheduling = 'Layered'; % 'Layered' and 'Flooding'
  TxRx.Decoder.LDPC.Type = 'OMS'; % 'MPA' and 'SPA' (optimal)
  TxRx.Decoder.LDPC.Iterations =50;  
  load('codes/LDPC_heshani_4080b_R23.mat'); % load code
  
  % == EXECUTE SIMULATION ===============================  
  label.folder = 'FADING_RESULTS/N4096';
  label.number = no;
  label.rate = 23 ;
  sim_LDPC_QAM_RayleighFading_point(RunID,TxRx,LDPC,label) 

%   sim_LDPC_point(RunID,TxRx,LDPC,label) 
  
return

