function simuliraj(port);
s = serial(port);
%RandStream.setDefaultStream(RandStream('mt19937ar','seed',sum(100*clock)));
fopen(s);
a=32765; %obseg random številk
b=0;
i=0; %števec za èas
j=0; %števec paketov
for m=0:10000,    
n=['11111111';'11111111']; %prva dva byta sta polna
n(3,:)='10000000'; %status zlog, vrednost 128
%tu se generira random x koordinata
r= round(a + (b-a).*rand(1));
tmp=dec2bin(r,16);
prvapolovica=tmp(1:8);
drugapolovica=tmp(9:16);
n(5,:)=prvapolovica;
n(4,:)=drugapolovica;

%tu se generira random y koordinata
r= round(a + (b-a).*rand(1));
tmp=dec2bin(r,16);
prvapolovica=tmp(1:8);
drugapolovica=tmp(9:16);
n(7,:)=prvapolovica;
n(6,:)=drugapolovica;

%tu se generira random z koordinata
r= round(a + (b-a).*rand(1));
tmp=dec2bin(r,16);
prvapolovica=tmp(1:8);
drugapolovica=tmp(9:16);
n(9,:)=prvapolovica;
n(8,:)=drugapolovica;

%tu se generira URA
if(i==65000)
    i=0;
end
tmp=dec2bin(i,16);
prvapolovica=tmp(1:8);
drugapolovica=tmp(9:16);
n(11,:)=prvapolovica;
n(10,:)=drugapolovica;

%tu se generira ŠTEVEC PAKETA
tmp=dec2bin(i,16);
prvapolovica=tmp(1:8);
drugapolovica=tmp(9:16);
n(13,:)=prvapolovica;
n(12,:)=drugapolovica;

%checksum A  je zaenkrat neuporabljen, vendar morata biti poslana 
n(14,:)='11111110';
%checksum B je zaenkrat neuporabljen
n(15,:)='11111110';
fwrite(s,uint8(bin2dec(n)));
i=i+1;
j=j+1;
end
fclose(s);