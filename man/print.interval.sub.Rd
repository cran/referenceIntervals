\name{print.interval.sub}
\alias{print.interval.sub}

\title{
Overload of print in order to concisely print the results of refLimit
}

\description{
This function allows for the pretty-printing of a large list object created by calling
the refLimit function.
}

\usage{
\method{print}{interval.sub}(x, digits = 4L, quote = TRUE, prefix = "", ...)
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

## The function is currently defined as
function (x, digits = 4L, quote = TRUE, prefix = "", ...) 
{
    cat("\n")
    cat(strwrap(x$methodRI, prefix = "\t"), sep = "\n")
    cat(strwrap(x$methodCI, prefix = "\t"), sep = "\n")
    cat("\n")
    cat("data:  ", x$dname, "\n", sep = "")
    cat("N: ", x$size, "\n", sep = "")
    if (!is.null(x$refConf)) {
        cat(format(100 * x$refConf), "\% Reference Interval", 
            "\n", sep = "")
    }
    if (!is.null(x$limitConf)) {
        cat(format(100 * x$limitConf), "\% Confidence Intervals\n", 
            "\n", sep = "")
    }
    if (!is.null(x$out.method)) {
        cat("Outlier detection method:", x$out.method, "\n")
    }
    if (!is.null(x$outliers) & length(x$outliers) > 0) {
        if (x$out.rm) {
            cat("Removed outliers: ")
        }
        else {
            cat("Suspected outliers: ")
        }
        cat(strwrap(paste(format(x$outliers, digits = 6), collapse = ", ")), 
            sep = "\n")
    }
    else {
        cat("No outliers detected\n")
    }
    if (!is.null(x$norm)) {
        cat(strwrap(x$norm, prefix = "\n"), "\n\n")
    }
    if (!is.null(x$Ref_Int)) {
        cat("\nReference Interval: ")
        cat(strwrap(paste(format(x$Ref_Int, digits = 6), collapse = ", ")), 
            sep = "\n")
    }
    if (!is.null(x$Conf_Int)) {
        cat("Lower Confidence Interval: ")
        cat(strwrap(paste(format(x$Conf_Int[1:2], digits = 6), 
            collapse = ", ")), sep = "\n")
        cat("Upper Confidence Interval: ")
        cat(strwrap(paste(format(x$Conf_Int[3:4], digits = 6), 
            collapse = ", ")), sep = "\n")
    }
    cat("\n")
    invisible(x)
  }
}

\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
