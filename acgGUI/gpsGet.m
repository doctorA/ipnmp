function gpsGet(COMport,XmlFileName)
GPS=serial(COMport,'BaudRate',4800,'Parity','none');
fopen(GPS);
brkSwitch=1;
buffer=[];
zapst=1;
%XmlFileName = ['GPSData_', datestr(now, 'yyyy.mm.dd_HH.MM.SS'),'.xml'];      % Generated unique filename based on date and time
XmlFile = fopen(XmlFileName,'w','n','UTF8');
fprintf(XmlFile, '<gps_info>\n');

while (exist('acgGUI.lock') ~= 0);                                            % 'nix style process controll
    Read=fread(GPS);
    y=native2unicode(Read, 'US-ASCII')'; %dobimo string
    buffer=[buffer y]; %preostalemu dodamo nov string
    
    dolar=findstr(buffer, '$'); %najdemo vse $
    newline=findstr(buffer, char(10)); %najdemo vse newline
    while(dolar(1)>newline(1)) %za�eti moramo z $
        newline=newline(2:end);
    end
    minimum=min(length(dolar),length(newline)); %�tevilo iteracij bo tolik�no kolikor je $-jev oz. newline-ov
    xmlstring1=[];
    xmlstring2=[];
    polje_vrednosti=[];
    
    for i=1:minimum
        vrstica=buffer(dolar(i):newline(i)-2);  %vzamemo samo eno vrstico bufferja
        if(nmeachecksum(vrstica)==1)  %preverimo checksum
            if(findstr(vrstica, '$GPGGA')) %�e gre za GGA podatek
                polje_vrednosti=nmea(vrstica); %spremenimo v polje
                kvaliteta=str2num(polje_vrednosti{6}); %preverimo kvaliteto, ki mora bit > 0 da so podatki uporabni oz. da sploh dobimo podatke
                if(kvaliteta~=0)
                    xmlstring1=toXmlGga(polje_vrednosti); %gga spremenimo v xml string
                end
            elseif(findstr(vrstica, '$GPVTG')) %�e gre za VTG podatek
                polje_vrednosti=nmea(vrstica); %spremenimo v polje
                hitrost=polje_vrednosti{7}; 
                if(~isempty(hitrost))  %�e hitrost sploh obstaja
                     xmlstring2=toXmlVtg(polje_vrednosti); %vtg spremenimo v xml string
                end
            end
            if(~isempty(xmlstring1) && ~isempty(xmlstring2)) %�e smo oba uspe�no generirali
                gps_pack=sprintf('\t<gps_paket>\n\t\t<ZaporednaStevilka>%d</ZaporednaStevilka>\n\t\t<DatumCas>%s</DatumCas>\n%s%s\t</gps_paket>\n',zapst ,datestr(now,'yyyy.mm.dd HH:MM:SS') , xmlstring1, xmlstring2);
                fprintf(XmlFile, '%s', gps_pack);
                zapst=zapst+1;
            end
        end
    end
    
    if(length(dolar)~=length(newline))
        buffer=buffer(dolar(end):end);
    else
        buffer=[];
    end
    %pause(0.1);
    %key = get (gcf, 'CurrentKey');
    %if (~isempty(key))
    %    brkSwitch = 0;
    %end
    %brkSwitch=brkSwitch+1;
end

fprintf(XmlFile, '</gps_info>');
fclose(XmlFile);
fclose(GPS);
delete(GPS);


function podatki=nmea(vrstica)
%Funkcija vrne podatke, lo�ene
vejica=findstr(vrstica, ',');
podatki=[];
for i=1:length(vejica)-1
    vmestna=vrstica(vejica(i)+1:vejica(i+1)-1);
    podatki{i}=vmestna;
end

function xml=toXmlGga(podatki)
%Funkcija spremeni GGA v XML obliko
xml=sprintf('\t\t<gga>\n');
geosirina=podatki{2};
xml=[xml sprintf('\t\t\t<sirina>%s</sirina>\n', geosirina)];
geodolzina=podatki{4};
xml=[xml sprintf('\t\t\t<dolzina>%s</dolzina>\n', geodolzina)];
kvaliteta=podatki{6};
xml=[xml sprintf('\t\t\t<kvaliteta>%s</kvaliteta>\n',kvaliteta)];
stsat=podatki{7};
xml=[xml sprintf('\t\t\t<stsat>%s</stsat>\n', stsat)];
nadmorskaVisina=podatki{9};
xml=[xml sprintf('\t\t\t<nadmorskaVisina>%s</nadmorskaVisina>\n', nadmorskaVisina)];
xml=[xml sprintf('\t\t</gga>\n')];

function xml=toXmlVtg(podatki)
%Funkcija spremeni VTG v XML obliko
xml=sprintf('\t\t<vtg>\n');
hitrost=podatki{7};
xml=[xml sprintf('\t\t\t<hitrost>%s</hitrost>\n', hitrost)];
xml=[xml sprintf('\t\t</vtg>\n')];