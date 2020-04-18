\name{refLimit}
\alias{refLimit}

\title{
Calculates and returns reference and confidence intervals for a dataset
}

\description{
This function calculates a reference interval from a
dataset using parametric, non-parametric, or robust methods.
}

\usage{
refLimit(data, out.method = "horn", out.rm = FALSE, RI = "p", CI = "p",
refConf = 0.95, limitConf = 0.9, bootStat = "basic")
}

\arguments{
  \item{data}{
  A vector of data points.
  }
  \item{out.method}{
  The outlier detection method.  Valid options include "horn", "cook", "dixon", and
  "vanderLoo".
  }
  \item{out.rm}{
  Remove outliers.  If value is TRUE, outliers will be automatically removed prior to
  calculations.  If FALSE (default), outliers will be detected but not removed.
  }
  \item{RI}{
  Method for reference interval calculations.  Valid options include "p" (default) for
  parametric, "n" for non-parametric, and "r" for robust method.
  }
  \item{CI}{
  Method for confidence interval calculations.  Valid options include "p" for parametric
  (default), "n" for non-parametric, and "boot" for bootstrapping method.  The minimum
  samplesize for non-parametric confidence interval calculations is 120.  With smaller
  samples, bootstrapping methods are used.
  }
  \item{refConf}{
  Desired coverage for the calculated reference interval.  The default is a 95% reference
  interval.
  }
  \item{limitConf}{
  Desired confidence interval level.  The default is a 90% confidence interval around the
  reference interval limits.
  }
  \item{bootStat}{ Method for calculating confidence intervals from package \emph{boot}.
  Valid arguments include "basic" (basic bootstrap method), "perc" (bootstrap percentile method),
   "norm" (normal approximation method), "stud" (studentized bootstrap method), and
   "bca" (adjusted bootstrap percentile method).
  }
}

\details{
A confidence interval around each limit of the reference interval is calculated as a
metric for determining the validity of the result. Outliers can be detected in one of
four different methods and automatically eliminated.

To determine the most appropriate calculation for confidence intervals using the bootstrapping
method, please consult chapter 5 of Davison and Hinkley's "Bootstrap Methods and their Applications."
}

\value{
	Returns a list of necessary information.

	\item{size}{ Size of dataset
	}
	\item{dname}{ Name of dataset
	}
	\item{out.method}{ Outlier detection method
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
	\item{Ref_Int}{ List containing the reference interval and confidence interval values
	}
}

\references{
ASVCP reference interval guidelines: determination of de novo reference intervals in
veterinary species and other related topics. \emph{Vet Clin Pathol} 41/4 (2012) 441-453, 2012.
American Society for Veterinary Clinical Pathology

Davison,  A.C.  and  Hinkley,  D.V.  (1997) \emph{Bootstrap  Methods  and  Their  Application},  Chapter  5.
Cambridge University Press.
}

\author{
Daniel Finnegan
}

\examples{

refLimit(set20, out.method = "dixon")
refLimit(set200, out.method = "cook", out.rm = TRUE, RI = "n", refConf = 0.9)
refLimit(set50, out.method = "vanderLoo", out.rm = TRUE, RI = "r", bootStat = "perc")

}

\keyword{ ~reference }
\keyword{ ~interval }
