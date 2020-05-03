
function Simulations_heshaniN512()
ebn = [0.5 1 1.5 ]
for j=1:3
%         if j<=6
%             cc = 1 ;
%         elseif j<=12
%             cc = 2 ;
%         elseif j>12
%             cc = 3;
%         end
%         
          ebnv = ebn(j)
%         switch(cc)
%             case 1 
%                 ebn = j-1;
                Turbo_R13_512n(ebnv);
%             case 2
%                 ebn = j-7 ;
%                 Turbo_R12_512n(ebn);
%             case 3
%                 ebn = j-13;
%                 Turbo_R23_512n(ebn);
%         end

end