function [matrika] = interpolacija(matrika)
%interpolacija podatkov
%funkcija sprejme matriko in vraca matriko

%----------------------------------------------------
%pripravi cas

dolMatrike = length(matrika); %dolžina matrike

stariCas = matrika(1,5); %prvi cas
skupenCas = 0;
%vektor za nove èase
cas = zeros(1, dolMatrike);
%prvi èas je niè
cas(1) = 0;

%prebiranje x,y,z komponent
x(1) = matrika(1,2);
y(1) = matrika(1,3);
z(1) = matrika(1,4);

for i=2:1:dolMatrike,  %m(i,5) je vedno trenuten èas

    if( matrika(i,5) > stariCas ) %ko je novi èas veèji od prejšnjega            
        cas(i) = skupenCas + ((matrika(i,5) - stariCas)/46875);
        skupenCas = cas(i);
    else %ob resetiranju števca
        cas(i) = skupenCas + ((matrika(i,5) + (65536 - stariCas))/46875);
        skupenCas = cas(i);
    end

    stariCas = matrika(i,5);
    
    %prebiranje x,y,z komponent
    x(i) = matrika(i,2);
    y(i) = matrika(i,3);
    z(i) = matrika(i,4);
end
%display(skupenCas);
%----------------------------------------------------
zacetniCas = cas(1);
koncniCas = cas(dolMatrike);

cas2 = zacetniCas:0.025:koncniCas;

%izraèun interpolacije
x2=interp1(cas,x,cas2);
y2=interp1(cas,y,cas2);
z2=interp1(cas,z,cas2);

%shranjevanje interpolacije
for i=1:1:dolMatrike,
    matrika(i,2) = x2(i);
    matrika(i,3) = y2(i);
    matrika(i,4) = z2(i);
    matrika(i,5) = cas2(i);
end