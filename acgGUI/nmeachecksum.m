function bool = nmeachecksum(NMEA_String)
%Funkcija prejme celotno NMEA sporo�ilo ($....*..) in preveri checksum.
%Vra�a 1 ali 0
 
checksum = 0;

[NMEA_String, checksumorg] = strtok(NMEA_String,'*');  %razdelimo na levi in desni del
 
NMEA_String_d = double(NMEA_String); %spremenimo v �tevil�no vrednost
for count = 2:length(NMEA_String) %ignoriramo 1. znak ($)
    checksum = bitxor(checksum,NMEA_String_d(count)); %XOR
    checksum = uint16(checksum); %zagotovimo uint16
end  
 
%spremenimo v hexadecimalno vrednost 
checksum = double(checksum);  
checksum = dec2hex(checksum);  
 
%dodamo za�etno ni�lo
if length(checksum) == 1  
    checksum = strcat('0',checksum);  
end

checksumorg=checksumorg(2:end); %odre�emo *
%preverimo pravilnost
if (strcmp(checksum, checksumorg))%(checksum==checksumorg)
    bool=1;
else
    bool=0;
end