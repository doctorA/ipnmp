function [matrika] = interpolacija(matrika)
%interpolacija podatkov
%funkcija sprejme matriko in vraca matriko

dolMatrike = length(matrika);

%v testnem primeru zaradi nepravilnega �asa,
%lahko interpolira samo prve 1,4s
%dolMatrike = 36; 

%prebiranje x,y,z komponent in casa, ki ga pretvorim v sekunde
for i=1:1:dolMatrike,
    x(i) = matrika(i,2);
    y(i) = matrika(i,3);
    z(i) = matrika(i,4);
    cas(i) = matrika(i,5) / 46875;
end

koncniCas = matrika(dolMatrike,5) / 46875;
zacetniCas = matrika(1,5) / 46875;

cas2 = zacetniCas:0.025:koncniCas;

%izra�un interpolacije
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