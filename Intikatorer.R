##                         Written by Dafne Ram 2015-02-20                                 ##
##  Extracts data for specific species/indicator from Index-file and calculates indicators ##
##  -> Choose which indicators to run from popup box that comes up when running the code.  ##   
###    First install package "gWidgets" and "reshape2", if they are not installed yet!    ###

rm(list=ls())  #empties the system

#Set working directory /location of Index file
setwd('C:/DAFNE/Svensk F�geltaxering/Databases and TRIM/Fredrik') 

t<-read.csv("East_AllSpecies_1991-2016.csv", sep=";", dec=",")#read in total Index file

#loads packages
require(gWidgets)
options("guiToolkit"="RGtk2")
library(reshape2)

#list of which species to include in each indicator
Indikator<-list(
  Levandeskog          =c("Tj�der","J�rpe","Skogsduva","Gr�ng�ling","Mindre hackspett","Tret�spett","N�tkr�ka","Lavskrika","Stj�rtmes","Svartmes","Tofsmes","Lappmes","Entita","Talltita","Tr�dkrypare","Domherre"),
  D�dved               =c("Gr�ng�ling","Mindre hackspett","Tret�spett","Entita","Talltita"),
  L�vrikskog           =c("Skogsduva","Gr�ng�ling","Mindre hackspett","Tret�spett","Stj�rtmes","Entita","Tr�dkrypare"),
  Gammalskog           =c("Tj�der","Tret�spett","Lavskrika","Svartmes","Tofsmes","Lappmes","Talltita","Tr�dkrypare","Domherre"),
  Skogsf�glar          =c("Bergfink","Bj�rktrast","Bl�mes","Bofink","Domherre","Dubbeltrast","Entita","Grans�ngare","Gr� flugsnappare","Gr�spett","Gr�ng�ling","Gr�nsiska","Gr�ns�ngare","G�rdsmyg","G�ktyta","Halsbandsflugsnappare","H�rms�ngare","J�rnsparv","J�rpe","Korp","Kungsf�gel","Lappmes","Lavskrika","L�vs�ngare","Mindre flugsnappare","Mindre hackspett","Mindre korsn�bb","Morkulla","N�ktergal","N�tkr�ka","N�tskrika","N�tv�cka","Orre","R�dhake","R�dstj�rt","R�dvingetrast","Sidensvans","Skogsduva","Skogssn�ppa","Spillkr�ka","Stenkn�ck","Stj�rtmes","St�rre hackspett","St�rre korsn�bb","Svarth�tta","Svartmes","Svartvit flugsnappare","Talgoxe","Talltita","Taltrast","Tj�der","Tofsmes","Tret�spett","Tr�dg�rdss�ngare","Tr�dkrypare","Tr�dl�rka","Tr�dpipl�rka","Videsparv"),
  Skogsf�glarNonInd    =c("Bergfink","Bj�rktrast","Bl�mes","Bofink","Dubbeltrast","Grans�ngare","Gr� flugsnappare","Gr�spett","Gr�nsiska","Gr�ns�ngare","G�rdsmyg","G�ktyta","Halsbandsflugsnappare","H�rms�ngare","J�rnsparv","Korp","Kungsf�gel","L�vs�ngare","Mindre flugsnappare","Mindre korsn�bb","Morkulla","N�ktergal","N�tskrika","N�tv�cka","Orre","R�dhake","R�dstj�rt","R�dvingetrast","Sidensvans","Skogssn�ppa","Spillkr�ka","Stenkn�ck","St�rre hackspett","St�rre korsn�bb","Svarth�tta","Svartvit flugsnappare","Talgoxe","Taltrast","Tr�dg�rdss�ngare","Tr�dl�rka","Tr�dpipl�rka","Videsparv"),
  Skogsf�glarR         =c("Bl�mes","Domherre","Entita","Gr�spett","Gr�ng�ling","J�rpe","Korp","Lappmes","Lavskrika","Mindre hackspett","Mindre korsn�bb","N�tkr�ka","N�tskrika","N�tv�cka","Orre","Sidensvans","Spillkr�ka","Stenkn�ck","Stj�rtmes","St�rre hackspett","St�rre korsn�bb","Svartmes","Talgoxe","Talltita","Tj�der","Tofsmes","Tret�spett","Tr�dkrypare"),
  Skogsf�glarM         =c("Bergfink","Bj�rktrast","Bofink","Dubbeltrast","Grans�ngare","Gr� flugsnappare","Gr�nsiska","Gr�ns�ngare","G�rdsmyg","G�ktyta","Halsbandsflugsnappare","H�rms�ngare","J�rnsparv","Kungsf�gel","L�vs�ngare","Mindre flugsnappare","Morkulla","N�ktergal","R�dhake","R�dstj�rt","R�dvingetrast","Skogsduva","Skogssn�ppa","Svarth�tta","Svartvit flugsnappare","Taltrast","Tr�dg�rdss�ngare","Tr�dl�rka","Tr�dpipl�rka","Videsparv"),
  Odlingslandskap      =c("Tofsvipa","Storspov","S�ngl�rka","Ladusvala","Stenskv�tta","Buskskv�tta","T�rns�ngare","Gul�rla","T�rnskata","Stare","H�mpling","Gulsparv","Pilfink"),
  �ngsbetesmarker      =c("Tofsvipa","Storspov","Ladusvala","Stenskv�tta","Buskskv�tta","T�rns�ngare","Gul�rla","T�rnskata","Stare","H�mpling","Gulsparv"),
  Sm�biotoper          =c("Stenskv�tta","Buskskv�tta","T�rns�ngare","T�rnskata","Stare","H�mpling","Gulsparv"),
  Kalfj�ll             =c("Fj�llripa","Ljungpipare","Fj�llabb","Stenskv�tta","�ngspipl�rka","Lappsparv","Sn�sparv"),
  Fj�llskog            =c("Dalripa","R�dvingetrast","R�dstj�rt","Bl�hake","L�vs�ngare","Svartvit flugsnappare","Gr�siska","Bergfink"),
  LevandeSj�ar         =c("Storlom","Sm�lom","Sk�ggdopping","Vigg","Knipa","Sm�skrake","Storskrake","Fiskgjuse","Soth�na","Drillsn�ppa","Fiskt�rna","Silvert�rna","Fors�rla"),
  Myllrandev�tmarkerS  =c("R�rdrom","Kricka","S�ngsvan","Brun k�rrh�k","Trana","Soth�na","Enkelbeckasin","Gr�nbena"),
  Myllrandev�tmarkerN  =c("Sm�lom","Kricka","Bl�sand","S�ngsvan","Trana","Ljungpipare","Enkelbeckasin","Sm�spov","Gr�nbena","Svartsn�ppa","Gluttsn�ppa","K�rrsn�ppa","Brushane","Smaln�bbad simsn�ppa"),
  Milj�m�l16           =c("Tj�der","J�rpe","Skogsduva","Gr�ng�ling","Mindre hackspett","Tret�spett","N�tkr�ka","Lavskrika","Stj�rtmes","Svartmes","Tofsmes","Lappmes","Entita","Talltita","Tr�dkrypare","Domherre","Tofsvipa","Storspov","S�ngl�rka","Ladusvala","Stenskv�tta","Buskskv�tta","T�rns�ngare","Gul�rla","T�rnskata","Stare","H�mpling","Gulsparv","Pilfink","Fj�llripa","Ljungpipare","Fj�llabb","�ngspipl�rka","Lappsparv","Sn�sparv","Dalripa","R�dvingetrast","R�dstj�rt","Bl�hake","L�vs�ngare","Svartvit flugsnappare","Gr�siska","Bergfink","Storlom","Sm�lom","Sk�ggdopping","Vigg","Knipa","Sm�skrake","Storskrake","Fiskgjuse","Soth�na","Drillsn�ppa","Fiskt�rna","Silvert�rna","Fors�rla","R�rdrom","Kricka","S�ngsvan","Brun k�rrh�k","Trana","Enkelbeckasin","Gr�nbena","Bl�sand","Sm�spov","Svartsn�ppa","Gluttsn�ppa","K�rrsn�ppa","Brushane","Smaln�bbad sim","Ejder","Strandskata","Silltrut","Glada","Havstrut"),                        
  EU_VanligaJordbruk       =c("Tofsvipa","S�ngl�rka","Ladusvala","R�ka","Buskskv�tta","T�rns�ngare","�ngspipl�rka","Gul�rla","T�rnskata","Stare","H�mpling","Gulsparv","Ortolansparv","Pilfink"),
  EU_VanligaSkog           =c("Sparvh�k","Skogsduva","Mindre Hackspett","Spillkr�ka","N�tkr�ka","Svartmes","Tofsmes","Entita","Talltita","Notv�cka","Tr�dkrypare","Dubbeltrast","R�dstj�rt","Grans�ngare","Gr�ns�ngare","Kungsf�gel","Svartvit flugsnappare","Tr�dpipl�rka","Gr�nsiska","Domherre"),
  EU_�vrigaVanliga         =c("Ormvr�k","Enkelbeckasin","Drillsn�ppa","Ringduva","Turkduva","G�k","Tornseglare","Gr�ng�ling","St�rre hackspett","G�ktyta","Tr�dl�rka","Hussvala","Korp","Kr�ka","Kaja","Skata","Stj�rtmes","Talgoxe","Bl�mes","G�rdsmyg","Bj�rktrast","Taltrast","R�dvingetrast","Koltrast","Stenskv�tta","N�ktergal","R�dhake","Gr�shopps�ngare","R�rs�ngare","S�vs�ngare","H�rms�ngare","Svarth�tta","Tr�dg�rdss�ngare","�rts�ngare","L�vs�ngare","Gr� flugsnappare","J�rnsparv","S�des�rla","Gr�nfink","Gr�siska","Bofink","Bergfink","S�vsparv","Gr�sparv","Rosenfink"),  
  Norrbotten_Stann                =c("Dalripa","Fj�llripa","Orre","Tj�der","J�rpe","St�rre hackspett","Tret�spett","Spillkr�ka","Korp","Kr�ka","Skata","Lavskrika","Talgoxe","Bl�mes","Lappmes","Talltita","Tr�dkrypare","Sidensvans","Gr�nfink","Gr�siska","Domherre","Tallbit","Mindre korsn�bb","St�rre korsn�bb","Korsn�bb obest�md","Gulsparv","Gr�sparv"),
  Norrbotten_Europaflyttare       =c("Storlom","Sm�lom","Gr�sand","Kricka","Bl�sand","Vigg","Knipa","Alf�gel","Sj�orre","Sm�skrake","Storskrake","S�ngsvan","Fj�llvr�k","Stenfalk","Tornfalk","Trana","Tofsvipa","Ljungpipare","Enkelbeckasin","Storspov","K�rrsn�ppa","Fiskm�s","Dv�rgm�s","Skrattm�s","Ringduva","S�ngl�rka","Dubbeltrast","Taltrast","R�dvingetrast","Ringtrast","Koltrast","R�dhake","Grans�ngare","J�rnsparv","�ngspipl�rka","S�des�rla","Gr�nsiska","Bofink","Bergfink","S�vsparv","Lappsparv","Sn�sparv","Bj�rktrast","Kungsf�gel"),
  Norrbotten_L�ngflyttare         =c("Fiskgjuse","St�rre strandpipare","Sm�spov","Skogssn�ppa","Gr�nbena","Drillsn�ppa","R�dbena","Svartsn�ppa","Gluttsn�ppa","Mosn�ppa","Brushane","Smaln�bbad simsn�ppa","Silvert�rna","G�k","Tornseglare","G�ktyta","Ladusvala","Hussvala","Stenskv�tta","Buskskv�tta","R�dstj�rt","Bl�hake","S�vs�ngare","Tr�dg�rdss�ngare","L�vs�ngare","Gr� flugsnappare","Svartvit flugsnappare","Tr�dpipl�rka","Gul�rla","Videsparv","Fj�llabb","Rosenfink"),
  Norrbotten_Riktv�xtdjur         =c("Tj�der","J�rpe","Tret�spett","Lavskrika","Lappmes","Talltita","Tr�dkrypare","Domherre","Tofsvipa","Storspov","S�ngl�rka","Ladusvala","Buskskv�tta","Gulsparv","Storlom","Sm�lom","Vigg","Knipa","Sm�skrake","Storskrake","Fiskgjuse","Drillsn�ppa","Silvert�rna","Kricka","Bl�sand","S�ngsvan","Trana","Ljungpipare","Enkelbeckasin","Sm�spov","Gr�nbena","Svartsn�ppa","Gluttsn�ppa","K�rrsn�ppa","Brushane","Smaln�bbad simsn�ppa","Fj�llripa","Fj�llabb","Stenskv�tta","�ngspipl�rka","Lappsparv","Sn�sparv","Dalripa","R�dvingetrast","R�dstj�rt","Bl�hake","L�vs�ngare","Gr�siska","Bergfink"),
  Norrbotten_R�dlistade           =c("Sm�lom","Fj�llvr�k","Brushane","Storspov","Drillsn�ppa","Tornseglare","G�ktyta","Tret�spett","S�ngl�rka","Lappmes","Lavskrika","Tallbit","Videsparv","Rosenfink"),
  Norrbotten_FDbilaga1            =c("Sm�lom","Storlom","S�ngsvan","Fiskgjuse","J�rpe","Orre","Tj�der","Trana","Ljungpipare","Brushane","Gr�nbena","Smaln�bbad simsn�ppa","Dv�rgm�s","Silvert�rna","Spillkr�ka","Tret�spett","Bl�hake","Stenfalk"),
  Norrbotten_Vadare               =c("Tofsvipa","St�rre strandpipare","Ljungpipare","Enkelbeckasin","Storspov","Sm�spov","Skogssn�ppa","Gr�nbena","Drillsn�ppa","R�dbena","Gluttsn�ppa","Svartsn�ppa","Mosn�ppa","K�rrsn�ppa","Brushane","Smaln�bbad simsn�ppa"),
  Norrbotten_Skogsh�ns            =c("Orre","Tj�der","J�rpe"),
  Norrbotten_Fj�llh�ns            =c("Fj�llripa","Dalripa"),  
  WestGrazing              =c("Kn�lsvan","S�ngsvan","Bl�sand","Kricka","Gr�sand","Soth�na"),
  WestFishing              =c("Sm�lom","Sk�ggdopping","Storskarv","Storskrake","Sm�skrake","Salskrake"),
  WestBenthic              =c("Vigg","Brunand","Knipa","Alf�gel","Sv�rta","Sj�orre","Ejder"),
  EastFishing              =c("Sm�lom","Sk�ggdopping","Svarthakedopping","Storskarv","Storskrake","Sm�skrake","Salskrake"),
  EastGrazing              =c("Kn�lsvan","S�ngsvan","Bl�sand","Kricka","Gr�sand","Stj�rtand","Soth�na"),
  EastBenthic              =c("Alf�gel","Bergand","Brunand","Ejder","Knipa","Sj�orre","Sv�rta","Vigg"),
  EastAll                  =c("Kn�lsvan","S�ngsvan","Bl�sand","Kricka","Gr�sand","Stj�rtand","Soth�na","Sm�lom","Sk�ggdopping","Svarthakedopping","Storskarv","Storskrake","Sm�skrake","Salskrake","Alf�gel","Bergand","Brunand","Ejder","Knipa","Sj�orre","Sv�rta","Vigg"),
  WestAll                  =c("Kn�lsvan","S�ngsvan","Bl�sand","Kricka","Gr�sand","Soth�na","Sm�lom","Sk�ggdopping","Storskarv","Storskrake","Sm�skrake","Salskrake","Vigg","Brunand","Knipa","Alf�gel","Sv�rta","Sj�orre","Ejder")
  )

#popup checkbox to make a selection of indicators
w   <- gbasicdialog("V�lja indikatorer", do.buttons = FALSE)  #creates a modal dialog
gp  <- ggroup(container = w)
cbg <- gcheckboxgroup(names(Indikator), container=gp, handler = NULL) #Define checkbox values
gbutton("OK", container = gp, handler = function(h,...) {     #save chosen values in "ind" and close window when clicking OK
  ind <<-Indikator[svalue(cbg)]
  dispose(w) })
visible(w, TRUE) #Show popupwindow

gm_mean = function(x, na.rm=TRUE){exp(sum(log(x[x > 0]), na.rm=na.rm) / length(x))} #creates a function for calculating the geometric mean

for(i in 1:length(ind)){  #starts loop, running over every indicator on the list "ind"

#Selects index data for specific species:
Arter <- unlist(ind[i]) #Get list of species from indicator
In <- t[t$arthela %in% Arter,c("art","�r","Index","arthela")]#filter data based on species names, and select columns
In <- dcast(In, art+arthela~�r, value.var="Index") #change data from long format to wide format (one column per year)
rownames(In) <- In[,2] #Make species  names into row.names
In[,1:2] <- list(NULL) #delete original species number and names columns

#Selects SE data for specific species:
Se <- t[t$arthela %in% Arter,c("art","�r","SE","arthela")]#filter data based on species names, and select columns
Se <- dcast(Se, art+arthela~�r, value.var="SE")#change data from long format to wide format(one column per year)
rownames(Se) <- Se[,2] #Make species  names into row.names
Se[,1:2] <- list(NULL) #delete original species number and names columns

#Calculate indicators: follows exact same steps as in excel
a<-((1/In)^2)*(Se^2)  
asum<-colSums(a)
b<-(1/nrow(In))^2
c<-(apply(In,2, gm_mean))^2
c1<-apply(In,2, gm_mean)
d<-(c*b*asum)^0.5
g<-1.96*d
e<-c1+g
f<-c1-g

#Make table with resulting values:
out<-rbind(c1,e,f,g,d) #combine all calculated values
out<-melt(out) #make data into long format
out<-dcast(out, Var2~Var1) #make data into wide format listing years in the first column
colnames(out) <- c("�r","Index","","","95%ko","SE") # add column names, so now it is the same table as in excel
write.csv2(out, file = (paste(names(ind[i]),".csv", sep='')),row.names=FALSE) #export table as .csv with indicator name as file name
} #close loop


