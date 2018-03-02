#' @rdname cooking-package
#' @export
#' @param from Where to buy the food, default: `supermarket()`
#' @examples
#' peel(buy("carrots"))
buy <- function(what, from = supermarket()) {
  new_food(
    paste("raw", what),
    input = from,
    provenance = "bought at"
  )
}

#' @rdname cooking-package
#' @export
supermarket <- function() {
  new_food_source("supermarket")
}
