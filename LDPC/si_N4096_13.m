function si_N4096_13()
       ebn_vec = [0 0.5 1 1.25 1.5 1.75 2 2.25 2.5];
       nn = length(ebn_vec);
       parfor j=1:9
         ebn = ebn_vec(j);
         ldpc4096_R13(ebn);
      end
      
end
