#' RunRealtimeReport object
#' @noRd
RunRealtimeReport <- function(dimensions = NULL,
                              metrics = NULL,
                              limit = NULL,
                              dimensionFilter = NULL,
                              metricFilter = NULL,
                              metricAggregations = NULL,
                              orderBys = NULL,
                              returnPropertyQuota = NULL){
  
  structure(
    rmNullObs(
      list(dimensions = dimensions,
           metrics = metrics,
           limit = limit,
           dimensionFilter = dimensionFilter,
           metricFilter = metricFilter,
           metricAggregations = metricAggregations,
           orderBys = orderBys,
           returnPropertyQuota = returnPropertyQuota)), 
    class = c("gar_RunRealtimeReport","list"))
}


#' BatchRunReportsRequest Object
#'
#' @details
#' Autogenerated via \code{\link[googleAuthR]{gar_create_api_objects}}
#' The batch request containing multiple report requests.
#'
#' @param entity A property whose events are tracked
#' @param requests Individual requests
#'
#' @return BatchRunReportsRequest object
#'
#' @family BatchRunReportsRequest functions
BatchRunReportsRequest <- function(entity, requests){
  
  assert_that(is.Entity(entity))
  assert_that_list(requests, is.RunReportRequest)
  
  structure(list(entity = entity, 
                 requests = requests), 
            class = c("gar_BatchRunReportsRequest","list"))
}


#' RunReportRequest Object
#'
#' @details
#' Autogenerated via \code{\link[googleAuthR]{gar_create_api_objects}}
#' The request to generate a report.
#'
#' @param entity A property whose events are tracked
#' @param metrics The metrics requested and displayed
#' @param currencyCode A currency code in ISO4217 format, such as 'AED', 'USD', 'JPY'
#' @param orderBys Specifies how rows are ordered in the response - see \link{ga_data_order}
#' @param metricFilter The filter clause of metrics - see \link{ga_data_filter}
#' @param cohortSpec Cohort group associated with this request
#' @param metricAggregations Aggregation of metrics. Aggregated metric values will be shown in rows where the dimensionValues are set to "RESERVED_(MetricAggregation)".
#' @param dimensions The dimensions requested and displayed
#' @param dateRanges Date ranges of data to read, can send up to 4 date ranges (a vector of 8 dates spanning 1 year)
#' @param keepEmptyRows If false, rows with metrics being 0 will not be returned
#' @param dimensionFilter The filter clause of dimensions - see \link{ga_data_filter}
#' @param limit The number of rows to return - use -1 to return all rows
#' @param offset The row count of the start row
#' @param returnPropertyQuota Toggles whether to return the current state of this Analytics Property's
#'
#' @return RunReportRequest object
#'
#' @family RunReportRequest functions
RunReportRequest <- function(entity = NULL, 
                             metrics = NULL, 
                             currencyCode = NULL,
                             orderBys = NULL, 
                             metricFilter = NULL, 
                             cohortSpec = NULL, 
                             metricAggregations = NULL,
                             dimensions = NULL, 
                             dateRanges = NULL, 
                             keepEmptyRows = NULL, 
                             dimensionFilter = NULL,
                             limit = NULL, 
                             offset = NULL, 
                             returnPropertyQuota = NULL){
  
  assert_that_ifnn(entity, is.Entity)
  assert_that_ifnn(dimensionFilter, is.FilterExpression)
  assert_that_ifnn(metricFilter, is.FilterExpression)
  
  structure(
    rmNullObs(
      list(entity = entity, 
           metrics = metrics, 
           currencyCode = currencyCode,
           orderBys = orderBys, 
           metricFilter = metricFilter, 
           cohortSpec = cohortSpec,
           metricAggregations = metricAggregations, 
           dimensions = dimensions, 
           dateRanges = dateRanges,
           keepEmptyRows = keepEmptyRows, 
           dimensionFilter = dimensionFilter, 
           limit = limit,
           offset = offset, 
           returnPropertyQuota = returnPropertyQuota)), 
    class = c("gar_RunReportRequest", "list"))
}

is.RunReportRequest <- function(x){
  inherits(x, "gar_RunReportRequest")
}

#' Entity Object
#'
#' @details
#' The unique identifier of the property whose events are tracked.
#'
#' @param propertyId A Google Analytics App + Web property id
#'
#' @return Entity object
#'
#' @family Entity functions
Entity <- function(propertyId) {
  structure(list(propertyId = as.character(propertyId)),
            class = c("gar_Entity", "list"))
}

is.Entity <- function(x){
  inherits(x, "gar_Entity")
}

#' Metric Object
#'
#' @details
#' Autogenerated via \code{\link[googleAuthR]{gar_create_api_objects}}
#' The quantitative measurements of a report. For example, the metric eventCount is the total number of events. Requests are allowed up to 10 metrics.
#'
#' @param expression A mathematical expression for derived metrics
#' @param invisible Indicates if a metric is invisible
#' @param name The name of the metric
#'
#' @return Metric object
#'
#' @family Metric functions
Metric <- function(name, 
                   expression = NULL,
                   invisible = NULL) {
  assert_that(is.string(name))
  
  structure(list(expression = expression,
                 invisible = invisible,
                 name = name),
            class = c("gar_Metric", "list"))
}

is.Metric <- function(x){
  inherits(x, "gar_Metric")
}

#' DimensionExpression Object
#'
#' @details
#' Autogenerated via \code{\link[googleAuthR]{gar_create_api_objects}}
#' Used to express a dimension which is the result of a formula of multipledimensions. Example usages:1) lower_case(dimension)2) concatenate(dimension1, symbol, dimension2).
#'
#' @param lowerCase Used to convert a dimension value to lower case
#' @param concatenate Used to combine dimension values to a single dimension
#' @param upperCase Used to convert a dimension value to upper case
#'
#' @return DimensionExpression object
#'
#' @family DimensionExpression functions
DimensionExpression <- function(lowerCase = NULL, 
                                concatenate = NULL, 
                                upperCase = NULL) {
  structure(list(lowerCase = lowerCase, 
                 concatenate = concatenate, 
                 upperCase = upperCase),
            class = c("gar_DimensionExpression", "list"))
}

is.DimensionExpression <- function(x){
  inherits(x, "gar_DimensionExpression")
}

#' Dimension Object
#'
#' @details
#' Autogenerated via \code{\link[googleAuthR]{gar_create_api_objects}}
#' Dimensions are attributes of your data. For example, the dimension City indicates the city, for example, 'Paris' or 'New York', from which an event originates. Requests are allowed up to 8 dimensions.
#'
#' @param name The name of the dimension
#' @param dimensionExpression One dimension can be the result of an expression of multiple dimensions
#'
#' @return Dimension object
#'
#' @family Dimension functions
Dimension <- function(name, dimensionExpression = NULL) {
  assert_that(is.string(name))
  
  structure(list(name = name, 
                 dimensionExpression = dimensionExpression), 
            class = c("gar_Dimension","list"))
}

is.Dimension <- function(x){
  inherits(x, "gar_Dimension")
}
