function [err]=preveri(matrika) %group 4 change - this function now returns err(int) which
                                %contains a non-zero value if there is an error

%Funkcija sporo�i, �e je v vzorcih napaka (npr. da manjka vzorec)

velikost=size(matrika);

for i=1:velikost(1)-1                       %sprehodimo se od prve do predzadnje vrstice
    if matrika(i, 6)>=matrika(i+1, 6)       %�e je trenutna vrednost ve�ja ali enaka naslednji
        err = num2str(i+1);
    else
        err = 0;
    end
end
