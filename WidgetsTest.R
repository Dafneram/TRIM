cbg[1]<-Levandeskog
cbg[2]<-D�dved
cbg[3]<-L�vrikskog
cbg[4]<-Gammalskog
cbg[5]<-�dlingslandskap
cbg[6]<-�ngsbetesmarker
cbg[7]<-Sm�biotoper
cbg[8]<-Kalfj�ll
cbg[9]<-Fj�llskog
cbg[10]<-LevandeSj�ar
cbg[11]<-Myllrandev�tmarkerS
cbg[12]<-Myllrandev�tmarkerN

Levandeskog          <-c("Tj�der","J�rpe","Skogsduva","Gr�ng�ling","Mindre hackspett","Tret�ig hackspett","N�tkr�ka","Lavskrika","Stj�rtmes","Svartmes","Tofsmes","Lappmes","Entita","Talltita","Tr�dkrypare","Domherre")
D�dved               <-c("Gr�ng�ling","Mindre hackspett","Tret�ig hackspett","Entita","Talltita")
L�vrikskog           <-c("Skogsduva","Gr�ng�ling","Mindre hackspett","Tret�ig hackspett","Stj�rtmes","Entita","Tr�dkrypare")
Gammalskog           <-c("Tj�der","Tret�ig hackspett","Lavskrika","Svartmes","Tofsmes","Lappmes","Talltita","Tr�dkrypare","Domherre")
Odlingslandskap      <-c("Tofsvipa","Storspov","S�ngl�rka","Ladusvala","Stenskv�tta","Buskskv�tta","T�rns�ngare","Gul�rla","T�rnskata","Stare","H�mpling","Gulsparv","Pilfink")
�ngsbetesmarker      <-c("Tofsvipa","Storspov","Ladusvala","Stenskv�tta","Buskskv�tta","T�rns�ngare","Gul�rla","T�rnskata","Stare","H�mpling","Gulsparv")
Sm�biotoper          <-c("Stenskv�tta","Buskskv�tta","T�rns�ngare","T�rnskata","Stare","H�mpling","Gulsparv")
#Kalfj�ll             <-c("Fj�llripa","Ljungpipare","Fj�llabb","Stenskv�tta","�ngspipl�rka","Lappsparv","Sn�sparv")
#Fj�llskog            <-c("Dalripa","R�dvingetrast","R�dstj�rt","Bl�hake","L�vs�ngare","Svartvit flugsnappare","Gr�siska","Bergfink")
#LevandeSj�ar         <-c("Storlom","Sm�lom","Sk�ggdopping","Vigg","Knipa","Sm�skrake","Storskrake","Fiskgjuse","Soth�na","Drillsn�ppa","Fiskt�rna","Silvert�rna","Fors�rla")
#Myllrandev�tmarkerS  <-c("R�rdrom","Kricka","S�ngsvan","Brun k�rrh�k","Trana","Soth�na","Enkelbeckasin","Gr�nbena")
#Myllrandev�tmarkerN  <-c("Sm�lom","Kricka","Bl�sand","S�ngsvan","Trana","Ljungpipare","Enkelbeckasin","Sm�spov","Gr�nbena","Svartsn�ppa","Gluttsn�ppa","K�rrsn�ppa","Brushane","Smaln�bbad sim")


Indikator<-list(Levandeskog,D�dved,L�vrikskog,Gammalskog,Odlingslandskap,�ngsbetesmarker,Sm�biotoper,Kalfj�ll,Fj�llskog,LevandeSj�ar,Myllrandev�tmarkerS,Myllrandev�tmarkerN)

Indikator<-list(
  Levandeskog          =c("Tj�der","J�rpe","Skogsduva","Gr�ng�ling","Mindre hackspett","Tret�ig hackspett","N�tkr�ka","Lavskrika","Stj�rtmes","Svartmes","Tofsmes","Lappmes","Entita","Talltita","Tr�dkrypare","Domherre"),
  D�dved               =c("Gr�ng�ling","Mindre hackspett","Tret�ig hackspett","Entita","Talltita"),
  L�vrikskog           =c("Skogsduva","Gr�ng�ling","Mindre hackspett","Tret�ig hackspett","Stj�rtmes","Entita","Tr�dkrypare"),
  Gammalskog           =c("Tj�der","Tret�ig hackspett","Lavskrika","Svartmes","Tofsmes","Lappmes","Talltita","Tr�dkrypare","Domherre"),
  Odlingslandskap      =c("Tofsvipa","Storspov","S�ngl�rka","Ladusvala","Stenskv�tta","Buskskv�tta","T�rns�ngare","Gul�rla","T�rnskata","Stare","H�mpling","Gulsparv","Pilfink"),
  �ngsbetesmarker      =c("Tofsvipa","Storspov","Ladusvala","Stenskv�tta","Buskskv�tta","T�rns�ngare","Gul�rla","T�rnskata","Stare","H�mpling","Gulsparv"),
  Sm�biotoper          =c("Stenskv�tta","Buskskv�tta","T�rns�ngare","T�rnskata","Stare","H�mpling","Gulsparv"),
  Kalfj�ll             =c("Fj�llripa","Ljungpipare","Fj�llabb","Stenskv�tta","�ngspipl�rka","Lappsparv","Sn�sparv"),
  Fj�llskog            =c("Dalripa","R�dvingetrast","R�dstj�rt","Bl�hake","L�vs�ngare","Svartvit flugsnappare","Gr�siska","Bergfink"),
  LevandeSj�ar         =c("Storlom","Sm�lom","Sk�ggdopping","Vigg","Knipa","Sm�skrake","Storskrake","Fiskgjuse","Soth�na","Drillsn�ppa","Fiskt�rna","Silvert�rna","Fors�rla"),
  Myllrandev�tmarkerS  =c("R�rdrom","Kricka","S�ngsvan","Brun k�rrh�k","Trana","Soth�na","Enkelbeckasin","Gr�nbena"),
  Myllrandev�tmarkerN  =c("Sm�lom","Kricka","Bl�sand","S�ngsvan","Trana","Ljungpipare","Enkelbeckasin","Sm�spov","Gr�nbena","Svartsn�ppa","Gluttsn�ppa","K�rrsn�ppa","Brushane","Smaln�bbad sim")
)


Indikator_namn<-list(
  "Levandeskog",
  "D�dved",
  "L�vrikskog",
  "Gammalskog",
  "Odlingslandskap",
  "�ngsbetesmarker",
  "Sm�biotoper"
  #  "Kalfj�ll",
  #  "Fj�llskog",
  #  "LevandeSj�ar",
  #  "Myllrandev�tmarkerS",
  #  "Myllrandev�tmarkerN"
)

flavors <- c("vanilla", "chocolate", "strawberry")

f <- function(h,...) print(
  paste("Yum",
        paste(svalue(h$obj),collapse=" and "),
        sep = " "))

w <- gwindow("checkbox example")
gp <- ggroup(container=w)
glabel("Favorite flavors:",container=gp)
cbg <- gcheckboxgroup(flavors, container=gp, handler=f)

svalue(cbg) <- c(TRUE, FALSE, TRUE)
svalue(cbg)
svalue(cbg) <- "vanilla"
svalue(cbg, index=TRUE) <- 1:2
cbg[3] <- "raspberry"

## use a table to display (toolkit specific) so that scrollars can be used
cbg <- gcheckboxgroup(letters, container=gwindow(), use.table=TRUE)



confirmDialog <- function(message, handler=NULL) {
window <- gwindow("Confirm")
group <- ggroup(container = window)
gimage("info", dirname="stock", size="dialog", container=group)

## A group for the message and buttons
inner.group <- ggroup(horizontal=FALSE, container = group)
glabel(message, container=inner.group, expand=TRUE)

## A group to organize the buttons
button.group <- ggroup(container = inner.group)
## Push buttons to right
addSpring(button.group)
gbutton("ok", handler=handler, container=button.group)
gbutton("cancel", handler = function(h,...) dispose(window),
container=button.group)

return()
}

if(interactive()) {
  w <- gwindow("Selection widgets")
  g <- gvbox(cont=w)
  
  fl <- gformlayout(cont=g)
  gcheckbox("checkbox", checked=TRUE, cont=fl, label="checkbox")
  gradio(state.name[1:4], selected=2, horizontal=TRUE, cont=fl, label="gradio")
  gcheckboxgroup(state.name[1:4], horizontal=FALSE, cont=fl, label="checkbox group")
  
  bg <- ggroup(cont=g)
  gbutton("ok", cont=bg, handler=function(h,...) print(sapply(fl$children, svalue)))
  

  
  
}

## button group example
w <- gwindow("Button examples")
g <- ggroup(container = w)
addSpring(g)   ## push to right of widget
gbutton("help", container = g)
addSpace(g, 20) ## some breathing room
gbutton("cancel", container = g)
gbutton("ok", container = g, handler = function(h, ...) cat("do it\n"))


flavors<-c("vanilla", "chocolate", "strawberry") 

w <- gwindow("checkbox example") 
gp <- ggroup(container=w) 
glabel("Favorite flavors:",cont=gp) 
cbg <- gcheckboxgroup(flavors, container=gp, handler=f)

# Here is the trick 
addHandlerClicked(cbg,handler=function(h,...){ 
  My_Flav<-svalue(cbg) 
  print(My_Flav) 
}) 

w <- gwindow(visible=FALSE) 
g <- ggroup(cont=w, horizontal=FALSE) 
tbl <- gtable(mtcars[1:5,], cont=g, multiple=TRUE, expand=TRUE) 
b <- gbutton("click", cont=g, handler=function(h,...) { 
  print(svalue(tbl)) 
}) 
visible(w) <- TRUE 


svalue(tbl, index=TRUE) <- 1:2 
print(svalue(tbl, index=TRUE)) 


group = ggroup(horizontal=FALSE, container=gwindow("two widgets"))
button = gbutton("click me", container=group)
label = glabel("Button has not been clicked", container=group)
addhandlerclicked(button, handler = function(h,...) {
  svalue(h$obj) <-"click me again"
  svalue(h$action) <- "Button has been clicked"
}, action = label)


tkwait.window



w <- gwindow("Two widgets")
g <- ggroup(container = w)
widget1 <- gbutton("Click me to update the counter", container=g,
                     handler = function(h,...) {
                       oldVal <- svalue(widget2)
                       svalue(widget2) <- as.numeric(oldVal) + 1
                       })
widget2 <- glabel(0, container=g)

list.condition <- sapply(input.list, function(x) class(x)=="desired.class")
output.list  <- input.list[list.condition]

a<-c("aap","paard","vogel")
b<-c("aap","slang","vogel","neushoorn")
c<-c("slang","paard")

Indicator<-list(a,b,c)