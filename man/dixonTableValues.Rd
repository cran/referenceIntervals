\name{dixonTableValues}
\alias{dixonTableValues}
\docType{data}

\title{
This is a data frame containing Dixon's Q statistic for three confidence levels (90%, 95%,
99%).
}

\description{
This is a table for retrieval of the Dixon Q statistic threshold.
}

\usage{dixonTableValues}
\format{
  A data frame with 28 observations on the following 4 variables.
  \describe{
    \item{\code{Size}}{ a numeric vector}
    \item{\code{Q90}}{ a numeric vector}
    \item{\code{Q95}}{ a numeric vector}
    \item{\code{Q99}}{ a numeric vector}
  }
}

\references{
Statistical treatment for rejection of deviant values: critical values of Dixon's "Q" 
parameter and related subrange ratios at the 95% confidence level. Anal. Chem., 1991, 63 (2), 
pp 139-146. DOI: 10.1021/ac00002a010. Publication Date: January 1991
}

\examples{
data(dixonTableValues)
}

\keyword{datasets}
