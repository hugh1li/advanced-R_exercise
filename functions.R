library(tidyverse)
objs <- mget(ls("package:base"), inherits = TRUE)

imap_dfc(objs, ~str_detect(.y, pattern = '<-') & is.primitive(.x)) %>% gather() %>% filter(value == TRUE)

#dfr or dfc: row and column binding
mtcars %>%
  split(.$cyl) %>%
  map(~ lm(mpg ~ wt, data = .x)) %>%
  map_dfr(~ as.data.frame(t(as.matrix(coef(.)))))
