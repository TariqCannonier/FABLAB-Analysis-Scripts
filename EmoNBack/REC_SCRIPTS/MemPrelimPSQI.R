#Load Data
setwd("/Volumes/Main/Casey-Lab/EmotionalNback/SCRIPTS/")
WMBehavPSQI = read.csv("EmoNback_WMBehavior_PSQI.csv")
RECBehavPSQI = read.csv("EmoNback_RECBehavior_PSQI.csv")

WMBehavPSQI$PSQIz <- scale(WMBehavPSQI$PSQI, center = TRUE, scale = TRUE)
RECBehavPSQI$PSQIz <- scale(RECBehavPSQI$PSQI, center = TRUE, scale = TRUE)

WMBehavPSQI$AvgACC <- with(WMBehavPSQI, (HappyBlocks_ACC+FearBlocks_ACC+NeutBlocks_ACC+PlaceBlocks_ACC)/4)
RECBehavPSQI$AvgPr <- with(RECBehavPSQI, (Happy_Pr+Fear_Pr+Neut_Pr+Place_Pr)/4)

RECBehav0hrPSQI <- subset(RECBehavPSQI, RECCondition=="Immediate")
RECBehav24hrPSQI <- subset(RECBehavPSQI, RECCondition=="24hr")

library(ggplot2)
library(reshape2)
library(plyr)

ggplot(data=WMBehavPSQI, aes(y=AvgACC, x=PSQIz)) +
  geom_point(color="black", size=3) +
  stat_smooth(aes(group=1), method="lm", formula=y~x, fullrange=TRUE, color="black") +
  xlab("Z-score PSQI") +
  ylab("Average Overall Accuracy") +
  theme(title= element_text(size=22, vjust=2, face="bold"),
        axis.title.x= element_text(size=22, vjust=-0.5),
        axis.title.y= element_text(size=22, vjust=1.5),
        axis.text.x= element_text(size=22, colour="black", vjust=-0.5),
        axis.text.y= element_text(size=22, colour="black"),
        panel.grid.major= element_blank(),
        panel.grid.minor= element_blank(),
        panel.background= element_blank(),
        axis.line= element_line(colour="black"))

#PLOT OVERALL BY PSQI
#formats data for plotting within subjects vars
#w after data set to signify "within"
RECBehav24hrPSQIPrw = RECBehav24hrPSQI
RECBehav24hrPSQIPrw$Subject = factor(RECBehav24hrPSQIPrw$Subject)

RECBehav24hrPSQIPrw.long = melt(RECBehav24hrPSQIPrw,
                            #id.vars=c("Subject"),
                            id.vars=c("Subject","ExactAge","PSQIz"),
                            measure.vars= c("Place_Pr","Neut_Pr","Happy_Pr","Fear_Pr"),
                            variable.name= "Condition")
names(RECBehav24hrPSQIPrw.long)[names(RECBehav24hrPSQIPrw.long)=="value"] <- "Pr"
RECBehav24hrPSQIPrw.long$Condition <- revalue(RECBehav24hrPSQIPrw.long$Condition, c("Place_Pr"="Place","Neut_Pr"="Neutral Face","Happy_Pr"="Happy Face", "Fear_Pr"="Fear Face"))
RECBehav24hrPSQIPrw.long$Condition <- factor(RECBehav24hrPSQIPrw.long$Condition)

ggplot(data=RECBehav24hrPSQIPrw.long , aes(y=Pr, x=PSQIz)) +
  geom_point(aes(color=ExactAge), size=3) +
  scale_colour_gradient(low = "red", high = "black") +
  stat_smooth(aes(group=1), method="lm", formula=y~x, fullrange=TRUE, color="black") +
  xlab("Z-score PSQI") +
  ylab("Average Overall Corrected Recognition") +
  theme(title= element_text(size=22, vjust=2, face="bold"),
        axis.title.x= element_text(size=22, vjust=-0.5),
        axis.title.y= element_text(size=22, vjust=1.5),
        axis.text.x= element_text(size=18, colour="black", vjust=-0.5),
        axis.text.y= element_text(size=18, colour="black"),
        legend.title= element_blank(),
        legend.text= element_text(size=16),
        #legend.justification=c(0,1),
        #legend.position=c(0,1),
        #panel.grid.major= element_blank(),
        #panel.grid.minor= element_blank(),
        #panel.background= element_blank(),
        axis.line= element_line(colour="black"),
        strip.text = element_text(size=18, face="bold")) +
  facet_wrap( ~ Condition, ncol=2)