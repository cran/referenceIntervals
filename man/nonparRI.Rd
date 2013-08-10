\name{nonparRI}
\alias{nonparRI}

\title{
Determines the reference interval using non-parametric means
}

\description{
This function uses the appropriate percentiles as determined by refConf to return the
non-parametric reference interval.  This is written as a boot function to use within
the function refLimit.
}

\usage{
nonparRI(data, indices = 1:length(data), refConf = 0.95)
}

\arguments{
	\item{data}{ data is a vector of sample values.
	}
	\item{indices}{ The indices of data to be used in the calculations.  The default is 
	to use the whole set.
	}
	\item{refConf}{ refConf is a measure of the range covered by the calculation.  Most 
	often, as is the default, 95% reference intervals are used in medical settings.
	}
}

\value{
	Returns a vector of two values, the lower and upper limits of the reference interval.
}

\references{
Defining, Establishing, and Verifying Reference Intervals in the Clinical Laboratory; 
Approved Guideline - 3rd Edition (C28-A3)
}

\author{
Daniel Finnegan
}

\examples{
nonparRI(set50)
nonparRI(set50, refConf = 0.9)

## The function is currently defined as
function (data, indices = 1:length(data), refConf = 0.95) 
{
    d = data[indices]
    results = c(quantile(d, (1 - refConf)/2, type = 6), quantile(d, 
        1 - ((1 - refConf)/2), type = 6))
    return(results)
  }
}

\keyword{ ~interval }
\keyword{ ~nonparametric }
\keyword{ ~range }
