% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ga4_data_objects.R
\name{RunReportRequest}
\alias{RunReportRequest}
\title{RunReportRequest Object}
\usage{
RunReportRequest(
  entity = NULL,
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
  returnPropertyQuota = NULL
)
}
\arguments{
\item{entity}{A property whose events are tracked}

\item{metrics}{The metrics requested and displayed}

\item{currencyCode}{A currency code in ISO4217 format, such as 'AED', 'USD', 'JPY'}

\item{orderBys}{Specifies how rows are ordered in the response - see \link{ga_data_order}}

\item{metricFilter}{The filter clause of metrics - see \link{ga_data_filter}}

\item{cohortSpec}{Cohort group associated with this request}

\item{metricAggregations}{Aggregation of metrics. Aggregated metric values will be shown in rows where the dimensionValues are set to "RESERVED_(MetricAggregation)".}

\item{dimensions}{The dimensions requested and displayed}

\item{dateRanges}{Date ranges of data to read, can send up to 4 date ranges (a vector of 8 dates spanning 1 year)}

\item{keepEmptyRows}{If false, rows with metrics being 0 will not be returned}

\item{dimensionFilter}{The filter clause of dimensions - see \link{ga_data_filter}}

\item{limit}{The number of rows to return - use -1 to return all rows}

\item{offset}{The row count of the start row}

\item{returnPropertyQuota}{Toggles whether to return the current state of this Analytics Property's}
}
\value{
RunReportRequest object
}
\description{
RunReportRequest Object
}
\details{
Autogenerated via \code{\link[googleAuthR]{gar_create_api_objects}}
The request to generate a report.
}
\concept{RunReportRequest functions}
