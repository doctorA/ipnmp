function risi_graf(x, y, z, interval)
%Funkcija prejme 4 argumente. Vrednosti x, y, z in interval izrisa (v
%sekundah)!

dolzina = 200;  %dol�ina shranjenih vzorcev
global vectorx;  %vektor za vzorce x
global vectory;  %vektor za vzorce y
global vectorz;  %vektor za vzorce z

if ~isvector(vectorx)  %inicializacija vektorja x
    vectorx=zeros(1, dolzina);
end

if ~isvector(vectory)  %inicializacija vektorja y
    vectory=zeros(1, dolzina);
end

if ~isvector(vectorz)  %inicializacija vektorja z
    vectorz=zeros(1, dolzina);
end

vectorx=[vectorx(2:length(vectorx)) x];  %dodajanje vrednosti x na konec vektorja
vectory=[vectory(2:length(vectory)) y];  %dodajanje vrednosti y na konec vektorja
vectorz=[vectorz(2:length(vectorz)) z];  %dodajanje vrednosti z na konec vektorja
t=toc;  %pridobitev preteklega �asa
if(t>interval)  %za izpis na dolo�en interval
    subplot(3, 1, 1);  %risanje na 1. graf
    plot(vectorx, 'b');
    title('Poske�ek v X smeri');
    xlabel('�as');
    ylabel('odklon');
    subplot(3, 1, 2);  %risanje na 2. graf
    plot(vectory, 'r');
    title('Poske�ek v Y smeri');
    xlabel('�as');
    ylabel('odklon');
    subplot(3, 1, 3);  %risanje na 3. graf
    plot(vectorz, 'g');
    title('Poske�ek v Z smeri');
    xlabel('�as');
    ylabel('odklon');
    tic;  %restetiranje preteklega �asa
end