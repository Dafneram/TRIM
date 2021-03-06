###                        Written by Dafne Ram 2015-02-20                                ###
##  Extracts data for specific species/indicator from Index-file and calculates indicators ##
##  -> Choose which indicators to run from popup box that comes up when running the code   ##
##  -> Choose alternative wheatear, yellow wagtail and/or fj�ll data in second popup       ##
###   !First install packages "gWidgets" and "reshape2", if they are not installed yet!   ###

####CHECK SWITCH FUNCTION!!!!

rm(list=ls())  #empties the system

#Set working directory /location of Index file
setwd('C:/Users/Dafne/Desktop/Svensk F�geltaxering/Databases and TRIM/Indikatorer/tests') 

t<-read.csv("Index STD 2002-2014 med namn.csv", sep=";", dec=",")#read in total Index file

#loads packages
require(gWidgets)
options("guiToolkit"="RGtk2")
library(reshape2)

Indikator<-list(
  Levandeskog          =c("Tj�der","J�rpe","Skogsduva","Gr�ng�ling","Mindre hackspett","Tret�spett","N�tkr�ka","Lavskrika","Stj�rtmes","Svartmes","Tofsmes","Lappmes","Entita","Talltita","Tr�dkrypare","Domherre"),
  D�dved               =c("Gr�ng�ling","Mindre hackspett","Tret�spett","Entita","Talltita"),
  L�vrikskog           =c("Skogsduva","Gr�ng�ling","Mindre hackspett","Tret�spett","Stj�rtmes","Entita","Tr�dkrypare"),
  Gammalskog           =c("Tj�der","Tret�ig hackspett","Lavskrika","Svartmes","Tofsmes","Lappmes","Talltita","Tr�dkrypare","Domherre"),
  Odlingslandskap      =c("Tofsvipa","Storspov","S�ngl�rka","Ladusvala","Stenskv�tta","Buskskv�tta","T�rns�ngare","Gul�rla","T�rnskata","Stare","H�mpling","Gulsparv","Pilfink"),
  �ngsbetesmarker      =c("Tofsvipa","Storspov","Ladusvala","Stenskv�tta","Buskskv�tta","T�rns�ngare","Gul�rla","T�rnskata","Stare","H�mpling","Gulsparv"),
  Sm�biotoper          =c("Stenskv�tta","Buskskv�tta","T�rns�ngare","T�rnskata","Stare","H�mpling","Gulsparv"),
  Kalfj�ll             =c("Fj�llripa","Ljungpipare","Fj�llabb","Stenskv�tta","�ngspipl�rka","Lappsparv","Sn�sparv"),
  Fj�llskog            =c("Dalripa","R�dvingetrast","R�dstj�rt","Bl�hake","L�vs�ngare","Svartvit flugsnappare","Gr�siska","Bergfink"),
  LevandeSj�ar         =c("Storlom","Sm�lom","Sk�ggdopping","Vigg","Knipa","Sm�skrake","Storskrake","Fiskgjuse","Soth�na","Drillsn�ppa","Fiskt�rna","Silvert�rna","Fors�rla"),
  Myllrandev�tmarkerS  =c("R�rdrom","Kricka","S�ngsvan","Brun k�rrh�k","Trana","Soth�na","Enkelbeckasin","Gr�nbena"),
  Myllrandev�tmarkerN  =c("Sm�lom","Kricka","Bl�sand","S�ngsvan","Trana","Ljungpipare","Enkelbeckasin","Sm�spov","Gr�nbena","Svartsn�ppa","Gluttsn�ppa","K�rrsn�ppa","Brushane","Smaln�bbad simsn�ppa"),
  Milj�m�l16           =c("Tj�der","J�rpe","Skogsduva","Gr�ng�ling","Mindre hackspett","Tret�ig hackspett","N�tkr�ka","Lavskrika","Stj�rtmes","Svartmes","Tofsmes","Lappmes","Entita","Talltita","Tr�dkrypare","Domherre","Tofsvipa","Storspov","S�ngl�rka","Ladusvala","Stenskv�tta","Buskskv�tta","T�rns�ngare","Gul�rla","T�rnskata","Stare","H�mpling","Gulsparv","Pilfink","Fj�llripa","Ljungpipare","Fj�llabb","�ngspipl�rka","Lappsparv","Sn�sparv","Dalripa","R�dvingetrast","R�dstj�rt","Bl�hake","L�vs�ngare","Svartvit flugsnappare","Gr�siska","Bergfink","Storlom","Sm�lom","Sk�ggdopping","Vigg","Knipa","Sm�skrake","Storskrake","Fiskgjuse","Soth�na","Drillsn�ppa","Fiskt�rna","Silvert�rna","Fors�rla","R�rdrom","Kricka","S�ngsvan","Brun k�rrh�k","Trana","Enkelbeckasin","Gr�nbena","Bl�sand","Sm�spov","Svartsn�ppa","Gluttsn�ppa","K�rrsn�ppa","Brushane","Smaln�bbad simsn�ppa","Ejder","Strandskata","Silltrut","Glada","Havstrut"),                        
  EU_VanligaJordbruk       =c("Tofsvipa","S�ngl�rka","Ladusvala","R�ka","Buskskv�tta","T�rns�ngare","�ngspipl�rka","Gul�rla","T�rnskata","Stare","H�mpling","Gulsparv","Ortolansparv","Pilfink"),
  EU_VanligaSkog           =c("Sparvh�k","Skogsduva","Mindre Hackspett","Spillkr�ka","N�tkr�ka","Svartmes","Tofsmes","Entita","Talltita","Notv�cka","Tr�dkrypare","Dubbeltrast","R�dstj�rt","Grans�ngare","Gr�ns�ngare","Kungsf�gel","Svartvit flugsnappare","Tr�dpipl�rka","Gr�nsiska","Domherre"),
  EU_�vrigaVanliga         =c("Ormvr�k","Enkelbeckasin","Drillsn�ppa","Ringduva","Turkduva","G�k","Tornseglare","Gr�ng�ling","St�rre hackspett","G�ktyta","Tr�dl�rka","Hussvala","Korp","Kr�ka","Kaja","Skata","Stj�rtmes","Talgoxe","Bl�mes","G�rdsmyg","Bj�rktrast","Taltrast","R�dvingetrast","Koltrast","Stenskv�tta","N�ktergal","R�dhake","Gr�shopps�ngare","R�rs�ngare","S�vs�ngare","H�rms�ngare","Svarth�tta","Tr�dg�rdss�ngare","�rts�ngare","L�vs�ngare","Gr� flugsnappare","J�rnsparv","S�des�rla","Gr�nfink","Gr�siska","Bofink","Bergfink","S�vsparv","Gr�sparv","Rosenfink"),  
  Norrbotten_Stann                =c("Dalripa","Fj�llripa","Orre","Tj�der","J�rpe","St�rre hackspett","Tret�spett","Spillkr�ka","Korp","Kr�ka","Skata","Lavskrika","Talgoxe","Bl�mes","Lappmes","Talltita","Tr�dkrypare","Sidensvans","Gr�nfink","Gr�siska","Domherre","Tallbit","Mindre korsn�bb","St�rre korsn�bb","Korsn�bb obest�md","Gulsparv","Gr�sparv"),
  Norrbotten_Europaflyttare       =c("Storlom","Sm�lom","Gr�sand","Kricka","Bl�sand","Vigg","Knipa","Alf�gel","Sj�orre","Sm�skrake","Storskrake","S�ngsvan","Fj�llvr�k","Stenfalk","Tornfalk","Trana","Tofsvipa","Ljungpipare","Enkelbeckasin","Storspov","K�rrsn�ppa","Fiskm�s","Dv�rgm�s","Skrattm�s","Ringduva","S�ngl�rka","Dubbeltrast","Taltrast","R�dvingetrast","Ringtrast","Koltrast","R�dhake","Grans�ngare","J�rnsparv","�ngspipl�rka","S�des�rla","Gr�nsiska","Bofink","Bergfink","S�vsparv","Lappsparv","Sn�sparv","Bj�rktrast","Kungsf�gel"),
  Norrbotten_L�ngflyttare         =c("Fiskgjuse","St�rre strandpipare","Sm�spov","Skogssn�ppa","Gr�nbena","Drillsn�ppa","R�dbena","Svartsn�ppa","Gluttsn�ppa","Mosn�ppa","Brushane","Smaln�bbad simsn�ppa","Silvert�rna","G�k","Tornseglare","G�ktyta","Ladusvala","Hussvala","Stenskv�tta","Buskskv�tta","R�dstj�rt","Bl�hake","S�vs�ngare","Tr�dg�rdss�ngare","L�vs�ngare","Gr� flugsnappare","Svartvit flugsnappare","Tr�dpipl�rka","Gul�rla","Videsparv","Fj�llabb","Rosenfink"),
  Norrbotten_R�dlistade           =c("Sm�lom","Fj�llvr�k","Brushane","Storspov","Drillsn�ppa","Tornseglare","G�ktyta","Tret�spett","S�ngl�rka","Lappmes","Lavskrika","Tallbit","Videsparv","Rosenfink"),
  Norrbotten_FDbilaga1            =c("Sm�lom","Storlom","S�ngsvan","Fiskgjuse","J�rpe","Orre","Tj�der","Trana","Ljungpipare","Brushane","Gr�nbena","Smaln�bbad simsn�ppa","Dv�rgm�s","Silvert�rna","Spillkr�ka","Tret�spett","Bl�hake","Stenfalk"),
  Norrbotten_Vadare               =c("Tofsvipa","St�rre strandpipare","Ljungpipare","Enkelbeckasin","Storspov","Sm�spov","Skogssn�ppa","Gr�nbena","Drillsn�ppa","R�dbena","Gluttsn�ppa","Svartsn�ppa","Mosn�ppa","K�rrsn�ppa","Brushane","Smaln�bbad simsn�ppa"),
  Norrbotten_Skogsh�ns            =c("Orre","Tj�der","J�rpe"),
  Norrbotten_Fj�llh�ns            =c("Fj�llripa","Dalripa")  
)
  
Milj�m�lind<-list(
  Levandeskog          =c("Tj�der","J�rpe","Skogsduva","Gr�ng�ling","Mindre hackspett","Tret�spett","N�tkr�ka","Lavskrika","Stj�rtmes","Svartmes","Tofsmes","Lappmes","Entita","Talltita","Tr�dkrypare","Domherre"),
  D�dved               =c("Gr�ng�ling","Mindre hackspett","Tret�spett","Entita","Talltita"),
  L�vrikskog           =c("Skogsduva","Gr�ng�ling","Mindre hackspett","Tret�spett","Stj�rtmes","Entita","Tr�dkrypare"),
  Gammalskog           =c("Tj�der","Tret�ig hackspett","Lavskrika","Svartmes","Tofsmes","Lappmes","Talltita","Tr�dkrypare","Domherre"),
  Odlingslandskap      =c("Tofsvipa","Storspov","S�ngl�rka","Ladusvala","Stenskv�tta","Buskskv�tta","T�rns�ngare","Gul�rla","T�rnskata","Stare","H�mpling","Gulsparv","Pilfink"),
  �ngsbetesmarker      =c("Tofsvipa","Storspov","Ladusvala","Stenskv�tta","Buskskv�tta","T�rns�ngare","Gul�rla","T�rnskata","Stare","H�mpling","Gulsparv"),
  Sm�biotoper          =c("Stenskv�tta","Buskskv�tta","T�rns�ngare","T�rnskata","Stare","H�mpling","Gulsparv"),
  Kalfj�ll             =c("Fj�llripa","Ljungpipare","Fj�llabb","Stenskv�tta","�ngspipl�rka","Lappsparv","Sn�sparv"),
  Fj�llskog            =c("Dalripa","R�dvingetrast","R�dstj�rt","Bl�hake","L�vs�ngare","Svartvit flugsnappare","Gr�siska","Bergfink"),
  LevandeSj�ar         =c("Storlom","Sm�lom","Sk�ggdopping","Vigg","Knipa","Sm�skrake","Storskrake","Fiskgjuse","Soth�na","Drillsn�ppa","Fiskt�rna","Silvert�rna","Fors�rla"),
  Myllrandev�tmarkerS  =c("R�rdrom","Kricka","S�ngsvan","Brun k�rrh�k","Trana","Soth�na","Enkelbeckasin","Gr�nbena"),
  Myllrandev�tmarkerN  =c("Sm�lom","Kricka","Bl�sand","S�ngsvan","Trana","Ljungpipare","Enkelbeckasin","Sm�spov","Gr�nbena","Svartsn�ppa","Gluttsn�ppa","K�rrsn�ppa","Brushane","Smaln�bbad simsn�ppa")
)


#popup checkbox to make a selection of indicators
w   <- gbasicdialog("V�lja indikatorer", do.buttons = FALSE)  #creates a modal dialog
gp  <- ggroup(container = w, horizontal=FALSE)
cbg <- gcheckboxgroup(names(Indikator), container=gp, handler = NULL) #Define checkbox values
gbutton("OK", container = gp, handler = function(h,...) {     #save chosen values in "ind" and close window when clicking OK
  ind <<-Indikator[svalue(cbg)]
  selst  <<- if(!"Odlingslandskap" %in% names(ind)&& !"�ngsbetesmarker" %in% names(ind)&& !"Sm�biotoper" %in% names(ind)) TRUE
  selst2 <<- if(!"Odlingslandskap" %in% names(ind)&& !"�ngsbetesmarker" %in% names(ind)&& !"Sm�biotoper" %in% names(ind)) FALSE
  selga  <<- if(!"Odlingslandskap" %in% names(ind)&& !"�ngsbetesmarker" %in% names(ind)&& !"Milj�m�l16" %in% names(ind)) TRUE
  selga2 <<- if(!"Odlingslandskap" %in% names(ind)&& !"�ngsbetesmarker" %in% names(ind)&& !"Milj�m�l16" %in% names(ind)) FALSE
  selfj  <<- if(!"Kalfj�ll" %in% names(ind)&& !"Fj�llskog" %in% names(ind)) TRUE
  selms  <<- if(!"Myllrandev�tmarkerS" %in% names(ind)) TRUE
  selmn  <<- if(!"Myllrandev�tmarkerN" %in% names(ind)) TRUE
  dispose(w) })
visible(w, TRUE) #Show popupwindow

#popup checkbox to select which wheatears and wagtails to include
if ("Odlingslandskap" %in% names(ind)|"�ngsbetesmarker" %in% names(ind)|"Sm�biotoper" %in% names(ind)|"Kalfj�ll" %in% names(ind)|"Fj�llskog" %in% names(ind)|"Milj�m�l16" %in% names(ind)|"Myllrandev�tmarkerS" %in% names(ind)|"Myllrandev�tmarkerN" %in% names(ind)){
  w  <- gbasicdialog("V�lj alternativ data", do.buttons = FALSE)  #creates a modal dialog
  gt <- ggroup(container = w, horizontal=TRUE)
  gp <- ggroup(container = gt, horizontal=FALSE)  
  if ("Odlingslandskap" %in% names(ind)|"�ngsbetesmarker" %in% names(ind)|"Sm�biotoper" %in% names(ind)){
    tmps    <- gframe("Odlingslandskap, �ngs-Betesmarker & Sm�biotoper", container=gp, horizontal=FALSE)
    addSpace(tmps,2)
    cbst    <- gcheckbox("Inkludera alla stenskv�tta", handler = NULL, container=tmps) #Define checkbox values
    cbst2   <- gcheckbox("Exkludera alla stenskv�tta", container=tmps, handler= NULL)
        filest  <- gfilebrowse("V�lj alternativ fil f�r stenskv�tte-data", container=tmps, quote = FALSE, filter = list("CSV files"=list(patterns="*.csv")))
    addSpace(tmps,4)
  }
  if ("Odlingslandskap" %in% names(ind)|"�ngsbetesmarker" %in% names(ind)){
    tmpg    <- gframe("Odlingslandskap & �ngs-Betesmarker", container=gp, horizontal=FALSE)
    addSpace(tmpg,2)
    cbga    <- gcheckbox("Inkludera alla gul�rla", container=tmpg, handler = NULL) #Define checkbox values
    cbga2   <- gcheckbox("Exkludera alla gul�rla", container=tmpg, handler= NULL)
    filega  <- gfilebrowse("V�lj alternativ fil f�r gul�rle-data", quote = FALSE, filter = list("CSV files"=list(patterns="*.csv")), container = tmpg)
    addSpace(tmpg,4)
  }
  if ("Kalfj�ll" %in% names(ind)|"Fj�llskog" %in% names(ind)){
    tmpf    <- gframe("Kalfj�ll & Fj�llskog", container=gp, horizontal=FALSE)
    addSpace(tmpf,2)
    cbfj    <- gcheckbox("Inkludera alla data", container=tmpf, handler = NULL) #Define checkbox values
    filefj  <- gfilebrowse("V�lj alternativ fil f�r fj�ll-data", quote = FALSE, filter = list("CSV files"=list(patterns="*.csv")), container = tmpf)
    addSpace(tmpf,4)
  }
  if ("Myllrandev�tmarkerS" %in% names(ind)){
    tmps    <- gframe("Myllrande v�tmarker S", container=gp, horizontal=FALSE)
    addSpace(tmps,2)
    cbms    <- gcheckbox("Inkludera alla data", container=tmps, handler = NULL) #Define checkbox values
    filems  <- gfilebrowse("V�lj alternativ fil f�r s�dra Sverige-data", quote = FALSE, filter = list("CSV files"=list(patterns="*.csv")), container = tmps)
    addSpace(tmps,4)
  }
  if ("Myllrandev�tmarkerN" %in% names(ind)){
    tmpn    <- gframe("Myllrande v�tmarker N", container=gp, horizontal=FALSE)
    addSpace(tmpn,2)
    cbmn    <- gcheckbox("Inkludera alla data", container=tmpn, handler = NULL) #Define checkbox values
    filemn  <- gfilebrowse("V�lj alternativ fil f�r norra Sverige-data", quote = FALSE, filter = list("CSV files"=list(patterns="*.csv")), container = tmpn)
    addSpace(tmpn,4)
  }
  gm  <- ggroup(container = gt, horizontal=FALSE)
  if ("Milj�m�l16" %in% names(ind)){
    tmpm    <- gframe("Milj�m�l 16", container=gm, horizontal=TRUE)
    addSpace(tmpm,4)
  gm1 <- ggroup(container=tmpm, horizontal=FALSE)
  glabel("", container=gm1)
  glabel("Inkludera arter fr�n", container=gm1)
  glabel("f�ljande indikatorer:", container=gm1)
  cbgm <- gcheckboxgroup(names(Milj�m�lind), container=gm1, handler=NULL)
  addSpace(tmpm,4)
  gm2 <- ggroup(container=tmpm, horizontal=FALSE)   
  if ("Odlingslandskap" %in% names(ind)|"�ngsbetesmarker" %in% names(ind)|"Sm�biotoper" %in% names(ind)|"Kalfj�ll" %in% names(ind)|"Fj�llskog" %in% names(ind)|"Myllrandev�tmarkerS" %in% names(ind)|"Myllrandev�tmarkerN" %in% names(ind)){
      cbto    <- gcheckbox("Inkludera allt som till v�nster", container=gm2, handler=NULL)
      glabel("------------------------- eller -------------------------", container=gm2)}
    cbst    <- gcheckbox("Inkludera alla stenskv�tta", container=gm2, handler = NULL)
    cbst2   <- gcheckbox("Exkludera alla stenskv�tta", container=gm2, handler= NULL)   
    filest2 <- gfilebrowse("V�lj alternativ fil f�r stenskv�tte-data", quote = FALSE, filter = list("CSV files"=list(patterns="*.csv")), container = gm2)
    cbga    <- gcheckbox("Inkludera alla gul�rla", container=gm2, handler = NULL)
    cbga2   <- gcheckbox("Exkludera alla gul�rla", container=gm2, handler= NULL)
    filega2 <- gfilebrowse("V�lj alternativ fil f�r gul�rle-data", quote = FALSE, filter = list("CSV files"=list(patterns="*.csv")), container = gm2)
    cbfj2   <- gcheckbox("Inkludera alla data f�r fj�ll-arter", container=gm2, handler = NULL)
    filefj2 <- gfilebrowse("V�lj alternativ fil f�r fj�ll-data", quote = FALSE, filter = list("CSV files"=list(patterns="*.csv")), container = gm2)
    cbms2   <- gcheckbox("Inkludera alla data i Myllrande v�tmarker S", container=gm2, handler = NULL)
    filems2 <- gfilebrowse("V�lj alternativ fil f�r southern-data", quote = FALSE, filter = list("CSV files"=list(patterns="*.csv")), container = gm2)
    cbmn2   <- gcheckbox("Inkludera alla data i Myllrande v�tmarker N", container=gm2, handler = NULL)
    filemn2 <- gfilebrowse("V�lj alternativ fil f�r northern-data", quote = FALSE, filter = list("CSV files"=list(patterns="*.csv")), container = gm2)
    addSpace(gm2,4)
  addSpace(tmpm,4)
   }
    
  gbutton("OK", container = w, handler = function(h,...) {     #save chosen values in "sel" and close window when clicking OK
    selst  <<- if("Odlingslandskap" %in% names(ind)|"�ngsbetesmarker" %in% names(ind)|"Sm�biotoper" %in% names(ind)) svalue(cbst) else TRUE
    selst2 <<- if("Odlingslandskap" %in% names(ind)|"�ngsbetesmarker" %in% names(ind)|"Sm�biotoper" %in% names(ind)) svalue(cbst2)  else FALSE
    selga  <<- if("Odlingslandskap" %in% names(ind)|"�ngsbetesmarker" %in% names(ind)) svalue(cbga)  else TRUE
    selga2 <<- if("Odlingslandskap" %in% names(ind)|"�ngsbetesmarker" %in% names(ind)) svalue(cbga2)  else FALSE
    selfj  <<- if("Kalfj�ll" %in% names(ind)|"Fj�llskog" %in% names(ind)) svalue(cbfj)  else TRUE
    selms  <<- if("Myllrandev�tmarkerS" %in% names(ind)) svalue(cbms)  else TRUE
    selmn  <<- if("Myllrandev�tmarkerN" %in% names(ind)) svalue(cbmn)  else TRUE
    
    if(selfj==FALSE)                    fj�ll <<-read.csv(file=paste(basename(svalue(filefj))), sep=";", dec=",")
    if(selms==FALSE)                    ms    <<-read.csv(file=paste(basename(svalue(filems))), sep=";", dec=",")
    if(selmn==FALSE)                    mn    <<-read.csv(file=paste(basename(svalue(filemn))), sep=";", dec=",")
    if(selst==FALSE && selst2==FALSE)   st    <<-read.csv(file=paste(basename(svalue(filest))), sep=";", dec=",")
    if(selga==FALSE && selga2==FALSE)   ga    <<-read.csv(file=paste(basename(svalue(filega))), sep=";", dec=",")
    
    dispose(w) })
  visible(w, TRUE) #Show popupwindow
}

if(selst==FALSE && selst2==FALSE) {
  st    <- st[,c(5,2,3,4,6)]
  colnames(st) <- c("Art","�r","Index","SE","arthela")
  st    <- st[st$arthela == "Stenskv�tta",]
}  
if(selga==FALSE && selga2==FALSE) {
  ga    <-ga[,c(5,2,3,4,6)]
  colnames(ga) <- c("Art","�r","Index","SE","arthela")
  ga    <- ga[ga$arthela == "Gul�rla",]
}


##write line to make checkbox svalues exclusive!

gm_mean = function(x, na.rm=TRUE){exp(sum(log(x[x > 0]), na.rm=na.rm) / length(x))}

for(i in 1:length(ind)){  
  
  Arter <- unlist(ind[i])
  
  if (selst==FALSE && selst2==FALSE && selga==TRUE && c(names(ind[i])=="Odlingslandskap"|names(ind[i])=="�ngsbetesmarker"|names(ind[i])=="Sm�biotoper")) { 
    In <- t[t$arthela %in% Arter,c("Art","�r","Index","arthela")]
    In <- In[!In$arthela == "Stenskv�tta",]
    Se <- t[t$arthela %in% Arter,c("Art","�r","SE","arthela")]                                                      
    Se <- Se[!Se$arthela == "Stenskv�tta",]
    
    In <- rbind(In,st[,c(1,2,3,5)])
    Se <- rbind(Se,st[,c(1,2,4,5)])  
    
  } else if (selga==FALSE && selga2==FALSE && selst==TRUE && c(names(ind[i])=="Odlingslandskap"|names(ind[i])=="�ngsbetesmarker"|names(ind[i])=="Sm�biotoper"|names(ind[i])=="Milj�m�l16")) { 
    In <- t[t$arthela %in% Arter,c("Art","�r","Index","arthela")]
    In <- In[!In$arthela == "Gul�rla",]
    Se <- t[t$arthela %in% Arter,c("Art","�r","SE","arthela")]                                                      
    Se <- Se[!Se$arthela == "Gul�rla",]
    
    In <- rbind(In,ga[,c(1,2,3,5)])
    Se <- rbind(Se,ga[,c(1,2,4,5)])  
    
  } else if (selst==FALSE && selst2==FALSE && selga==FALSE && selga2==FALSE && c(names(ind[i])=="Odlingslandskap"|names(ind[i])=="�ngsbetesmarker"|names(ind[i])=="Sm�biotoper")){
    In <- t[t$arthela %in% Arter,c("Art","�r","Index","arthela")]
    In <- In[!In$arthela == "Stenskv�tta",]
    In <- In[!In$arthela == "Gul�rla",]
    Se <- t[t$arthela %in% Arter,c("Art","�r","SE","arthela")]                                                      
    Se <- Se[!Se$arthela == "Stenskv�tta",]
    Se <- Se[!Se$arthela == "Gul�rla",]
    
    In <- rbind(In,ga[,c(1,2,3,5)],st[,c(1,2,3,5)])
    In <- In[In$arthela %in% Arter,c("Art","�r","Index","arthela")]
    Se <- rbind(Se,ga[,c(1,2,4,5)],st[,c(1,2,4,5)])
    Se <- Se[Se$arthela %in% Arter,c("Art","�r","SE","arthela")] 
    
  } else if (selfj==FALSE && c(names(ind[i])=="Kalfj�ll"|names(ind[i])=="Fj�llskog")){
    In <- fj�ll[fj�ll$arthela %in% Arter,c("Art","�r","Index","arthela")] 
    Se <- fj�ll[fj�ll$arthela %in% Arter,c("Art","�r","SE","arthela")]    
 
  } else if (selms==FALSE && names(ind[i])=="Myllrandev�tmarkerS"){
    In <- ms[ms$arthela %in% Arter,c("Art","�r","Index","arthela")] 
    Se <- ms[ms$arthela %in% Arter,c("Art","�r","SE","arthela")] 
    
  } else if (selms==FALSE && names(ind[i])=="Myllrandev�tmarkerN"){
    In <- mn[mn$arthela %in% Arter,c("Art","�r","Index","arthela")] 
    Se <- mn[mn$arthela %in% Arter,c("Art","�r","SE","arthela")]   
    
  } else {
      In <- t[t$arthela %in% Arter,c("Art","�r","Index","arthela")] 
      Se <- t[t$arthela %in% Arter,c("Art","�r","SE","arthela")] 
    }
    

if (selst2==TRUE && c(names(ind[i])=="Odlingslandskap"|names(ind[i])=="�ngsbetesmarker"|names(ind[i])=="Sm�biotoper")) { 
In <- In[!In$arthela == "Stenskv�tta",]
Se <- Se[!Se$arthela == "Stenskv�tta",]
}
if (selga2==TRUE && c(names(ind[i])=="Odlingslandskap"|names(ind[i])=="�ngsbetesmarker"|names(ind[i])=="Sm�biotoper")) { 
In <- In[!In$arthela == "Gul�rla",]
Se <- Se[!Se$arthela == "Gul�rla",]
}

In <- dcast(In, Art+arthela~�r, value.var="Index")
rownames(In) <- In[,2]
In[,1:2] <- list(NULL)

Se <- dcast(Se, Art+arthela~�r, value.var="SE")
rownames(Se) <- Se[,2]
Se[,1:2] <- list(NULL)

a<-((1/In)^2)*(Se^2)
asum<-colSums(a)
b<-(1/nrow(In))^2
c<-(apply(In,2, gm_mean))^2
c1<-apply(In,2, gm_mean)
d<-(c*b*asum)^0.5
g<-1.96*d
e<-c1+g
f<-c1-g

out<-rbind(c1,e,f,g,d)
out<-melt(out)
out<-dcast(out, Var2~Var1)
colnames(out) <- c("�r","Index","","","95%ko","SE")
write.csv2(out, file = (paste(names(ind[i]),".csv", sep='')),row.names=FALSE)
} 

## END