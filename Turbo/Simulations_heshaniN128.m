

  parfor j=1:3
    

        ebn = 6;

        switch(j)
            case 1 
                Turbo_R13_128n(ebn);
            case 2
                Turbo_R12_128n(ebn);
            case 3
                Turbo_R23_128n(ebn);
        end

    end