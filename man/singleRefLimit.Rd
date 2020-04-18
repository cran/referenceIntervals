\name{singleRefLimit}
\alias{singleRefLimit}

\title{
This is the workhorse of the refLimit function
}

\description{
This is the function called to work on each individual vector of data.
}

\usage{
singleRefLimit(data, dname = "default", out.method = "horn", out.rm = FALSE,
RI = "p", CI = "p", refConf = 0.95, limitConf = 0.9, bootStat = "basic")
}

\arguments{
	\item{data}{ A vector of data points.
	}
	\item{dname}{ Name of dataset.
	}
  	\item{out.method}{ The outlier detection method.  Valid options include "horn",
  	"cook", "dixon", and "vanderLoo".
  	}
	\item{out.rm}{ Remove outliers.  If value is TRUE, outliers will be automatically
	removed prior to calculations.  If FALSE (default), outliers will be detected but
	not removed.
	}
	\item{RI}{ Method for reference interval calculations.  Valid options include
	"p" (default) for parametric, "n" for non-parametric, and "r" for robust method.
	}
	\item{CI}{ Method for confidence interval calculations.  Valid options include "p"
	for parametric (default), "n" for non-parametric, and "boot" for bootstrapping
	method.  The minimum sample size for non-parametric confidence interval calculations
	is 120.  With smaller samples, bootstrapping methods are used.
	}
	\item{refConf}{ Desired coverage for the calculated reference interval.  The
	default is a 95% reference interval.
	}
	\item{limitConf}{ Desired confidence interval level.  The default is a 90%
	confidence interval around the reference interval limits.
	}
	\item{bootStat}{ Method for calculating confidence intervals from package boot.
	Valid arguments include "basic" (basic bootstrap method), "perc" (bootstrap percentile method),
   "norm" (normal approximation method), "stud" (studentized bootstrap method), and
   "bca" (adjusted bootstrap percentile method).
	}
}

\value{
	Returns a list of necessary information.

	\item{size}{ Size of dataset
	}
	\item{dname}{ Name of dataset
	}
	\item{out.method}{ Method of outlier detection
	}
	\item{out.rm}{ Boolean indicating whether outliers are automatically removed
	}
	\item{outliers}{ Vector of detected outliers
	}
	\item{methodRI}{ Method for reference interval calculations (p, n, or r)
	}
	\item{methodCI}{ Method for confidence interval calculations (p, n, boot)
	}
	\item{norm}{ Results of running Shapiro-Wilk and Kolmorgorov-Smirnov normacy tests
	}
	\item{refConf}{ Desired coverage of reference interval
	}
	\item{limitConf}{ Desired confidence interval level
	}
	\item{Ref_Int}{ List containing the reference interval and confidence interval
	values
	}
}

\author{
Daniel Finnegan
}

\examples{

singleRefLimit(set200, out.method = "horn", out.rm = TRUE)

}

\keyword{ ~reference }
\keyword{ ~interval }
