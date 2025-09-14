library("conflicted")
library("palmerpenguins")
library("tidyverse")

conflicts_prefer(palmerpenguins::penguins)

## Functions as arguments

ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  scale_color_discrete(label = tolower)

tolower(c("Emma", "Ian"))

## Our turn: Labeller

# percent_labeller is a function
# scales::label_percent() is a function factory
percent_labeller <- scales::label_percent(accuracy = 1)

percent_labeller(c(0, 0.01, 0.1, 1))

## Your turn: Labeller

# add `scale_y_continuous()` to ecdf plot, using the `labels` argument
ggplot(penguins, aes(x = bill_length_mm, color = species)) +
  stat_ecdf() +
  scale_y_continuous(labels = scales::label_percent(accuracy = 1))

## Declarative vs. Imperative programming

original <- 1:4

# declarative
original |> map_dbl(\(x) 2 * x)

# imperative
double = numeric(length(original))
for (i in seq_along(original)) {
  double[i] = original[i] * 2
}
double

# ultimate declarative
2 * original
