\name{print.interval}
\alias{print.interval}

\title{
Overload of print in order to concisely print the results of refLimit
}

\description{
This function allows for the pretty-printing of a large list object created by calling
the refLimit function.
}

\usage{
\method{print}{interval}(x, digits = 4L, quote = TRUE, prefix = "", ...)
}

\arguments{
	\item{x}{ x is an object of type "interval"
	}
	\item{digits}{ minimal number of _significant_ digits.  See 'print.default'.
	}
	\item{quote}{ logical, indicating whether or not strings should be printed 
	with surrounding quotes.
	}
	\item{prefix}{ Option to specify a formatting prefix.
	}
	\item{\dots}{ further arguments passed to or from other methods.
	}
}

\value{
	No return value.
}

\author{
Daniel Finnegan
}

\examples{
result = refLimit(set120)
result

## The function is currently defined as
function (x, digits = 4L, quote = TRUE, prefix = "", ...) 
{
    if (class(x[[1]]) == "interval") {
        lapply(x, print.interval.sub)
    }
    else {
        print.interval.sub(x)
    }
  }
}

\keyword{ ~print }
\keyword{ ~interval }
