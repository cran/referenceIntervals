\name{vanderLoo.outliers}
\alias{vanderLoo.outliers}

\title{
Mark van der Loo's outlier detection method in the extremevalues package
}
\description{
Separates data into vectors of outliers and a cleaned subset of the data.
}

\usage{
vanderLoo.outliers(data)
}

\arguments{
	\item{data}{ Vector of data values.
	}
}

\value{
	Returns a list containing a vector of outliers and a vector of the cleaned data (subset).
	
	\item{outliers}{ A vector of outliers from the data set
	}
	\item{subset}{ A vector containing the remaining data, cleaned of outliers
	}
}

\references{
http://cran.r-project.org/web/packages/extremevalues/extremevalues.pdf
}

\author{
Daniel Finnegan
}

\note{
Requires extremevalues package.
}

\examples{
vanderLoo.outliers(set50)
vanderLoo.outliers(set200)

## The function is currently defined as
function (data) 
{
    result = getOutliers(data, method = "I")
    indices = c(result$iLeft, result$iRight)
    out = data[indices]
    sub = data[!data \%in\% out]
    return(list(outliers = out, subset = sub))
  }
}

\keyword{ ~vanderLoo }
\keyword{ ~outliers }
