#Load Data
setwd("/Volumes/Main/Casey-Lab/EmotionalNback/SCRIPTS/")
WMBehav = read.csv("EmoNback_WMBehavior.csv")
RECBehav = read.csv("EmoNback_RECBehavior.csv")

#setwd("/Users/alicohen/Desktop/")
#Demog = read.csv("emonbackdemog.csv")
#Demog0hr <- subset(Demog, RECCondition=="Immediate")
#Demog24hr <- subset(Demog, RECCondition=="24hr")


WMBehav0hr <- subset(WMBehav, RECCondition=="Immediate")
WMBehav24hr <- subset(WMBehav, RECCondition=="24hr")
RECBehav0hr <- subset(RECBehav, RECCondition=="Immediate")
RECBehav24hr <- subset(RECBehav, RECCondition=="24hr")

library(ggplot2)
library(reshape2)
library(plyr)

ggplot(RECBehav0hr, aes(x=ExactAge, fill=Gender, color=Gender)) +
  geom_histogram(position="identity", alpha=0.5, breaks=seq(9,30,by=1)) +
  scale_x_continuous(limits=c(9,30)) +
  scale_y_continuous(limits=c(0,5)) +
  labs(title="Immediate Recall Subjects", x="Age", y = "Count") +
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
        strip.text = element_text(size=18, face="bold"))

ggplot(RECBehav24hr, aes(x=ExactAge, fill=Gender, color=Gender)) +
  geom_histogram(position="identity", alpha=0.5, breaks=seq(9,30,by=1)) +
  scale_x_continuous(limits=c(9,30)) +
  scale_y_continuous(limits=c(0,5)) +
  labs(title="24hr Recall Subjects", x="Age", y = "Count") +
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
        strip.text = element_text(size=18, face="bold"))

WMBehavgoodperf$RECCondition <- factor(WMBehavgoodperf$RECCondition, levels= c("Immediate","24hr"))
#Demog$RECCondition <- factor(Demog$RECCondition, levels= c("Immediate","24hr"))

ggplot(WMBehavgoodperf, aes(x=ExactAge, fill=Gender, color=Gender)) +
  geom_histogram(position="stack", alpha=0.5, breaks=seq(9,30,by=1)) +
  scale_x_continuous(limits=c(9,30)) +
  scale_y_continuous(limits=c(0,4)) +
  labs(x="Age", y = "Count") +
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
        facet_wrap( ~ RECCondition, nrow=2)