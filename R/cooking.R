#' @param what Main ingredient. If it is the name of an existing file, the first
#'   line of the file is read
#' @param ... Other ingredients
#' @return An object of class `food` that prints its provenance in a nice
#'   fashion.
#'
#' @rdname cooking-package
#' @export
peel <- function(what, ...) {
  what <- get_what(what)
  main <- get_main(what)
  structure(paste("peeled", main), class = "food", input = list(what, ...))
}

#' @rdname cooking-package
#' @export
chop <- function(what, ...) {
  what <- get_what(what)
  main <- get_main(what)
  structure(paste("chopped", main), class = "food", input = list(what, ...))
}

#' @rdname cooking-package
#' @export
fry <- function(what, ...) {
  what <- get_what(what)
  main <- get_main(what)
  structure(paste("fried", main), class = "food", input = list(what, ...))
}

#' @rdname cooking-package
#' @export
cook <- function(what, ...) {
  what <- get_what(what)
  main <- get_main(what)
  structure(paste("cooked", main), class = "food", input = list(what, ...))
}

#' @rdname cooking-package
#' @export
combine <- function(...) {
  structure("ragout", class = "food", input = list(...))
}

#' @export
format.food <- function(x, ...) {
  c(provenance(x), indent(unlist(lapply(attr(x, "input"), format))))
}

#' @export
print.food <- function(x, ...) {
  cat(paste(format(x), collapse = "\n"))
  invisible(x)
}

provenance <- function(x) {
  made_of <- attr(x, "provenance")
  if (is.null(made_of)) made_of <- ", made of"
  paste(x, made_of, sep = "")
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
