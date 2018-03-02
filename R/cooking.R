#' @param what Main ingredient. If it is the name of an existing file, the first
#'   line of the file is read
#' @param ... Other ingredients
#' @return An object of class `food` that prints its provenance in a nice
#'   fashion.
#'
#' @rdname cooking-package
#' @export
#' @include food.R
peel <- make_cooking("peeled")

#' @rdname cooking-package
#' @export
chop <- make_cooking("chopped")

#' @rdname cooking-package
#' @export
fry <- make_cooking("fried")

#' @rdname cooking-package
#' @export
cook <- make_cooking("cooked")

#' @rdname cooking-package
#' @param name The name of the resulting food
#' @export
combine <- function(..., name = "ragout") {
  new_food(name, list(...))
}

#' @export
format.food <- function(x, ...) {
  c(provenance(x), indent(unlist(lapply(attr(x, "input"), format))))
}

#' @export
print.food <- function(x, ...) {
  cat(paste(format(x), collapse = "\n"), "\n", sep = "")
  invisible(x)
}

provenance <- function(x) {
  made_of <- attr(x, "provenance")
  if (is.null(made_of)) made_of <- "made of"
  paste(x, ", ", crayon::italic(made_of), sep = "")
}

indent <- function(x) paste0("  ", x)

get_what <- function(x) {
  if (file.exists(x))
    extracted <- readLines(x, n = 1)
  else
    extracted <- gsub("^\"?([^.]*)(?:[.].*)?\"?$", "\\1", x)
  gsub("_", " ", extracted)
}

get_main <- function(x) {
  gsub("^.* ([^.]*)$", "\\1", x)
}
