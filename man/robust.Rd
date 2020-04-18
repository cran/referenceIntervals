\name{robust}
\alias{robust}

\title{
Algorithm that implements the robust method for reference interval calculations
}

\description{
The robust method is an iterative method that determines the most appropriate weighted
mean of the data and then calculates the desired reference interval.
}

\usage{
robust(data, indices = c(1:length(data)), refConf = 0.95)
}

\arguments{
	\item{data}{ Vector of data.
	}
	\item{indices}{ Indices of data to use for calculations.
	}
	\item{refConf}{ Desired coverage of the reference interval.  Default is 95% reference
	interval.
	}
}

\value{
	Returns a vector containing the lower and upper limits of the reference interval.
}

\references{
Defining, Establishing, and Verifying Reference Intervals in the Clinical Laboratory;
Approved Guideline - 3rd Edition (C28-A3)
}

\author{
Daniel Finnegan
}

\examples{
	
robust(set50)
robust(horn.outliers(set20)$subset)

}

\keyword{ ~robust }
\keyword{ ~interval }
