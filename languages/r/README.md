# R

Statistical computing and data visualization language.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Vectors, data frames, functions, apply family |

## Quick Reference

```r
# Vectors
numbers <- c(1, 2, 3, 4, 5)
names <- c("Alice", "Bob", "Charlie")

# Data frames
df <- data.frame(
    name = c("Alice", "Bob"),
    age = c(30, 25)
)

# Filtering
adults <- df[df$age >= 18, ]
library(dplyr)
adults <- df %>% filter(age >= 18)

# Apply functions
result <- sapply(numbers, function(x) x^2)
result <- lapply(numbers, sqrt)

# ggplot2
library(ggplot2)
ggplot(df, aes(x = name, y = age)) + geom_col()

# Pipe operator
result <- numbers %>%
    Filter(function(x) x > 2, .) %>%
    sapply(sqrt)
```