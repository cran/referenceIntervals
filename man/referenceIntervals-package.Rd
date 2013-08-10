\name{referenceIntervals-package}
\alias{referenceIntervals-package}
\alias{referenceIntervals}
\docType{package}

\title{
This package calculates reference intervals from a dataset using either parametric,
non-parametric, or robust methods.
}

\description{
This package also calculates the confidence intervals around the calculated reference
intervals in order to provide a metric for how precise the calculations are.  This package
also contains four outlier detection functions.
}

\details{
\tabular{ll}{
Package: \tab referenceIntervals\cr
Type: \tab Package\cr
Version: \tab 1.1\cr
Date: \tab 2014-08-09\cr
License: \tab GPL-3\cr
}

}
\author{
Daniel Finnegan

Maintainer: Daniel Finnegan <dan.finnegan@gmail.com>
}

\references{
~~ Literature or other references for background information ~~
}

\keyword{ package }

\examples{
refLimit(set50, out.rm = TRUE, out.method = "cook")
refLimit(set200, out.method = "horn", RI = "n", refConf = 0.90, limitConf = 0.80)
horn.outliers(set120)
dixon.outliers(set20)

frame = data.frame(one = rnorm(30, m = 5, sd = 2), two = rnorm(30, m = 7, sd = 1), 
	three = rnorm(30, m = 2, sd = 0.5))
result = refLimit(frame)
plot(result)

}
