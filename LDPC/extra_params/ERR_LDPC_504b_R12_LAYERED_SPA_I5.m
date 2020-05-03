function ERR_LDPC_504b_R12_LAYERED_SPA_I5(RunID) 

  % == LDPC SETTINGS ====================================

  TxRx.Sim.name = 'ERR_LDPC_504b_R12_LAYERED_SPA_I5';
  TxRx.Sim.nr_of_channels = 1e2; % 1k for good results, 10k for accurate results
  TxRx.Sim.SNR_dB_list = [0:1:4];
  TxRx.Decoder.LDPC.Scheduling = 'Layered'; % 'Layered' and 'Flooding'
  TxRx.Decoder.LDPC.Type = 'SPA'; % 'MPA' and 'SPA' (optimal)
  TxRx.Decoder.LDPC.Iterations = 5;  
  load('codes/LDPC_11nD2_504b_R12.mat'); % load code
  
  % == EXECUTE SIMULATION ===============================  
  
  sim_LDPC(RunID,TxRx,LDPC)
  title('LDPC 504b R1/2 LAYERED SPA I5')
  
return
  
