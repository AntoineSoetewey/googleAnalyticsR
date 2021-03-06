
#' Filter Object
#'
#' @details
#' Autogenerated via \code{\link[googleAuthR]{gar_create_api_objects}}
#' An expression to filter dimension or metric values.
#'
#' @param numericFilter A filter for numeric or date values
#' @param fieldName The dimension name or metric name
#' @param inListFilter A filter for in list values
#' @param nullFilter A filter for null values
#' @param stringFilter Strings related filter
#' @param betweenFilter A filter for two values
#'
#' @return Filter object
#'
#' @family Filter functions
#' @export
Filter_aw <- function(fieldName,
                   numericFilter = NULL, 
                   inListFilter = NULL, 
                   nullFilter = NULL,
                   stringFilter = NULL, 
                   betweenFilter = NULL) {
  
  assert_that(is.string(fieldName))
  only_one <- !c(is.null(numericFilter),
                is.null(inListFilter),
                is.null(nullFilter),
                is.null(stringFilter),
                is.null(betweenFilter))

  assert_that(is.flag(only_one[only_one]))  
  
  assert_that_ifnn(nullFilter, is.flag)
  assert_that_ifnn(stringFilter, is.StringFilter)
  assert_that_ifnn(inListFilter, is.InListFilter)
  assert_that_ifnn(numericFilter, is.NumericFilter)
  assert_that_ifnn(betweenFilter, is.BetweenFilter)
  
  structure(list(numericFilter = numericFilter, 
                 fieldName = fieldName, 
                 inListFilter = inListFilter,
                 nullFilter = nullFilter, 
                 stringFilter = stringFilter, 
                 betweenFilter = betweenFilter),
            class = c("gar_Filter", "list"))
}
is.Filter <- function(x){
  inherits(x, "gar_Filter")
}

#' FilterExpression Object
#'
#' @details
#'
#' The fields in the same FilterExpression need to be either all dimensions or all metrics.
#'
#' @param andGroup The FilterExpressions in and_group have an AND relationship
#' @param filter A primitive filter
#' @param orGroup The FilterExpressions in or_group have an OR relationship
#' @param notExpression The FilterExpression is NOT of not_expression
#'
#' @return FilterExpression object
#'
#' @family FilterExpression functions
#' @export
#' @importFrom purrr compact
FilterExpression <- function(andGroup = NULL,
                             filter = NULL,
                             orGroup = NULL,
                             notExpression = NULL){
  
  only_one <- !c(is.null(andGroup),
                is.null(filter),
                is.null(orGroup),
                is.null(notExpression))
  assert_that(is.flag(only_one[only_one]))
  
  assert_that_ifnn(andGroup, is.FilterExpressionList)
  assert_that_ifnn(orGroup, is.FilterExpressionList)
  assert_that_ifnn(notExpression, is.FilterExpression)
  assert_that_ifnn(filter, is.Filter)

  structure(compact(list(andGroup = andGroup, 
                 filter = filter, 
                 orGroup = orGroup, 
                 notExpression = notExpression)),
            class = c("gar_FilterExpression", "list"))
}

is.FilterExpression <- function(x){
  inherits(x, "gar_FilterExpression")
}

#' FilterExpressionList Object
#'
#' @details
#' A list of filter expressions.
#'
#' @param expressions A list of filter expressions
#'
#' @return FilterExpressionList object
#'
#' @family FilterExpressionList functions
#' @export
FilterExpressionList <- function(expressions){
  
  assert_that_list(expressions, is.FilterExpression)
  
  structure(list(expressions = expressions), 
            class = c("gar_FilterExpressionList","list"))
}

is.FilterExpressionList <- function(x){
  inherits(x, "gar_FilterExpressionList")
}


#' StringFilter Object
#'
#' @details
#' The filter for string
#'
#' @param caseSensitive If true, the string value is case sensitive
#' @param value The string value used for the matching
#' @param matchType The match type for this filter
#'
#' @return StringFilter object
#'
#' @family StringFilter functions
#' @export
StringFilter <- function(value,
                         matchType = c("EXACT",
                                       "BEGINS_WITH",
                                       "ENDS_WITH",
                                       "CONTAINS",
                                       "FULL_REGEXP",
                                       "PARTIAL_REGEXP"),
                         caseSensitive = TRUE){
  matchType <- match.arg(matchType)
  assert_that(is.flag(caseSensitive),
              is.string(value))
  
  structure(list(caseSensitive = caseSensitive, 
                 value = value, 
                 matchType = matchType),
            class = c("gar_StringFilter", "list"))
}

is.StringFilter <- function(x){
  inherits(x, "gar_StringFilter")
}

#' InListFilter Object
#'
#' @details
#' The result needs to be in a list of string values.
#'
#' @param caseSensitive If true, the string value is case sensitive
#' @param values The vector of string values
#'
#' @return InListFilter object
#'
#' @family InListFilter functions
#' @export
InListFilter <- function(values, caseSensitive = TRUE){
  assert_that(is.character(values),
              is.flag(caseSensitive))
  
  structure(list(caseSensitive = caseSensitive,
                 values = values), 
            class = c("gar_InListFilter","list"))
}

is.InListFilter <- function(x){
  inherits(x, "gar_InListFilter")
}

#' NumericFilter Object
#'
#' @details
#' 
#' Filters for numeric or date values.
#'
#' @param value A numeric value or a date value
#' @param operation The operation type for this filter
#'
#' @return NumericFilter object
#'
#' @family NumericFilter functions
#' @export
NumericFilter <- function(value, 
                          operation = c("EQUAL",
                                        "LESS_THAN",
                                        "LESS_THAN_OR_EQUAL",
                                        "GREATER_THAN",
                                        "GREATER_THAN_OR_EQUAL")){
  operation <- match.arg(operation)
  
  structure(list(value = as.NumericValue(value),
                 operation = operation),
            class = c("gar_NumericFilter",
                      "list"))
}

is.NumericFilter <- function(x){
  inherits(x, "gar_NumericFilter")
}

#' @noRd
as.NumericValue <- function(value){
  
  if(is.integer(value)){
    return(list(int64Value = value))
  } else if(is.numeric(value)){
    return(list(doubleValue = value))
  } else {
    stop("Not NumericValue: ", value, call. = FALSE)
  }

}

#' BetweenFilter Object
#'
#' @details
#' 
#' To express that the result needs to be between two numbers (inclusive).
#'
#' @param toValue Ends with this number
#' @param fromValue Begins with this number
#'
#' @return BetweenFilter object
#'
#' @family BetweenFilter functions
#' @export
BetweenFilter <- function(toValue, fromValue){
  
  structure(list(toValue = as.NumericValue(toValue), 
                 fromValue = as.NumericValue(fromValue)), 
            class = c("gar_BetweenFilter","list"))
}

is.BetweenFilter <- function(x){
  inherits(x, "gar_BetweenFilter")
}

