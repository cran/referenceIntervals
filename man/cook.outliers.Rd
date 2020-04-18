\name{cook.outliers}
\alias{cook.outliers}

\title{
Determines outliers using Cook's Distance
}

\description{
A linear regression model is calculated for the data (which is the mean for one-dimensional
data.  From that, using the Cook Distances of each data point, outliers are determined
and returned.
}

\usage{
cook.outliers(data)
}

\arguments{
	\item{data}{ A vector of data points.
	}
}

\value{
	Returns a list containing a vector of outliers and a vector of the cleaned data (subset).

	\item{outliers }{A vector of outliers from the data set
	}
	\item{subset }{A vector containing the remaining data, cleaned of outliers
	}
}

\author{
Daniel Finnegan
}

\examples{
	
cook.outliers(set50)
plot(cook.outliers(set50)$subset)

}

\keyword{ ~Cook }
\keyword{ ~outlier }
