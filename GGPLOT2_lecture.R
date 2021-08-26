library(tidyverse)

# GGPLOT2 vs PLOT

ggplot(iris, 
       aes(x = Petal.Length, y = Petal.Width, color = Species)) + 
  geom_point(size = 3)

data<-iris
plot(x = data$Petal.Length, y = data$Petal.Width, col = data$Species)
legend(5,1.5,unique(data$Species),col = 1:length(data$Species),pch=1)

#reg<-lm(Petal.Width ~ Petal.Length, data = iris)
#abline(reg)



# Substitution aes_string()

(var <- names(iris)[1:4])

f <- function(column) {
  symcol <- sym(column)
  ggplot(iris, coeff = 0.6) + 
    geom_density(aes(!!symcol, fill = Species), alpha = 0.6) +
    theme(legend.position = "none")
}

p_list <- lapply(var, f)

str(p_list, max.level = 1)

cowplot::plot_grid(plotlist = p_list, ncol = 2, align = "hv",
                   labels = LETTERS[1:4], label_size = 15)



iris_tidy <- iris %>%
  pivot_longer(cols = -Species, names_to = "Characteristic", values_to = "Values")


ggplot(iris_tidy, aes(x = Values, fill = Species)) +
  geom_density(alpha = 0.6) +
  facet_wrap(~Characteristic, scales = "free") +
  theme_bw()
  





#Plotly

ggplot(iris, aes(Petal.Length, Petal.Width, 
                 color = Species, shape = Species)) + 
  geom_point(size = 3)

plotly::ggplotly(width = 700, height = 450)

plotly::ggplotly(
  ggplot2::last_plot() + aes(text = bigstatsr::asPlotlyText(iris)),
  tooltip = "text", width = 700, height = 420)




# Example built-in theme

library(bigstatsr)
X <- big_attachExtdata()
svd <- big_SVD(X, big_scale(), k = 10)
plot(svd, type = "scores")


pop <- rep(c("POP1", "POP2", "POP3"), c(143, 167, 207))
ggplot2::last_plot() + 
  # add colors
  aes(color = pop) + labs(color = "Population") +
  ## change the place of the legend
  theme(legend.position = c(0.85, 0.2)) + 
  ## change the title and the label of the x-axis
  labs(title = "Yet another title", x = "with a new 'x' label")
