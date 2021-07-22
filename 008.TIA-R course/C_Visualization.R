#Tutorial 11: bar chart
library(ggplot2)
library(dplyr)
library(tidyr)

summary(mpg)

qplot(x=cty, y=hwy, data=mpg,
      xlab="City Miles Per Gallon", ylab="Highway Miles Per Gallon", main="Highway vs. City MPG")
qplot(x=cty, data=mpg)
qplot(x=cty, data=mpg, bins=10)
qplot(x=hwy, data=mpg, binwidth=10)

?qplot
?ggplot

ggplot(data=mpg, aes(x=displ, y=hwy)) + geom_point()
ggplot(data=mpg, aes(x=displ, y=hwy)) + geom_line()
ggplot(data=mpg, aes(x=displ, y=hwy)) + geom_line() + geom_point()
ggplot(data=mpg, aes(x=displ, y=hwy)) + geom_point() + geom_smooth() #curvature
ggplot(data=mpg, aes(x=displ, y=hwy)) + geom_point() + geom_smooth(method=lm) #linear

p <- ggplot(data=mpg, aes(x=displ, y=hwy))
p + geom_point() + geom_smooth(method=lm, se=FALSE)


ggplot(data=mpg, aes(x=displ, y=hwy, color=class)) + geom_point()
ggplot(data=mpg, aes(x=displ,y=hwy,
                     color=class, size=cyl)) + geom_point()

#overrides
ggplot(data=mpg, aes(x=displ,y=hwy,
                     color=class, size=cyl)) + 
  geom_point(aes(size=manufacturer))


ggplot(data=mpg, aes(x=displ,y=hwy,
                     color=class, size=cyl)) + 
  geom_point(size=5, shape=2)

?geom_point

p <- ggplot(data=mpg, aes(x=displ, y=hwy, color=class))

p+geom_point()+
  xlab("Engine Displacement (liters)")+
  ylab("Highway Miles Per Gallon")

p+geom_point(color="blue")+
  xlab("Engine Displacement (liters)")+
  ylab("Highway Miles Per Gallon") +
  ggtitle("Analysis of Fuel Displacement on Highway Miles")


p+geom_point(shape=1, size=3)+
  xlab("Engine Displacement (liters)")+
  ylab("Highway Miles Per Gallon") +
  ggtitle("Analysis of Fuel Displacement on Highway Miles")+
  geom_smooth(method=loess)

p+geom_point(shape=1, size=3)+
  xlab("Engine Displacement (liters)")+
  ylab("Highway Miles Per Gallon") +
  ggtitle("Analysis of Fuel Displacement on Highway Miles")+
  geom_smooth(method=lm)


q <- ggplot(data=mpg, aes(x=displ, y=hwy))
q+geom_point(shape=1, size=3)+
  xlab("Engine Displacement (liters)")+
  ylab("Highway Miles Per Gallon") +
  ggtitle("Analysis of Fuel Displacement on Highway Miles")+
  geom_smooth(method=lm)

#linear model to get intercept and slope
fit <- lm(mpg$hwy ~ mpg$displ)
fit
a <- signif(coef(fit)[1], digits=2)
a
b <- signif(coef(fit)[2], digits=2)
b
textlab <- paste("y = ", b, "x + ", a, sep="")
print(textlab)


q + geom_point() + 
  geom_smooth(method="lm", se=FALSE)+
  annotate("text", x=5, y=40, label = textlab, color="black", size=5, parse=FALSE)

#facet
p + geom_point(size=3)

p + geom_point(size=3)+
  facet_grid(.~class) #class on x variable

p + geom_point(size=3)+
  facet_grid(class~.) #class on y variable

p + geom_point(size=3)+
  facet_grid(class~cyl)

p + geom_point(size=3)+
  facet_grid(class~year) #y~x

#histogram in ggplot

s <- ggplot(data=mpg, aes(x=hwy))

s + geom_histogram()
s + geom_histogram(binwidth=10)
s + geom_histogram(bins=10)

#add color
s + geom_histogram(binwidth=5, aes(fill=manufacturer), color = "Black")
s + geom_histogram(binwidth=5, aes(fill=class))
s + geom_histogram(binwidth=2, aes(fill=class), color = "Black") + facet_grid(class~.)
s + geom_histogram(binwidth=2, aes(fill=class), color = "Black") + facet_grid(.~class)

#Density Charts
ggplot(mpg, aes(x=hwy)) + geom_density(fill="lightgreen")
ggplot(mpg, aes(x=hwy)) + geom_density(fill="lightgreen", color="lightgreen")


ggplot(mpg, aes(x=cty)) + geom_density(fill="orange",
                                       col="orange")


#Manipulating Dataset
messy <- data.frame(
  name = c("C123", "C253", "C789"),
  a = c(67,80,64),
  b = c(56,90,50)
)

messy
#gather is in tidyr
clean <- gather(messy, "drug", "heartrate", a:b)
clean

clean <- messy %>% gather(drug,heartrate,a:b)
clean

head(mpg)
summary(mpg)

plot_data <- mpg %>% gather(key = 'mpg_type',
                            value = 'mpg',
                            cty, hwy)
plot_data

ggplot(plot_data, aes(x=mpg)) + 
  geom_density(col="lightgreen", fill="lightgreen") +
  facet_wrap(~mpg_type, nrow=2)

#Bar chart
ggplot(mpg, aes(x=manufacturer)) + 
  geom_bar(stat="count")

ggplot(mpg, aes(x=manufacturer)) + 
  geom_bar(stat="count", fill="lightgreen")

ggplot(mpg, aes(x=manufacturer)) + 
  geom_bar(stat="count", fill="lightgreen") +
  coord_flip()

#Box plots
u <- ggplot(data=mpg, aes(x=class, y=hwy, color=class))
u

u + geom_boxplot()
u + geom_boxplot(size=1)
u + geom_boxplot(size=1) + geom_point()
u + geom_boxplot(size=1.2) + geom_jitter()

#Adjusting theme
s <- ggplot(data=mpg, aes(x=hwy))
?geom_density
s + geom_density(aes(fill=class))
s + geom_density(aes(col=class), position="stack")
s + geom_density(aes(fill=class), position="stack")

s + geom_density(aes(fill=class), position="stack")+
  xlab("Highway Miles Per Gallon") + 
  ylab("Density") +
  ggtitle("Highway MPG Distribution") +
  theme(axis.title.x = element_text(color="DarkRed", size=20),
        axis.title.y = element_text(color="DarkOrange", size=20),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
        legend.title = element_text(size=20),
        legend.text = element_text(size=10),
        legend.position = c(1,1),
        legend.justification = c(1,1),,
        plot.title = element_text(color = "DarkGreen",                                 ,
                                  size = 20,
                                  family = windowsFonts("TT Arial") ))
        
install.packages("extrafont")
library("extrafont")
font_import()



