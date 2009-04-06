function [err]=preveri(matrika)
%Funkcija sporo�i, �e je v vzorcih napaka (npr. da manjka vzorec)
%Opomba skupine 4: predelali smo funkcijo preveri da vrne nazaj neko
%vrednost, ki jo lovimo v GUI, v primeru napake
velikost=size(matrika);

for i=1:velikost(1)-1                       %sprehodimo se od prve do predzadnje vrstice
    if matrika(i, 6)>=matrika(i+1, 6)       %�e je trenutna vrednost ve�ja ali enaka naslednji
        %disp(['Napaka! Vrstica: ' num2str(i+1)]);    %izpi�emo indeks vrstice, v kateri je pri�lo do napake
        err = num2str(i+1);
    else
        err = 0;
    end
end
