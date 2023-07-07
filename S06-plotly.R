library("ggplot2")
data(iris)
p <- ggplot(data = iris,
            aes(x = Sepal.Length, 
                y = Sepal.Width, 
                colour = Species)) +
  geom_point()

library(plotly)

ggplotly(p)

