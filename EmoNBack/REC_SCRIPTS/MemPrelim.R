#Load Data
setwd("/Volumes/Main/Casey-Lab/EmotionalNback/SCRIPTS/")
WMBehav = read.csv("EmoNback_WMBehavior.csv")
RECBehav = read.csv("EmoNback_RECBehavior.csv")

WMBehav0hr <- subset(WMBehav, RECCondition=="Immediate")
WMBehav24hr <- subset(WMBehav, RECCondition=="24hr")
RECBehav0hr <- subset(RECBehav, RECCondition=="Immediate")
RECBehav24hr <- subset(RECBehav, RECCondition=="24hr")

library(ggplot2)
library(reshape2)
library(plyr)

###################################################
#################### WM PLOTS #####################
###################################################

#PLOT OVERALL WM PERFORMANCE
#formats data for plotting within subjects vars
#w after data set to signify "within"
WMBehav24hrw = WMBehav24hr
WMBehav24hrw$Subject = factor(WMBehav24hrw$Subject)

WMBehav24hrw.long = melt(WMBehav24hrw,
                     #id.vars=c("Subject"),
                     id.vars=c("Subject","ExactAge","Gender"),
                     measure.vars= c("PlaceBlocks_ACC","NeutBlocks_ACC","HappyBlocks_ACC","FearBlocks_ACC"),
                     variable.name= "Condition")
names(WMBehav24hrw.long)[names(WMBehav24hrw.long)=="value"] <- "ACC"
WMBehav24hrw.long$Condition <- revalue(WMBehav24hrw.long$Condition, c("PlaceBlocks_ACC"="Place","NeutBlocks_ACC"="Neutral Face","HappyBlocks_ACC"="Happy Face", "FearBlocks_ACC"="Fear Face"))
WMBehav24hrw.long$Condition <- factor(WMBehav24hrw.long$Condition)

ggplot(data=WMBehav24hrw.long, aes(y=ACC, x=ExactAge)) +
  #aes(shape=Gender) +
  geom_point(color="black", size=3) +
  geom_point(aes(color=Gender), size=2.5) +
  #scale_shape_discrete(breaks=c("F","M"), labels=c("Female", "Male")) +
  scale_color_manual(values=c("grey", "black"), breaks=c("F","M"), labels=c("Female", "Male")) +
  #geom_abline(intercept=coeffs[1],slope=coeffs[2]) +
  #stat_smooth(aes(group=1), method="lm",fill=NA, formula=y~poly(x,2,raw=TRUE), fullrange=TRUE, color="black") +
  #stat_smooth(aes(group=1), method="loess",fill=NA, formula=y~x, fullrange=TRUE, color="black", linetype=5) +
  stat_smooth(aes(linetype=Gender), method="loess",fill=NA, formula=y~x, color="black") +
  xlab("Age") +
  ylab("WM Accuracy") +
  scale_y_continuous(limits=c(0.4,1.01)) +
  #scale_x_continuous(limits=c(9,30), breaks=c(14,16,18,20,22,24)) +
  theme(title= element_text(size=22, vjust=2, face="bold"),
        axis.title.x= element_text(size=22, vjust=-0.5),
        axis.title.y= element_text(size=22, vjust=1.5),
        axis.text.x= element_text(size=18, colour="black", vjust=-0.5),
        axis.text.y= element_text(size=18, colour="black"),
        legend.title= element_blank(),
        legend.text= element_text(size=16),
        #legend.justification=c(0,1),
        #legend.position=c(0,1),
        panel.grid.major= element_blank(),
        panel.grid.minor= element_blank(),
        panel.background= element_blank(),
        axis.line= element_line(colour="black"),
        strip.text = element_text(size=18, face="bold")) +
  facet_wrap( ~ Condition, ncol=2)

#PLOT 0BACK WM PERFORMANCE
#formats data for plotting within subjects vars
#w after data set to signify "within"
WMBehav24hr0backw = WMBehav24hr
WMBehav24hr0backw$Subject = factor(WMBehav24hr0backw$Subject)

WMBehav24hr0backw.long = melt(WMBehav24hr0backw,
                     #id.vars=c("Subject"),
                     id.vars=c("Subject","ExactAge","Gender"),
                     measure.vars= c("Place0back_ACC","Neut0back_ACC","Happy0back_ACC","Fear0back_ACC"),
                     variable.name= "Condition")
names(WMBehav24hr0backw.long)[names(WMBehav24hr0backw.long)=="value"] <- "ACC"
WMBehav24hr0backw.long$Condition <- revalue(WMBehav24hr0backw.long$Condition, c("Place0back_ACC"="Place","Neut0back_ACC"="Neutral Face","Happy0back_ACC"="Happy Face", "Fear0back_ACC"="Fear Face"))
WMBehav24hr0backw.long$Condition <- factor(WMBehav24hr0backw.long$Condition)

ggplot(data=WMBehav24hr0backw.long, aes(y=ACC, x=ExactAge)) +
  #aes(shape=Gender) +
  geom_point(color="black", size=3) +
  geom_point(aes(color=Gender), size=2.5) +
  #scale_shape_discrete(breaks=c("F","M"), labels=c("Female", "Male")) +
  scale_color_manual(values=c("grey", "black"), breaks=c("F","M"), labels=c("Female", "Male")) +
  #geom_abline(intercept=coeffs[1],slope=coeffs[2]) +
  #stat_smooth(aes(group=1), method="lm",fill=NA, formula=y~poly(x,2,raw=TRUE), fullrange=TRUE, color="black") +
  #stat_smooth(aes(group=1), method="loess",fill=NA, formula=y~x, fullrange=TRUE, color="black", linetype=5) +
  stat_smooth(aes(linetype=Gender), method="loess",fill=NA, formula=y~x, color="black") +
  xlab("Age") +
  ylab("0-back WM Accuracy") +
  scale_y_continuous(limits=c(0.4,1.01)) +
  #scale_x_continuous(limits=c(9,30), breaks=c(14,16,18,20,22,24)) +
  theme(title= element_text(size=22, vjust=2, face="bold"),
        axis.title.x= element_text(size=22, vjust=-0.5),
        axis.title.y= element_text(size=22, vjust=1.5),
        axis.text.x= element_text(size=18, colour="black", vjust=-0.5),
        axis.text.y= element_text(size=18, colour="black"),
        legend.title= element_blank(),
        legend.text= element_text(size=16),
        #legend.justification=c(0,1),
        #legend.position=c(0,1),
        panel.grid.major= element_blank(),
        panel.grid.minor= element_blank(),
        panel.background= element_blank(),
        axis.line= element_line(colour="black"),
        strip.text = element_text(size=18, face="bold")) +
  facet_wrap( ~ Condition, ncol=2)

#PLOT 2BACK WM PERFORMANCE
#formats data for plotting within subjects vars
#w after data set to signify "within"
WMBehav24hr2backw = WMBehav24hr
WMBehav24hr2backw$Subject = factor(WMBehav24hr2backw$Subject)

WMBehav24hr2backw.long = melt(WMBehav24hr2backw,
                          #id.vars=c("Subject"),
                          id.vars=c("Subject","ExactAge","Gender"),
                          measure.vars= c("Place2back_ACC","Neut2back_ACC","Happy2back_ACC","Fear2back_ACC"),
                          variable.name= "Condition")
names(WMBehav24hr2backw.long)[names(WMBehav24hr2backw.long)=="value"] <- "ACC"
WMBehav24hr2backw.long$Condition <- revalue(WMBehav24hr2backw.long$Condition, c("Place2back_ACC"="Place","Neut2back_ACC"="Neutral Face","Happy2back_ACC"="Happy Face", "Fear2back_ACC"="Fear Face"))
WMBehav24hr0backw.long$Condition <- factor(WMBehav24hr0backw.long$Condition)

ggplot(data=WMBehav24hr2backw.long, aes(y=ACC, x=ExactAge)) +
  #aes(shape=Gender) +
  geom_point(color="black", size=3) +
  geom_point(aes(color=Gender), size=2.5) +
  #scale_shape_discrete(breaks=c("F","M"), labels=c("Female", "Male")) +
  scale_color_manual(values=c("grey", "black"), breaks=c("F","M"), labels=c("Female", "Male")) +
  #geom_abline(intercept=coeffs[1],slope=coeffs[2]) +
  #stat_smooth(aes(group=1), method="lm",fill=NA, formula=y~poly(x,2,raw=TRUE), fullrange=TRUE, color="black") +
  #stat_smooth(aes(group=1), method="loess",fill=NA, formula=y~x, fullrange=TRUE, color="black", linetype=5) +
  stat_smooth(aes(linetype=Gender), method="loess",fill=NA, formula=y~x, color="black") +
  xlab("Age") +
  ylab("2-back WM Accuracy") +
  scale_y_continuous(limits=c(0.4,1.01)) +
  #scale_x_continuous(limits=c(9,30), breaks=c(10,12,14,16,18,20,22,24,26,28,30)) +
  theme(title= element_text(size=22, vjust=2, face="bold"),
        axis.title.x= element_text(size=22, vjust=-0.5),
        axis.title.y= element_text(size=22, vjust=1.5),
        axis.text.x= element_text(size=18, colour="black", vjust=-0.5),
        axis.text.y= element_text(size=18, colour="black"),
        legend.title= element_blank(),
        legend.text= element_text(size=16),
        #legend.justification=c(0,1),
        #legend.position=c(0,1),
        panel.grid.major= element_blank(),
        panel.grid.minor= element_blank(),
        panel.background= element_blank(),
        axis.line= element_line(colour="black"),
        strip.text = element_text(size=18, face="bold")) +
  facet_wrap( ~ Condition, ncol=2)

###################################################
#################### REC PLOTS ####################
###################################################

#PLOT OVERALL REC PERFORMANCE
#formats data for plotting within subjects vars
#w after data set to signify "within"
RECBehav24hrHRw = RECBehav24hr
RECBehav24hrHRw$Subject = factor(RECBehav24hrHRw$Subject)

RECBehav24hrHRw.long = melt(RECBehav24hrHRw,
                     #id.vars=c("Subject"),
                     id.vars=c("Subject","ExactAge","Gender"),
                     measure.vars= c("Place_HR","Neut_HR","Happy_HR","Fear_HR"),
                     variable.name= "Condition")
names(RECBehav24hrHRw.long)[names(RECBehav24hrHRw.long)=="value"] <- "HR"
RECBehav24hrHRw.long$Condition <- revalue(RECBehav24hrHRw.long$Condition, c("Place_HR"="Place","Neut_HR"="Neutral Face","Happy_HR"="Happy Face", "Fear_HR"="Fear Face"))
RECBehav24hrHRw.long$Condition <- factor(RECBehav24hrHRw.long$Condition)

ggplot(data=RECBehav24hrHRw.long, aes(y=HR, x=ExactAge)) +
  #aes(shape=Gender) +
  geom_point(color="black", size=3) +
  geom_point(aes(color=Gender), size=2.5) +
  #scale_shape_discrete(breaks=c("F","M"), labels=c("Female", "Male")) +
  scale_color_manual(values=c("grey", "black"), breaks=c("F","M"), labels=c("Female", "Male")) +
  #geom_abline(intercept=coeffs[1],slope=coeffs[2]) +
  #stat_smooth(aes(group=1), method="lm",fill=NA, formula=y~poly(x,2,raw=TRUE), fullrange=TRUE, color="black") +
  #stat_smooth(aes(group=1), method="loess",fill=NA, formula=y~x, fullrange=TRUE, color="black", linetype=5) +
  stat_smooth(aes(linetype=Gender), method="loess",fill=NA, formula=y~x, color="black") +
  xlab("Age") +
  ylab("REC Overall Hit Rate") +
  scale_y_continuous(limits=c(0,1.01)) +
  #scale_x_continuous(limits=c(9,30), breaks=c(14,16,18,20,22,24)) +
  theme(title= element_text(size=22, vjust=2, face="bold"),
        axis.title.x= element_text(size=22, vjust=-0.5),
        axis.title.y= element_text(size=22, vjust=1.5),
        axis.text.x= element_text(size=18, colour="black", vjust=-0.5),
        axis.text.y= element_text(size=18, colour="black"),
        legend.title= element_blank(),
        legend.text= element_text(size=16),
        #legend.justification=c(0,1),
        #legend.position=c(0,1),
        panel.grid.major= element_blank(),
        panel.grid.minor= element_blank(),
        panel.background= element_blank(),
        axis.line= element_line(colour="black"),
        strip.text = element_text(size=18, face="bold")) +
  facet_wrap( ~ Condition, ncol=2)

#PLOT OVERALL FA PERFORMANCE
#formats data for plotting within subjects vars
#w after data set to signify "within"
RECBehav24hrFAw = RECBehav24hr
RECBehav24hrFAw$Subject = factor(RECBehav24hrFAw$Subject)

RECBehav24hrFAw.long = melt(RECBehav24hrFAw,
                        #id.vars=c("Subject"),
                        id.vars=c("Subject","ExactAge","Gender"),
                        measure.vars= c("Place_FA","Neut_FA","Happy_FA","Fear_FA"),
                        variable.name= "Condition")
names(RECBehav24hrFAw.long)[names(RECBehav24hrFAw.long)=="value"] <- "FA"
RECBehav24hrFAw.long$Condition <- revalue(RECBehav24hrFAw.long$Condition, c("Place_FA"="Place","Neut_FA"="Neutral Face","Happy_FA"="Happy Face", "Fear_FA"="Fear Face"))
RECBehav24hrFAw.long$Condition <- factor(RECBehav24hrFAw.long$Condition)

ggplot(data=RECBehav24hrFAw.long, aes(y=FA, x=ExactAge)) +
  #aes(shape=Gender) +
  geom_point(color="black", size=3) +
  geom_point(aes(color=Gender), size=2.5) +
  #scale_shape_discrete(breaks=c("F","M"), labels=c("Female", "Male")) +
  scale_color_manual(values=c("grey", "black"), breaks=c("F","M"), labels=c("Female", "Male")) +
  #geom_abline(intercept=coeffs[1],slope=coeffs[2]) +
  #stat_smooth(aes(group=1), method="lm",fill=NA, formula=y~poly(x,2,raw=TRUE), fullrange=TRUE, color="black") +
  #stat_smooth(aes(group=1), method="loess",fill=NA, formula=y~x, fullrange=TRUE, color="black", linetype=5) +
  stat_smooth(aes(linetype=Gender), method="loess",fill=NA, formula=y~x, color="black") +
  xlab("Age") +
  ylab("REC Overall False Alarm") +
  scale_y_continuous(limits=c(0,0.67)) +
  #scale_x_continuous(limits=c(9,30), breaks=c(14,16,18,20,22,24)) +
  theme(title= element_text(size=22, vjust=2, face="bold"),
        axis.title.x= element_text(size=22, vjust=-0.5),
        axis.title.y= element_text(size=22, vjust=1.5),
        axis.text.x= element_text(size=18, colour="black", vjust=-0.5),
        axis.text.y= element_text(size=18, colour="black"),
        legend.title= element_blank(),
        legend.text= element_text(size=16),
        #legend.justification=c(0,1),
        #legend.position=c(0,1),
        panel.grid.major= element_blank(),
        panel.grid.minor= element_blank(),
        panel.background= element_blank(),
        axis.line= element_line(colour="black"),
        strip.text = element_text(size=18, face="bold")) +
  facet_wrap( ~ Condition, ncol=2)

#PLOT OVERALL Pr
#formats data for plotting within subjects vars
#w after data set to signify "within"
RECBehav24hrPrw = RECBehav24hr
RECBehav24hrPrw$Subject = factor(RECBehav24hrPrw$Subject)

RECBehav24hrPrw.long = melt(RECBehav24hrPrw,
                        #id.vars=c("Subject"),
                        id.vars=c("Subject","ExactAge","Gender"),
                        measure.vars= c("Place_Pr","Neut_Pr","Happy_Pr","Fear_Pr"),
                        variable.name= "Condition")
names(RECBehav24hrPrw.long)[names(RECBehav24hrPrw.long)=="value"] <- "Pr"
RECBehav24hrPrw.long$Condition <- revalue(RECBehav24hrPrw.long$Condition, c("Place_Pr"="Place","Neut_Pr"="Neutral Face","Happy_Pr"="Happy Face", "Fear_Pr"="Fear Face"))
RECBehav24hrPrw.long$Condition <- factor(RECBehav24hrPrw.long$Condition)

ggplot(data=RECBehav24hrPrw.long, aes(y=Pr, x=ExactAge)) +
  #aes(shape=Gender) +
  geom_point(color="black", size=3) +
  geom_point(aes(color=Gender), size=2.5) +
  #scale_shape_discrete(breaks=c("F","M"), labels=c("Female", "Male")) +
  scale_color_manual(values=c("grey", "black"), breaks=c("F","M"), labels=c("Female", "Male")) +
  #geom_abline(intercept=coeffs[1],slope=coeffs[2]) +
  #stat_smooth(aes(group=1), method="lm",fill=NA, formula=y~poly(x,2,raw=TRUE), fullrange=TRUE, color="black") +
  #stat_smooth(aes(group=1), method="loess",fill=NA, formula=y~x, fullrange=TRUE, color="black", linetype=5) +
  stat_smooth(aes(linetype=Gender), method="loess",fill=NA, formula=y~x, color="black") +
  xlab("Age") +
  ylab("REC Overall Corrected Recognition") +
  scale_y_continuous(limits=c(-0.1,0.8)) +
  #scale_x_continuous(limits=c(9,30), breaks=c(14,16,18,20,22,24)) +
  theme(title= element_text(size=22, vjust=2, face="bold"),
        axis.title.x= element_text(size=22, vjust=-0.5),
        axis.title.y= element_text(size=22, vjust=1.5),
        axis.text.x= element_text(size=18, colour="black", vjust=-0.5),
        axis.text.y= element_text(size=18, colour="black"),
        legend.title= element_blank(),
        legend.text= element_text(size=16),
        #legend.justification=c(0,1),
        #legend.position=c(0,1),
        panel.grid.major= element_blank(),
        panel.grid.minor= element_blank(),
        panel.background= element_blank(),
        axis.line= element_line(colour="black"),
        strip.text = element_text(size=18, face="bold")) +
  facet_wrap( ~ Condition, ncol=2)

#PLOT OVERALL Br
#formats data for plotting within subjects vars
#w after data set to signify "within"
RECBehav24hrBrw = RECBehav24hr
RECBehav24hrBrw$Subject = factor(RECBehav24hrBrw$Subject)

RECBehav24hrBrw.long = melt(RECBehav24hrBrw,
                        #id.vars=c("Subject"),
                        id.vars=c("Subject","ExactAge","Gender"),
                        measure.vars= c("Place_Br","Neut_Br","Happy_Br","Fear_Br"),
                        variable.name= "Condition")
names(RECBehav24hrBrw.long)[names(RECBehav24hrBrw.long)=="value"] <- "Br"
RECBehav24hrBrw.long$Condition <- revalue(RECBehav24hrBrw.long$Condition, c("Place_Br"="Place","Neut_Br"="Neutral Face","Happy_Br"="Happy Face", "Fear_Br"="Fear Face"))
RECBehav24hrBrw.long$Condition <- factor(RECBehav24hrBrw.long$Condition)

ggplot(data=RECBehav24hrBrw.long, aes(y=Br, x=ExactAge)) +
  #aes(shape=Gender) +
  geom_point(color="black", size=3) +
  geom_point(aes(color=Gender), size=2.5) +
  #scale_shape_discrete(breaks=c("F","M"), labels=c("Female", "Male")) +
  scale_color_manual(values=c("grey", "black"), breaks=c("F","M"), labels=c("Female", "Male")) +
  #geom_abline(intercept=coeffs[1],slope=coeffs[2]) +
  #stat_smooth(aes(group=1), method="lm",fill=NA, formula=y~poly(x,2,raw=TRUE), fullrange=TRUE, color="black") +
  #stat_smooth(aes(group=1), method="loess",fill=NA, formula=y~x, fullrange=TRUE, color="black", linetype=5) +
  #stat_smooth(aes(linetype=Gender), method="loess",fill=NA, formula=y~x, color="black") +
  stat_smooth(aes(linetype=Gender), method="loess",fill=NA, formula=y~x, color="black") +
  xlab("Age") +
  ylab("REC Overall Response Bias") +
  scale_y_continuous(limits=c(-0.6,0.37)) +
  #scale_x_continuous(limits=c(9,30), breaks=c(14,16,18,20,22,24)) +
  theme(title= element_text(size=22, vjust=2, face="bold"),
        axis.title.x= element_text(size=22, vjust=-0.5),
        axis.title.y= element_text(size=22, vjust=1.5),
        axis.text.x= element_text(size=18, colour="black", vjust=-0.5),
        axis.text.y= element_text(size=18, colour="black"),
        legend.title= element_blank(),
        legend.text= element_text(size=16),
        #legend.justification=c(0,1),
        #legend.position=c(0,1),
        panel.grid.major= element_blank(),
        panel.grid.minor= element_blank(),
        panel.background= element_blank(),
        axis.line= element_line(colour="black"),
        strip.text = element_text(size=18, face="bold")) +
  facet_wrap( ~ Condition, ncol=2)

#PLOT 0-back REC PERFORMANCE
#formats data for plotting within subjects vars
#w after data set to signify "within"
RECBehav24hr0backw = RECBehav24hr
RECBehav24hr0backw$Subject = factor(RECBehav24hr0backw$Subject)

RECBehav24hr0backw.long = melt(RECBehav24hr0backw,
                        #id.vars=c("Subject"),
                        id.vars=c("Subject","ExactAge","Gender"),
                        measure.vars= c("Place0back_HR","Neut0back_HR","Happy0back_HR","Fear0back_HR"),
                        variable.name= "Condition")
names(RECBehav24hr0backw.long)[names(RECBehav24hr0backw.long)=="value"] <- "HR"
RECBehav24hr0backw.long$Condition <- revalue(RECBehav24hr0backw.long$Condition, c("Place0back_HR"="Place","Neut0back_HR"="Neutral Face","Happy0back_HR"="Happy Face", "Fear0back_HR"="Fear Face"))
RECBehav24hr0backw.long$Condition <- factor(RECBehav24hr0backw.long$Condition)

ggplot(data=RECBehav24hr0backw.long, aes(y=HR, x=ExactAge)) +
  #aes(shape=Gender) +
  geom_point(color="black", size=3) +
  geom_point(aes(color=Gender), size=2.5) +
  #scale_shape_discrete(breaks=c("F","M"), labels=c("Female", "Male")) +
  scale_color_manual(values=c("grey", "black"), breaks=c("F","M"), labels=c("Female", "Male")) +
  #geom_abline(intercept=coeffs[1],slope=coeffs[2]) +
  #stat_smooth(aes(group=1), method="lm",fill=NA, formula=y~poly(x,2,raw=TRUE), fullrange=TRUE, color="black") +
  #stat_smooth(aes(group=1), method="loess",fill=NA, formula=y~x, fullrange=TRUE, color="black", linetype=5) +
  stat_smooth(aes(linetype=Gender), method="loess",fill=NA, formula=y~x, color="black") +
  xlab("Age") +
  ylab("REC 0-back Hit Rate") +
  scale_y_continuous(limits=c(0,1)) +
  #scale_x_continuous(limits=c(9,30), breaks=c(14,16,18,20,22,24)) +
  theme(title= element_text(size=22, vjust=2, face="bold"),
        axis.title.x= element_text(size=22, vjust=-0.5),
        axis.title.y= element_text(size=22, vjust=1.5),
        axis.text.x= element_text(size=18, colour="black", vjust=-0.5),
        axis.text.y= element_text(size=18, colour="black"),
        legend.title= element_blank(),
        legend.text= element_text(size=16),
        #legend.justification=c(0,1),
        #legend.position=c(0,1),
        panel.grid.major= element_blank(),
        panel.grid.minor= element_blank(),
        panel.background= element_blank(),
        axis.line= element_line(colour="black"),
        strip.text = element_text(size=18, face="bold")) +
  facet_wrap( ~ Condition, ncol=2)

#PLOT 2-back REC PERFORMANCE
#formats data for plotting within subjects vars
#w after data set to signify "within"
RECBehav24hr2backw = RECBehav24hr
RECBehav24hr2backw$Subject = factor(RECBehav24hr2backw$Subject)

RECBehav24hr2backw.long = melt(RECBehav24hr2backw,
                           #id.vars=c("Subject"),
                           id.vars=c("Subject","ExactAge","Gender"),
                           measure.vars= c("Place2back_HR","Neut2back_HR","Happy2back_HR","Fear2back_HR"),
                           variable.name= "Condition")
names(RECBehav24hr2backw.long)[names(RECBehav24hr2backw.long)=="value"] <- "HR"
RECBehav24hr2backw.long$Condition <- revalue(RECBehav24hr2backw.long$Condition, c("Place2back_HR"="Place","Neut2back_HR"="Neutral Face","Happy2back_HR"="Happy Face", "Fear2back_HR"="Fear Face"))
RECBehav24hr2backw.long$Condition <- factor(RECBehav24hr2backw.long$Condition)

ggplot(data=RECBehav24hr2backw.long, aes(y=HR, x=ExactAge)) +
  #aes(shape=Gender) +
  geom_point(color="black", size=3) +
  geom_point(aes(color=Gender), size=2.5) +
  #scale_shape_discrete(breaks=c("F","M"), labels=c("Female", "Male")) +
  scale_color_manual(values=c("grey", "black"), breaks=c("F","M"), labels=c("Female", "Male")) +
  #geom_abline(intercept=coeffs[1],slope=coeffs[2]) +
  #stat_smooth(aes(group=1), method="lm",fill=NA, formula=y~poly(x,2,raw=TRUE), fullrange=TRUE, color="black") +
  #stat_smooth(aes(group=1), method="loess",fill=NA, formula=y~x, fullrange=TRUE, color="black", linetype=5) +
  stat_smooth(aes(linetype=Gender), method="loess",fill=NA, formula=y~x, color="black") +
  xlab("Age") +
  ylab("REC 2-back Hit Rate") +
  scale_y_continuous(limits=c(0,1)) +
  #scale_x_continuous(limits=c(9,30), breaks=c(14,16,18,20,22,24)) +
  theme(title= element_text(size=22, vjust=2, face="bold"),
        axis.title.x= element_text(size=22, vjust=-0.5),
        axis.title.y= element_text(size=22, vjust=1.5),
        axis.text.x= element_text(size=18, colour="black", vjust=-0.5),
        axis.text.y= element_text(size=18, colour="black"),
        legend.title= element_blank(),
        legend.text= element_text(size=16),
        #legend.justification=c(0,1),
        #legend.position=c(0,1),
        panel.grid.major= element_blank(),
        panel.grid.minor= element_blank(),
        panel.background= element_blank(),
        axis.line= element_line(colour="black"),
        strip.text = element_text(size=18, face="bold")) +
  facet_wrap( ~ Condition, ncol=2)
