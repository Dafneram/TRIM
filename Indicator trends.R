##after running indikatorer.R!

setwd("C:/Users/Dafne/Desktop/Svensk F�geltaxering/Databases and TRIM/Indikatorer/Indicator trends")

Levandeskog          =c("Tj�der","J�rpe","Skogsduva","Gr�ng�ling","Mindre hackspett","Tret�spett","N�tkr�ka","Lavskrika","Stj�rtmes","Svartmes","Tofsmes","Lappmes","Entita","Talltita","Tr�dkrypare","Domherre")
D�dved               =c("Gr�ng�ling","Mindre hackspett","Tret�spett","Entita","Talltita")
L�vrikskog           =c("Skogsduva","Gr�ng�ling","Mindre hackspett","Tret�spett","Stj�rtmes","Entita","Tr�dkrypare")
Gammalskog           =c("Tj�der","Tret�spett","Lavskrika","Svartmes","Tofsmes","Lappmes","Talltita","Tr�dkrypare","Domherre")
Skogsf�glar          =c("Bergfink","Bj�rktrast","Bl�mes","Bofink","Domherre","Dubbeltrast","Entita","Grans�ngare","Gr� flugsnappare","Gr�spett","Gr�ng�ling","Gr�nsiska","Gr�ns�ngare","G�rdsmyg","G�ktyta","Halsbandsflugsnappare","H�rms�ngare","J�rnsparv","J�rpe","Korp","Kungsf�gel","Lappmes","Lavskrika","L�vs�ngare","Mindre flugsnappare","Mindre hackspett","Mindre korsn�bb","Morkulla","N�ktergal","N�tkr�ka","N�tskrika","N�tv�cka","Orre","R�dhake","R�dstj�rt","R�dvingetrast","Sidensvans","Skogsduva","Skogssn�ppa","Spillkr�ka","Stenkn�ck","Stj�rtmes","St�rre hackspett","St�rre korsn�bb","Svarth�tta","Svartmes","Svartvit flugsnappare","Talgoxe","Talltita","Taltrast","Tj�der","Tofsmes","Tret�spett","Tr�dg�rdss�ngare","Tr�dkrypare","Tr�dl�rka","Tr�dpipl�rka","Videsparv")
Skogsf�glarNonInd    =c("Bergfink","Bj�rktrast","Bl�mes","Bofink","Dubbeltrast","Grans�ngare","Gr� flugsnappare","Gr�spett","Gr�nsiska","Gr�ns�ngare","G�rdsmyg","G�ktyta","Halsbandsflugsnappare","H�rms�ngare","J�rnsparv","Korp","Kungsf�gel","L�vs�ngare","Mindre flugsnappare","Mindre korsn�bb","Morkulla","N�ktergal","N�tskrika","N�tv�cka","Orre","R�dhake","R�dstj�rt","R�dvingetrast","Sidensvans","Skogssn�ppa","Spillkr�ka","Stenkn�ck","St�rre hackspett","St�rre korsn�bb","Svarth�tta","Svartvit flugsnappare","Talgoxe","Taltrast","Tr�dg�rdss�ngare","Tr�dl�rka","Tr�dpipl�rka","Videsparv")
Skogsf�glarR         =c("Bl�mes","Domherre","Entita","Gr�spett","Gr�ng�ling","J�rpe","Korp","Lappmes","Lavskrika","Mindre hackspett","Mindre korsn�bb","N�tkr�ka","N�tskrika","N�tv�cka","Orre","Sidensvans","Spillkr�ka","Stenkn�ck","Stj�rtmes","St�rre hackspett","St�rre korsn�bb","Svartmes","Talgoxe","Talltita","Tj�der","Tofsmes","Tret�spett","Tr�dkrypare")
Skogsf�glarM         =c("Bergfink","Bj�rktrast","Bofink","Dubbeltrast","Grans�ngare","Gr� flugsnappare","Gr�nsiska","Gr�ns�ngare","G�rdsmyg","G�ktyta","Halsbandsflugsnappare","H�rms�ngare","J�rnsparv","Kungsf�gel","L�vs�ngare","Mindre flugsnappare","Morkulla","N�ktergal","R�dhake","R�dstj�rt","R�dvingetrast","Skogsduva","Skogssn�ppa","Svarth�tta","Svartvit flugsnappare","Taltrast","Tr�dg�rdss�ngare","Tr�dl�rka","Tr�dpipl�rka","Videsparv")

EURO<- read.csv("EUROLIST.csv", sep=",", dec=",")[,c(1,2)]
colnames(EURO)<-c("species.number","species")

In$species <- rownames(In)
Index<-melt(In)
Index <- merge(Index, EURO, by="species") 
colnames(Index)<-c("species","year","index","species.number")

InBL   <- Index[Index$species %in% L�vrikskog, c("year","index","species number")] 
InOLD  <- Index[Index$species %in% Gammalskog, c("year","index","species number")] 
InDW   <- Index[Index$species %in% D�dved, c("year","index","species number")] 
InGen  <- Index[Index$species %in% Skogsf�glarNonInd, c("year","index","species number")] 
InSpec <- Index[Index$species %in% Levandeskog, c("year","index","species number")] 
InR    <- Index[Index$species %in% Skogsf�glarR, c("year","index","species number")] 
InM    <- Index[Index$species %in% Skogsf�glarM, c("year","index","species number")] 
InSF   <- Index[Index$species %in% Skogsf�glar, c("year","index","species number")] 

Se$species <- rownames(Se)
SE <- melt(Se)
SE <- merge(SE, EURO, by="species")
colnames(SE)<-c("species","year","se of index","species.number")

SeBL   <- SE[SE$species %in% L�vrikskog, c("year","se of index","species number")] 
SeOLD  <- SE[SE$species %in% Gammalskog, c("year","se of index","species number")] 
SeDW   <- SE[SE$species %in% D�dved, c("year","se of index","species number")] 
SeGen  <- SE[SE$species %in% Skogsf�glarNonInd, c("year","se of index","species number")] 
SeSpec <- SE[SE$species %in% Levandeskog, c("year","se of index","species number")] 
SeR    <- SE[SE$species %in% Skogsf�glarR, c("year","se of index","species number")] 
SeM    <- SE[SE$species %in% Skogsf�glarM, c("year","se of index","species number")]
SeSF   <- SE[SE$species %in% Skogsf�glar, c("year","se of index","species number")]


InSeBL    <- merge(InBL, SeBL, by=c("species number", "year"))
InSeOLD   <- merge(InOLD, SeOLD, by=c("species number", "year"))
InSeDW    <- merge(InDW, SeDW, by=c("species number", "year"))
InSeGen   <- merge(InGen, SeGen, by=c("species number", "year"))
InSeSpec  <- merge(InSpec, SeSpec, by=c("species number", "year"))
InSeR     <- merge(InR, SeR, by=c("species number", "year"))
InSeM     <- merge(InM, SeM, by=c("species number", "year"))
InSeSF    <- merge(InSF, SeSF, by=c("species number", "year"))

InSe <- merge(Index, SE, by=c("species.number","year"))
InSe <- InSe[,c(1,2,4,6)]

write.csv2(InSeBL,"BL_SN.csv",row.names=FALSE)
write.csv2(InSeOLD,"OLD_SN.csv",row.names=FALSE)
write.csv2(InSeDW,"DW_SN.csv",row.names=FALSE)
write.csv2(InSeGen,"Gen.csv",row.names=FALSE)
write.csv2(InSeSpec,"Spec.csv",row.names=FALSE)
write.csv2(InSeR,"M.csv",row.names=FALSE)
write.csv2(InSeM,"R.csv",row.names=FALSE)
write.csv2(InSeSF,"SF.csv",row.names=FALSE)

# 1-SG
# 2-EG
# 3-WGS
# 4-ES
# 5-SN
# 6-NN
# 7-SF
# 1-BL
# 2-OLD
# 3-DW
# 4-Spec
library(reshape2)

t <- InSe
ti<-dcast(t, species.number~year, value.var="index")
ts<-dcast(t, species.number~year, value.var="se of index")
t1<-rbind(ti,ts)
t1$indicator.number<-24

t1<-merge(EURO,t1, by="species.number")
t1 <- t1[order(t1$`2002`,decreasing=TRUE),]
t1 <- t1[order(t1$species.number),]
t1 <- t1[order(t1$indicator.number),]
t1 <- t1[,c(17,1:16)]

t24<-t1

write.csv2(t1,"SF.csv",row.names=FALSE)


ttt<-rbind(t64,t54,t44,t34,t24,t14)
ttt2 <- ttt[order(ttt$`2002`,decreasing=TRUE),]
ttt2 <- ttt2[order(ttt2$species.number),]
ttt2 <- ttt2[order(ttt2$indicator.number),]
write.csv2(ttt2,"Regional_spec.csv",row.names=FALSE)

tt<-rbind(t11,t21,t31,t41,t51,t61,t12,t22,t32,t42,t52,t62,t13,t23,t33,t43,t53,t63)
tt2<-merge(EURO,tt, by="species.number")
tt2 <- tt2[order(tt2$`2002`,decreasing=TRUE),]
tt2 <- tt2[order(tt2$species.number),]
tt2 <- tt2[order(tt2$indicator.number),]
tt2<-tt2[,c(17,1:16)]
write.csv2(tt2,"Regional.csv",row.names=FALSE)
