library(ggplot2)
library(dplyr)
library(forcats)

data2<-mtcars #copying the dataset
vals<-c(data2$mpg) #creating a vector of all mpg value
mval<-mean(vals) #taking mean of all mpg values and storing it in a variable
sval<-sd(vals) #taking standard deviation of mpg values
data2<- mutate(data2, zscore=(mpg-mval)/sval) #calculating zscore of each car and appending the column to our dataset
noms<-rownames(data2) #storing names of the cars in noms
noms<-factor(noms) #making noms a factor
noms<-fct_reorder(noms,data2$zscore) #reordering noms acc. to zscore to sort
plot<-ggplot(data2, aes(x=zscore, y=noms, fill=(ifelse(zscore>0,"high", "low")), alpha=abs(zscore)))+geom_col(width=0.8)+labs(title="Plot 2:", x="MPG z-score", fill="MPG Group", y="Car name")+theme_bw()+theme(panel.border = element_blank())+scale_alpha(guide = 'none')+xlim(-1.7,2.3)
#making a plot and sorting coloring the bars depending on whether the zscore is negative or positive
#making the transparency depend on absolute values of zscores
#setting width and adding labels and changing theme
#removing the alpha legend
#setting the lmits of x-axis
plot #viewing the plot
ggsave("plot2.pdf", plot, height=8, width=7) #saving the plot as a .pdf file