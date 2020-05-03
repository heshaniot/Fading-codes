function si_N4096_12()
       ebn_vec = [0 0.5 1 1.5 2 2.25 2.5 2.75 3];
       nn = length(ebn_vec);
       parfor j=1:9
         ebn = ebn_vec(j);
         ldpc4096_R12(ebn);
      end
      
end
