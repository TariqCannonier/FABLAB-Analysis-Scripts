#Load Data
setwd("/Volumes/Main/Casey-Lab/EmotionalNback/SCRIPTS/")
WMBehavgoodperf = read.csv("EmoNback_WMBehav.csv")
RECBehavgoodperf = read.csv("EmoNback_RECBehav.csv")

#Load relevant Packages
library(reshape2)
library(plyr)
library(lme4)
library(lmerTest)


NbackBehav<-merge(WMBehavgoodperf, RECBehavgoodperf, by = "Subject")
#NbackBehav$ExactAgescale <- ((NbackBehav$ExactAge.x)-15)
#NbackBehav$ExactAgecent <- scale(NbackBehav$ExactAgescale, center = FALSE, scale = TRUE)
NbackBehav$ExactAgescale <- NbackBehav$ExactAge.x
NbackBehav$ExactAgecent <- scale(NbackBehav$ExactAgescale, center = TRUE, scale = TRUE)
NbackBehav$ExactAgesqcent <- (NbackBehav$ExactAgecent)^2
NbackBehav$ExactAgecubecent <- (NbackBehav$ExactAgecent)^3
NbackBehav2 <- NbackBehav
NbackBehav2$Subject.f<-factor(NbackBehav2$Subject)
NbackBehav0hr <- subset(NbackBehav, RECCondition.x=="Immediate")
NbackBehav0hr$Subject.f<-factor(NbackBehav0hr$Subject)
NbackBehav24hr <- subset(NbackBehav, RECCondition.x=="24hr")
NbackBehav24hr$Subject.f<-factor(NbackBehav24hr$Subject)

###################################################
############## PREP OVERALL VALUES ################
###################################################

#Full stats prep
NbackBehav2Pr= NbackBehav2
names(NbackBehav2Pr)[names(NbackBehav2Pr)=="Place_Pr"] <-"Place"
names(NbackBehav2Pr)[names(NbackBehav2Pr)=="Neut_Pr"] <-"Neut"
names(NbackBehav2Pr)[names(NbackBehav2Pr)=="Happy_Pr"] <-"Happy"
names(NbackBehav2Pr)[names(NbackBehav2Pr)=="Fear_Pr"] <-"Fear"

NbackBehavreshapePr <- melt (NbackBehav2Pr, id.var=c("Subject.f","ExactAgecent", "ExactAgesqcent", "ExactAgecubecent", "Gender.x", "RECCondition.x"),
                               measure.vars=c("Neut", "Place", "Happy", "Fear"),
                               variable.name="condition", value.name="OverallPr")

NbackBehav2ACC= NbackBehav2
names(NbackBehav2ACC)[names(NbackBehav2ACC)=="PlaceBlocks_ACC"] <-"Place"
names(NbackBehav2ACC)[names(NbackBehav2ACC)=="NeutBlocks_ACC"] <-"Neut"
names(NbackBehav2ACC)[names(NbackBehav2Pr)=="HappyBlocks_ACC"] <-"Happy"
names(NbackBehav2ACC)[names(NbackBehav2Pr)=="FearBlocks_ACC"] <-"Fear"

NbackBehavreshapeWM <- melt (NbackBehav2ACC, id.var=c("Subject.f"),
                               measure.vars=c("Neut", "Place", "Happy", "Fear"),
                               variable.name="condition", value.name="OverallWMACC")

NbackBehavmelted <- merge(NbackBehavreshapePr, NbackBehavreshapeWM, by=c("Subject.f","condition"))


#0 hr stats Prep
NbackBehav0hrdp= NbackBehav0hr
names(NbackBehav0hrdp)[names(NbackBehav0hrdp)=="Place_dprime"] <-"Place"
names(NbackBehav0hrdp)[names(NbackBehav0hrdp)=="Neut_dprime"] <-"Neut"
names(NbackBehav0hrdp)[names(NbackBehav0hrdp)=="Happy_dprime"] <-"Happy"
names(NbackBehav0hrdp)[names(NbackBehav0hrdp)=="Fear_dprime"] <-"Fear"

NbackBehavreshape0hrdp <- melt (NbackBehav0hrdp, id.var=c("Subject.f","ExactAgecent", "ExactAgesqcent", "ExactAgecubecent", "Gender.x"),
                               measure.vars=c("Neut", "Place", "Happy", "Fear"),
                               variable.name="condition", value.name="Overalldp")

NbackBehav0hrHR= NbackBehav0hr
names(NbackBehav0hrHR)[names(NbackBehav0hrHR)=="Place_TargetHR"] <-"Place"
names(NbackBehav0hrHR)[names(NbackBehav0hrHR)=="Neut_TargetHR"] <-"Neut"
names(NbackBehav0hrHR)[names(NbackBehav0hrHR)=="Happy_TargetHR"] <-"Happy"
names(NbackBehav0hrHR)[names(NbackBehav0hrHR)=="Fear_TargetHR"] <-"Fear"

NbackBehavreshape0hrHR <- melt (NbackBehav0hrHR, id.var=c("Subject.f","ExactAgecent", "ExactAgesqcent", "ExactAgecubecent", "Gender.x"),
                                measure.vars=c("Neut", "Place", "Happy", "Fear"),
                                variable.name="condition", value.name="OverallTargetHR")

NbackBehav0hrACC= NbackBehav0hr
names(NbackBehav0hrACC)[names(NbackBehav0hrACC)=="PlaceBlocks_ACC"] <-"Place"
names(NbackBehav0hrACC)[names(NbackBehav0hrACC)=="NeutBlocks_ACC"] <-"Neut"
names(NbackBehav0hrACC)[names(NbackBehav0hrACC)=="HappyBlocks_ACC"] <-"Happy"
names(NbackBehav0hrACC)[names(NbackBehav0hrACC)=="FearBlocks_ACC"] <-"Fear"

NbackBehavreshape0hr2 <- melt (NbackBehav0hrACC, id.var=c("Subject.f"),
                               measure.vars=c("Neut", "Place", "Happy", "Fear"),
                               variable.name="condition", value.name="OverallWMACC")

Nback0hrmelteddp <- merge(NbackBehavreshape0hrdp, NbackBehavreshape0hr2, by=c("Subject.f","condition"))
Nback0hrmeltedHR <- merge(NbackBehavreshape0hrHR, NbackBehavreshape0hr2, by=c("Subject.f","condition"))

# 24 hr stats prep
NbackBehav24hrdp= NbackBehav24hr
names(NbackBehav24hrdp)[names(NbackBehav24hrdp)=="Place_dprime"] <-"Place"
names(NbackBehav24hrdp)[names(NbackBehav24hrdp)=="Neut_dprime"] <-"Neut"
names(NbackBehav24hrdp)[names(NbackBehav24hrdp)=="Happy_dprime"] <-"Happy"
names(NbackBehav24hrdp)[names(NbackBehav24hrdp)=="Fear_dprime"] <-"Fear"

NbackBehavreshape24hrdp <- melt (NbackBehav24hrdp, id.var=c("Subject.f","ExactAgecent", "ExactAgesqcent", "ExactAgecubecent", "Gender.x"),
                                measure.vars=c("Neut", "Place", "Happy", "Fear"),
                                variable.name="condition", value.name="Overalldp")

NbackBehav24hrHR= NbackBehav24hr
names(NbackBehav24hrHR)[names(NbackBehav24hrHR)=="Place_TargetHR"] <-"Place"
names(NbackBehav24hrHR)[names(NbackBehav24hrHR)=="Neut_TargetHR"] <-"Neut"
names(NbackBehav24hrHR)[names(NbackBehav24hrHR)=="Happy_TargetHR"] <-"Happy"
names(NbackBehav24hrHR)[names(NbackBehav24hrHR)=="Fear_TargetHR"] <-"Fear"

NbackBehavreshape24hrHR <- melt (NbackBehav24hrHR, id.var=c("Subject.f","ExactAgecent", "ExactAgesqcent", "ExactAgecubecent", "Gender.x"),
                                measure.vars=c("Neut", "Place", "Happy", "Fear"),
                                variable.name="condition", value.name="OverallTargetHR")

NbackBehav24hrACC= NbackBehav24hr
names(NbackBehav24hrACC)[names(NbackBehav24hrACC)=="PlaceBlocks_ACC"] <-"Place"
names(NbackBehav24hrACC)[names(NbackBehav24hrACC)=="NeutBlocks_ACC"] <-"Neut"
names(NbackBehav24hrACC)[names(NbackBehav24hrACC)=="HappyBlocks_ACC"] <-"Happy"
names(NbackBehav24hrACC)[names(NbackBehav24hrACC)=="FearBlocks_ACC"] <-"Fear"

NbackBehavreshape24hr2 <- melt (NbackBehav24hrACC, id.var=c("Subject.f"),
                               measure.vars=c("Neut", "Place", "Happy", "Fear"),
                               variable.name="condition", value.name="OverallWMACC")

Nback24hrmelteddp <- merge(NbackBehavreshape24hrdp, NbackBehavreshape24hr2, by=c("Subject.f","condition"))
Nback24hrmeltedHR <- merge(NbackBehavreshape24hrHR, NbackBehavreshape24hr2, by=c("Subject.f","condition"))

#Full stats prep including 0back and 2back
NbackBehav2HR= NbackBehav2

NbackBehavreshapeHR <- melt (NbackBehav2HR, id.var=c("Subject.f","ExactAgecent", "ExactAgesqcent", "ExactAgecubecent", "Gender.x", "RECCondition.x"),
                             measure.vars=c("Place0back_HR", "Place2back_HR", "Neut0back_HR", "Neut2back_HR", "Happy0back_HR", "Happy2back_HR", "Fear0back_HR", "Fear2back_HR"),
                             variable.name="condition", value.name="OverallHR")

NbackBehavreshapeHR$emocondition <-NA
NbackBehavreshapeHR$backcondition <-NA
NbackBehavreshapeHR$emocondition[grepl("Place", NbackBehavreshapeHR$condition)] <- "Place"
NbackBehavreshapeHR$emocondition[grepl("Neut", NbackBehavreshapeHR$condition)] <- "Neut"
NbackBehavreshapeHR$emocondition[grepl("Happy", NbackBehavreshapeHR$condition)] <- "Happy"
NbackBehavreshapeHR$emocondition[grepl("Fear", NbackBehavreshapeHR$condition)] <- "Fear"
NbackBehavreshapeHR$backcondition[grepl("0back", NbackBehavreshapeHR$condition)] <- "0back"
NbackBehavreshapeHR$backcondition[grepl("2back", NbackBehavreshapeHR$condition)] <- "2back"
NbackBehavreshapeHR$emocondition <- factor(NbackBehavreshapeHR$emocondition, levels=c("Place", "Neut", "Happy", "Fear"))
NbackBehavreshapeHR$backcondition <- factor(NbackBehavreshapeHR$backcondition, levels=c("0back", "2back"))

NbackBehav2ACC= NbackBehav2

NbackBehavreshapeACC <- melt (NbackBehav2ACC, id.var=c("Subject.f","ExactAgecent", "ExactAgesqcent", "ExactAgecubecent", "Gender.x", "RECCondition.x"),
                             measure.vars=c("Place0back_ACC", "Place2back_ACC", "Neut0back_ACC", "Neut2back_ACC", "Happy0back_ACC", "Happy2back_ACC", "Fear0back_ACC", "Fear2back_ACC"),
                             variable.name="condition", value.name="OverallACC")

NbackBehavreshapeACC$emocondition <-NA
NbackBehavreshapeACC$backcondition <-NA
NbackBehavreshapeACC$emocondition[grepl("Place", NbackBehavreshapeACC$condition)] <- "Place"
NbackBehavreshapeACC$emocondition[grepl("Neut", NbackBehavreshapeACC$condition)] <- "Neut"
NbackBehavreshapeACC$emocondition[grepl("Happy", NbackBehavreshapeACC$condition)] <- "Happy"
NbackBehavreshapeACC$emocondition[grepl("Fear", NbackBehavreshapeACC$condition)] <- "Fear"
NbackBehavreshapeACC$backcondition[grepl("0back", NbackBehavreshapeACC$condition)] <- "0back"
NbackBehavreshapeACC$backcondition[grepl("2back", NbackBehavreshapeACC$condition)] <- "2back"
NbackBehavreshapeACC$emocondition <- factor(NbackBehavreshapeACC$emocondition, levels=c("Neut","Place", "Happy", "Fear"))
NbackBehavreshapeACC$backcondition <- factor(NbackBehavreshapeACC$backcondition, levels=c("0back", "2back"))

NbackBehav0back <- subset(NbackBehavreshapeACC, backcondition=="0back")
NbackBehav2back <- subset(NbackBehavreshapeACC, backcondition=="2back")



NbackBehavmeltedcond <- merge(NbackBehavreshapeHR, NbackBehavreshapeACC, by=c("Subject.f","emocondition","backcondition"))


#Example models
#summary(lmer(OverallPr ~ condition * ExactAgeZ + OverallWMACC + Gender.x + (1|Subject.f), Nback0hrmelted))
#summary(lmer(OverallPr ~ condition * ExactAgeZ + OverallWMACC + Gender.x + (1|Subject.f), Nback24hrmelted))

#WM Models
#0-back Models
ZeroBackACCNull<- lmer(OverallACC ~ 1 + (1|Subject.f), NbackBehav0back)
qqnorm(resid(ZeroBackACCNull))
ZeroBackAgeLin <- lmer(OverallACC ~ emocondition + ExactAgecent + (1|Subject.f), NbackBehav0back)
anova(ZeroBackACCNull,ZeroBackAgeLin)
#2-back Models
TwoBackACCNull<- lmer(OverallACC ~ 1 + (1|Subject.f), NbackBehav2back)
qqnorm(resid(TwoBackACCNull))
TwobackAgeLin <- lmer(OverallACC ~ emocondition * ExactAgecent + (1|Subject.f), NbackBehav2back)
TwobackAgeLinGen <- lmer(OverallACC ~ emocondition * ExactAgecent + Gender.x + (1|Subject.f), NbackBehav2back)
TwobackAgeSq <- lmer(OverallACC ~ emocondition * ExactAgecent + emocondition * ExactAgesqcent + (1|Subject.f), NbackBehav2back)
anova(TwobackACCNull,TwobackAgeLin)
anova(TwobackAgeLin,ZerobackAgeSq)
#0hr Dprime Models
Dp0hrNull<- lmer(Overalldp ~ 1 + (1|Subject.f), Nback0hrmelteddp)
qqnorm(resid(Dp0hrNull))
Dp0hrAgeLin<- lmer(Overalldp ~ condition * ExactAgecent + (1|Subject.f), Nback0hrmelteddp)
anova(Dp0hrNull,Dp0hrAgeLin)
Dp0hrAgeSq<- lmer(Overalldp ~ condition * ExactAgecent + condition * ExactAgesqcent + (1|Subject.f), Nback0hrmelteddp)
anova(Dp0hrAgeLin, Dp0hrAgeSq)
#24hr Dprime Models
Dp24hrNull<- lmer(Overalldp ~ 1 + (1|Subject.f), Nback24hrmelteddp)
qqnorm(resid(Dp24hrNull))
Dp24hrAgeLin<- lmer(Overalldp ~ condition * ExactAgecent + (1|Subject.f), Nback24hrmelteddp)
anova(Dp24hrNull,Dp24hrAgeLin)
Dp24hrAgeSq<- lmer(Overalldp ~ condition * ExactAgecent + condition * ExactAgesqcent + (1|Subject.f), Nback24hrmelteddp)
anova(Dp24hrAgeLin, Dp24hrAgeSq)
#0hr Target HR Models
HR0hrNull<- lmer(OverallTargetHR ~ 1 + (1|Subject.f), Nback0hrmeltedHR)
qqnorm(resid(HR0hrNull))
HR0hrAgeLin<- lmer(OverallTargetHR ~ condition * ExactAgecent + (1|Subject.f), Nback0hrmeltedHR)
anova(HR0hrNull,HR0hrAgeLin)
#24hr Target HR Models
HR24hrNull<- lmer(OverallTargetHR ~ 1 + (1|Subject.f), Nback24hrmeltedHR)
qqnorm(resid(HR24hrNull))
HR24hrAgeLin<- lmer(OverallTargetHR ~ condition * ExactAgecent + (1|Subject.f), Nback24hrmeltedHR)
anova(HR24hrNull,HR24hrAgeLin)

