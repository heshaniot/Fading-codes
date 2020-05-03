function si_N1024_12()
       ebn_vec = [1.5 2 2.5 2.75 3];
      parfor j=1:5
         ebn = ebn_vec(j);
         ldpc1024_R12(ebn);
      end
      
end
