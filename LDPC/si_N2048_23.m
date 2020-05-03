function si_N2048_23()
       ebn_vec = [0 1 1.5 2 2.5 2.75 3 3.25 3.5 3.75 4];
       nn = length(ebn_vec);
       parfor j=1:11
         ebn = ebn_vec(j);
         ldpc2048_R23(ebn);
      end
      
end