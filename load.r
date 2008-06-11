options(Hverbose=FALSE)
library(ggplot2)

source.with.err <- function(path) {
  tryCatch(source(path), error = function(x) {print(path); print(x)})
}
paths <- dir("~/documents/ggplot/ggplot/R", full.name=T)
paths <- paths[basename(paths) != "xxx.r"]
lapply(paths, source.with.err)

accessors_print("~/documents/ggplot/ggplot/R/xxx.r")
source("~/documents/ggplot/ggplot/R/xxx.r")

if (!exists("curr")) curr <- NULL

prev <- curr
curr <- qplot(mpg, wt, data=mtcars)

curr_d <- digest.ggplot(curr)
prev_d <- digest.ggplot(prev)

if (!is.null(prev) & !identical(curr_d, prev_d)) {
  stop("Digest has changed from ", prev_d, " to ", curr_d, call. = FALSE)
}