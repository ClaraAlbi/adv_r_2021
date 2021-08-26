library(tidyverse)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(class~.)


ggplot(data = mpg, mapping = aes(x = displ, y = hwy, fill = class)) + 
  #geom_point()
  geom_point(color = "white", size = 3, stroke = 2, shape = 21)



apply(iris[1:4], MARGIN = 2, mean)

mat <- matrix(0, 10, 2); mat[c(5, 8, 9, 12, 15, 16, 17, 19)] <- 1; mat


  
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(aes(shape = class)) +
  geom_line(aes(color = year))

x <- 1:10
n <- 3
mod <- length(x)%%n
dim(x) <- c(n, length(x)/n)


fun_s <- function(x, n) {
  if (mod <- length(x)%%n) 
    x <- c(x, rep(0, n - mod))
  dim(x) <- c(n, length(x)/n)
  colSums(x)
}


fun_s(1:20, 5)  




mat <- matrix(0, 10, 2); mat[c(5, 8, 9, 12, 15, 16, 17, 19)] <- 1; mat

(decode <- matrix(c(0, NA, 1, 2), 2))

apply(mat+1, MARGIN = 1, function(x) decode[x])


#

set.seed(1)
(x <- rnorm(10))

boot <- replicate(100, mean(sample(x, replace = T)))

quantile(boot,probs = c(0.025, 0.975))


#

my_mtcars <- mtcars[c("mpg", "hp")]
my_mtcars$my_col <- sample(c("mpg", "hp"), size = nrow(my_mtcars), replace = TRUE)
head(my_mtcars)

my_mtcars$my_val <- my_mtcars[cbind(1:nrow(my_mtcars), match(my_mtcars$my_col, colnames(my_mtcars)))]

my_mtcars %>%
  mutate(my_val = )
#


df <- data.frame(
  id1 = c("a", "f", "a"),
  id2 = c("b", "e", "e"), 
  id3 = c("c", "d", "f"),
  inter = c(7.343, 2.454, 3.234),
  stringsAsFactors = FALSE
)
(code <- setNames(1:6, letters[1:6]))


lapply(df, function(x) x[x == names(code)] <- code[which(x == names(code))])
lapply(df, function(x) )


