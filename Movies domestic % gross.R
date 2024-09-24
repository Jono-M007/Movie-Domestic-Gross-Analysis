# Import the data set
movies <- read.csv(file.choose(), stringsAsFactors = TRUE)

# data exploration
head(movies)
tail(movies)
summary(movies)
str(movies)


# load the tidyverse package
library(tidyverse)

#ggplot(data=movies, aes(x=Day.of.Week)) +  geom_bar()

#Filter the data frame for the desired movie genre
filt <- (movies$Genre == "action") | (movies$Genre == "adventure") | (movies$Genre == "animation") | (movies$Genre == "comedy") | (movies$Genre == "drama") 
movies2 <-movies[filt,]
movies2
view(movies2)

#filter the data frame for the desire movie studios
filt2 <- movies$Studio %in% c("Buena Vista Studios", "WB", "Fox", "Universal", "Sony", "Paramount Pictures")   

# Combine the filters
movies2 <- movies[filt & filt2,]
movies2 
view(movies2)
str(movies2)


# Lay the foundation for the plot's data and aes layers
p <- ggplot(data = movies2, aes(x=Genre, y=Gross...US))
p


#add geometries
p + geom_point()

p  + 
  geom_jitter(aes(size=Budget...mill., colour=Studio))  + 
  geom_boxplot(alpha=0.7, outlier.colour = NA)

q <- p  + 
  geom_jitter(aes(size=Budget...mill., colour=Studio))  + 
  geom_boxplot(alpha=0.7, outlier.colour = NA)

q

#non-data ink
q <- q +
  xlab("Genre") +
  ylab("Gross % US") + 
  ggtitle("Domestic Gross % by Genre") +
  theme(plot.title = element_text(hjust = 0.5))

q

#Final touch
q$labels$size <- "Budget $M"
q
