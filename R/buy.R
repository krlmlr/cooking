#' @rdname cooking-package
#' @export
#' @examples
#' peel(buy(I("carrots")))
buy <- function(what, where = supermarket()) {
  structure(
    paste("raw", what),
    class = "food",
    provenance = ", bought at",
    input = where
  )
}

#' @rdname cooking-package
#' @export
supermarket <- function() {
  structure("supermarket", class = "food", provenance = "")
}
