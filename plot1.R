library(ggplot2)
library(viridis)
library(forcats)
library(dplyr)

data1<-mtcars #copying the dataset so as not to alter real data
noms<-rownames(data1) #storing the names of cars in noms
noms<-factor(noms) #making noms a factor
noms<-fct_reorder(noms,data1$mpg) #reordering noms acc. to mpg to sort
temp<-data1$cyl #storing no. of cyl data into temp
temp<-recode(temp, "4" = "green", "6" = "darkblue", "8" = "lightblue") #recoding temp data to make it discrete
plot<-ggplot(data1, aes(x=mpg, y=fct_reorder(noms, cyl), fill=temp))+geom_col(width=0.8)+labs(title="Plot 1:", x="Miles per gallon", fill="Number of cylinders", y="")+scale_fill_manual(values=c("dodgerblue4","lightblue", "lightgreen"), labels = c("6","4","8"))+theme_bw()+theme(panel.border = element_blank(), legend.position = "top")
#making a plot and sorting cars in y axis according to number of cylinders
#setting width of bars
#adding labels
#filling colors according to number of cyls and laebing them as well
#changing theme to make backgroung white without removing ghridlines but removing the borders
plot #viewing the plot
ggsave("plot1.pdf", plot, height=6.5, width=7) #saving the plot as .pdf file


