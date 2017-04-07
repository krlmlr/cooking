#' @rdname cooking-package
#' @export
#' @param from Where to buy the food, default: `supermarket()`
#' @examples
#' peel(buy(I("carrots")))
buy <- function(what, from = supermarket()) {
  structure(
    paste("raw", what),
    class = "food",
    provenance = ", bought at",
    input = from
  )
}

#' @rdname cooking-package
#' @export
supermarket <- function() {
  structure("supermarket", class = "food", provenance = "")
}
