% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ga4_data_objects.R
\name{DimensionExpression}
\alias{DimensionExpression}
\title{DimensionExpression Object}
\usage{
DimensionExpression(lowerCase = NULL, concatenate = NULL, upperCase = NULL)
}
\arguments{
\item{lowerCase}{Used to convert a dimension value to lower case}

\item{concatenate}{Used to combine dimension values to a single dimension}

\item{upperCase}{Used to convert a dimension value to upper case}
}
\value{
DimensionExpression object
}
\description{
DimensionExpression Object
}
\details{
Autogenerated via \code{\link[googleAuthR]{gar_create_api_objects}}
Used to express a dimension which is the result of a formula of multipledimensions. Example usages:1) lower_case(dimension)2) concatenate(dimension1, symbol, dimension2).
}
\concept{DimensionExpression functions}
