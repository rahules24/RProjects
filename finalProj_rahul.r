#importing necessary libraries

library(ggplot2)
library(dplyr)
if(!require(lubridate)){
    install.packages("lubridate")
    library(lubridate)
}
if(!require(patchwork)){
    install.packages("patchwork")
    library(patchwork)
}

#reading and treating data

tok <- readxl::read_xlsx('tokyo_data.xlsx')
colnames(tok) <- c("date", "high", "low", "preci", "hrs")	#changing names of the columns
tok$month <- month(tok$date)	#extracting month from date using lubridate and adding a month column
tokyo<-tok	#making a copy of tok
tok <- tok %>% group_by(month) %>% summarise(sum_temp = sum(high))	#grouping highest daily temprature by month and adding them all and store in one month
tok$sum_temp<-tok$sum_temp/(35*30)	#calculating average temprature of the month by dividing the total temprature by number or years (hence total number of each month) and having approx. 30 days each
tokyo <- tokyo %>% group_by(month) %>% summarise(sum_hrs = sum(hrs))	#same thing happening with daylight hours
tok$sum_hrs<-tokyo$sum_hrs/(35*30)
tok<-tok[-13,]	#deleting the unwanted 13th row
tok$month<-factor(c("January", "February"  ,"March" ,    "April"    , "May"     ,  "June",      "July"      ,"August",    "September" ,"October","November" , "December"), levels=c("March" ,    "April"    , "May"     ,  "June",      "July"      ,"August",    "September" ,"October","November" , "December","January", "February"))	#giving names to be shown as ticks on x-axis. not the levels are ordered differenlt to match the seasons with Spring beginning in March and Winters ending in February


#plotting

tempPlot<-ggplot(tok, aes(month,sum_temp))+geom_col(aes(alpha=0.3),fill='red', width=.6) + geom_smooth(se=FALSE, col='black', aes(group=1))+theme_bw()+theme(legend.position="none", panel.border = element_blank(), axis.line.y = element_line(colour = "black"), plot.title = element_text(size=18, face="bold.italic"), plot.subtitle = element_text(face="italic"))+labs(y='Avg. Highest Temp. (°C)')+ggtitle("Seasons in Japan", subtitle = "Temprature vs Daylight")+theme(axis.title.x = element_blank(), axis.line.x = element_blank(), axis.text.x = element_blank(), axis.ticks.x = element_blank())
#setting transparency, color and width
#removing shadow of geom_smooth and group =1 is used to override the default behavior, so the proportion is found with respect to the whole database and not just the row-specfic data
#setting title and subtitle
#removing all gridlines and boundary keeping just the y axis and its lable

hrsPlot<-ggplot(tok, aes(month,sum_hrs))+geom_col(aes(alpha=0.3),fill='yellow', width=.6) + geom_smooth(se=FALSE, col='black', span=.6, aes(group=1))+theme_bw()+theme(legend.position="none", panel.border = element_blank(), axis.line.x = element_line(colour = "black"), axis.line.y = element_line(colour = "black"))+labs(y="Avg. Dayight (hrs)", x="Months")


#viewing and saving final plot

seasonPLot<-tempPlot / hrsPlot + plot_layout(guides = 'collect')	#as they share common x-axis, and tempPlot doesn't have one, they're grouped and the shown as stacked
seasonPLot

ggsave("finalplot.pdf", seasonPLot, height=8.2, width=7.8)
