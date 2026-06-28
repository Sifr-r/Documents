# R — Core Syntax

## Vector Types

| Type | Example | Description |
|---|---|---|
| `numeric` | `c(1.5, 2.7)` | Double-precision floats (default) |
| `integer` | `c(1L, 2L, 3L)` | Whole numbers (`L` suffix) |
| `character` | `c("a", "b")` | Strings |
| `logical` | `c(TRUE, FALSE)` | Boolean values |
| `complex` | `c(1+2i)` | Complex numbers |
| `raw` | `as.raw(42)` | Raw bytes |

```r
# Creating vectors
nums <- c(1, 2, 3, 4, 5)
ints <- 1:10
seq_vec <- seq(0, 1, by = 0.1)
rep_vec <- rep(c("a", "b"), times = 3)

# Named vectors
scores <- c(alice = 95, bob = 87, carol = 92)
scores["alice"]  # 95

# Vectorized operations
nums * 2            # each element doubled
nums > 3            # logical vector: FALSE FALSE FALSE TRUE TRUE
sum(nums[nums > 3]) # sum of elements > 3
```

## Data Frames and Tibbles

```r
# Base data frame
df <- data.frame(
    name = c("Alice", "Bob", "Carol"),
    age = c(30, 25, 28),
    score = c(95, 87, 92)
)

# Access columns
df$name              # vector
df[, "age"]          # vector
df[1, ]              # first row

# Tibble (tibble package, modern data frame)
library(tibble)
tbl <- tibble(
    name = c("Alice", "Bob"),
    age = c(30, 25)
)

# Subsetting with conditions
adults <- df[df$age >= 28, ]
high_scores <- df[df$score > 90, c("name", "score")]
```

## Lists

```r
# Heterogeneous collection
person <- list(
    name = "Alice",
    age = 30,
    scores = c(95, 87, 92),
    address = list(city = "NYC", zip = "10001")
)

person$name              # "Alice"
person[["scores"]]       # c(95, 87, 92)
person$address$city      # "NYC"
length(person)           # 4 top-level elements
```

## Functions and Scoping

```r
# Define function
add <- function(x, y) {
    return(x + y)
}

# Default arguments
greet <- function(name, greeting = "Hello") {
    paste(greeting, name)
}

# Anonymous function (R 4.1+)
square <- \(x) x^2

# Lexical scoping — inner function sees outer variables
make_counter <- function() {
    count <- 0
    function() {
        count <<- count + 1  # assign in parent scope
        count
    }
}
```

## Apply Family

```r
# lapply — returns list
lapply(1:5, function(x) x^2)

# sapply — simplifies to vector/matrix
sapply(1:5, function(x) x^2)  # numeric vector

# vapply — like sapply but requires output type spec
vapply(1:5, function(x) x^2, numeric(1))

# apply — on matrix/data frame margins
m <- matrix(1:12, nrow = 3)
apply(m, 1, sum)   # row sums
apply(m, 2, mean)  # column means

# mapply — multivariate (parallel vectors)
mapply(function(x, y) x + y, 1:3, 10:12)  # 11, 13, 15
```

## dplyr Verbs

```r
library(dplyr)

df %>%
    filter(age > 25) %>%                    # filter rows
    select(name, age, score) %>%            # select columns
    mutate(grade = ifelse(score > 90, "A", "B")) %>%  # add/modify columns
    arrange(desc(score)) %>%                # sort
    group_by(grade) %>%                     # group
    summarise(avg_age = mean(age), n = n()) # aggregate
```

## ggplot2 Basics

```r
library(ggplot2)

# Scatter plot
ggplot(df, aes(x = age, y = score, color = name)) +
    geom_point(size = 3) +
    theme_minimal()

# Bar chart
ggplot(df, aes(x = name, y = score)) +
    geom_col(fill = "steelblue")

# Histogram
ggplot(df, aes(x = score)) +
    geom_histogram(binwidth = 5, fill = "gray70")

# Line plot
ggplot(time_series, aes(x = date, y = value)) +
    geom_line() +
    facet_wrap(~category)
```

## String Manipulation

```r
# Base R
paste("Hello", "World", sep = " ")   # "Hello World"
paste0("x", 1:3)                      # "x1" "x2" "x3"
grep("pattern", x, value = TRUE)
sub("old", "new", x)                  # first match
gsub("old", "new", x)                 # all matches

# stringr package (tidyverse)
library(stringr)
str_detect(x, "pattern")             # logical vector
str_extract(x, "\\d+")               # first match
str_replace_all(x, "\\s+", " ")      # replace all
str_split(x, ",")                    # list of character vectors
str_to_upper(x)
```

## Missing Values

```r
# NA — missing / not available
x <- c(1, NA, 3, NA, 5)
is.na(x)                  # TRUE FALSE ... pattern
sum(x, na.rm = TRUE)      # ignore NAs

# NaN — not a number (result of 0/0)
0 / 0                      # NaN
is.nan(NaN)               # TRUE

# NULL — absence of a value
x <- NULL
length(NULL)               # 0
is.null(x)

# complete.cases — rows with no NAs
df[complete.cases(df), ]
```

## Pipe Operators

```r
# magrittr pipe (%>%) — widely used with dplyr
library(magrittr)
result <- mtcars %>%
    filter(cyl == 6) %>%
    select(mpg, hp) %>%
    arrange(desc(mpg))

# Base R pipe (|>) — R 4.1+, no package needed
result <- mtcars |>
    subset(cyl == 6) |>
    transform(mpg_kpl = mpg * 0.425)

# Placeholder (_ in base R 4.2+)
mtcars |> lm(mpg ~ hp, data = _)
```

## See Also

- [README.md](README.md) — overview and quick reference
