function preveri(matrika)
%Funkcija sporoèi, èe je v vzorcih napaka (npr. da manjka vzorec)

velikost=size(matrika);

for i=1:velikost(1)-1                       %sprehodimo se od prve do predzadnje vrstice
    if matrika(i, 6)>=matrika(i+1, 6)       %èe je trenutna vrednost veèja ali enaka naslednji
        disp(['Napaka! Vrstica: ' num2str(i+1)]);    %izpišemo indeks vrstice, v kateri je prišlo do napake
    end
end
