
install.packages("readstata13")
library("readstata13")
nes <- read.dta13(file="C:/Users/Raziel/Documents/Malka Research Seminar/R/anes_timeseries_2020_stata_20210324.dta", convert.factors=F)
dim(nes)


#political engagement
nes$attnpol<-nes$V201005
nes$attnpol[nes$attnpol==-9]<-NA
nes$attnpol<-1-((nes$attnpol-1)/4)
table(nes$attnpol)

nes$intcampaign<-nes$V201006
nes$intcampaign[nes$intcampaign==-9]<-NA
nes$intcampaign<-1-((nes$intcampaign-1)/2)

#conlib, with haven't thought in middle
nes$ideoid<-nes$V201200
nes$ideoid[nes$ideoid%in%c(-9,-8)]<-NA
nes$ideoid[nes$ideoid==99]<-4
nes$ideoid<-(nes$ideoid-1)/6


#strength of preference for candidate

nes$reg<-nes$V201034
nes$reg[nes$reg%in%c(-9,-1)]<-NA
nes$reg[nes$reg==-8]<-1.5
nes$reg<-1-(nes$reg-1)/1
table(nes$reg, exclude = NULL)


#V201311x into crimesp, higher is increase
nes$crimesp<-nes$V201311x
nes$crimesp[nes$crimesp==-2]<-NA
nes$crimesp<-1-((nes$crimesp-1)/4)

#V201314x into welfaresp, higher is decrease.
nes$welfaresp<-nes$V201314x
nes$welfaresp[nes$welfaresp==-2]<-NA
nes$welfaresp<-((nes$welfaresp-1)/4)

#V201365 into electiondelay, delay election is 1, options 2-4 are all 0
nes$electiondelay<-nes$V201365
nes$electiondelay[nes$electiondelay%in%c(-9,-8)]<-NA
nes$electiondelay[nes$electiondelay%in%c(2,3,4)]<-0
