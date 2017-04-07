#' @export
combine <- function(...) {
  structure("ragout", class = "food", input = list(...))
}

#' @export
fry <- function(what, ...) {
  what <- get_what(what)
  main <- get_main(what)
  structure(paste("fried", main), class = "food", input = list(what, ...))
}

#' @export
chop <- function(what, ...) {
  what <- get_what(what)
  main <- get_main(what)
  structure(paste("chopped", main), class = "food", input = list(what, ...))
}

#' @export
format.food <- function(x) {
  c(paste0(x, ", made of"), indent(unlist(lapply(attr(x, "input"), format))))
}

#' @export
print.food <- function(x) {
  cat(paste(format(x), collapse = "\n"))
  invisible(x)
}

indent <- function(x) paste0("  ", x)

get_what <- function(x) {
  extracted <- gsub("^\"?([^.]*)(?:[.].*)?\"?$", "\\1", x)
  gsub("_", " ", extracted)
}

get_main <- function(x) {
  gsub("^.* ([^.]*)$", "\\1", x)
}
