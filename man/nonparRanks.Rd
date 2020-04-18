\name{nonparRanks}
\alias{nonparRanks}
\docType{data}

\title{
Table that dictate the ranks for the confidence intervals around the
calculated reference interval.
}

\description{
This is a table that dictate the ranks for the confidence intervals around the
calculated reference interval.  This method is available when 120 <= n <= 1000.
}

\usage{nonparRanks}
\format{
  A data frame with 882 observations on the following 3 variables.
  \describe{
    \item{\code{SampleSize}}{ a numeric vector}
    \item{\code{Lower}}{ a numeric vector}
    \item{\code{Upper}}{ a numeric vector}
  }
}

\references{
Defining, Establishing, and Verifying Reference Intervals in the Clinical Laboratory;
Approved Guideline - 3rd Edition (C28-A3)
}

\examples{
  
data(nonparRanks)

}

\keyword{datasets}
