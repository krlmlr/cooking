#' Create new food
#'
#' Constructor for objects of class `food`.
#' @param what Name of the food or food source
#' @param input Ingredients that went into creating this food
#' @param provenance Conjunction to use with the ingredients, defaults to
#'   `"made of"`
#' @export
#' @examples
#' new_food("chopped meat", "raw meat")
#' new_food("carrot pieces", "peeled carrots", "cut from")
new_food <- function(what, input, provenance = NULL) {
  stopifnot(is.list(input) || is.character(input))
  stopifnot(is.null(provenance) || is.character(provenance))
  new_food_object(what, input, provenance)
}

#' @rdname new_food
#' @export
#' @examples
#' new_food_source("the butcher's")
new_food_source <- function(what) {
  new_food_object(what, list(), "")
}

new_food_object <- function(what, input, provenance) {
  structure(
    what,
    class = "food",
    input = input,
    provenance = provenance
  )
}

#' Manipulate food
#'
#' This function creates new functions that change food in various ways.
#' @param processed A description of the result, an adjective
#' @param envir The parent environment of the function
#' @return A function with arguments `what` and `...`, similar to [fry()]
#' @export
#' @examples
#' marinate <- make_cooking("marinated")
#' marinate("chopped meat")
make_cooking <- function(processed, envir = getNamespace("cooking")) {
  fun <- eval(bquote(function(what, ...) {
    what <- get_what(what)
    main <- get_main(what)
    structure(paste(.(processed), main), class = "food", input = list(what, ...))
  }))

  environment(fun) <- envir
  fun
}
