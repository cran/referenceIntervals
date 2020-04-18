\name{dixon.outliers}
\alias{dixon.outliers}

\title{
Determines outliers using Dixon's Q Test method
}

\description{
This determines outliers of the dataset by calculating Dixon's Q statistic and comparing
it to a standardized table of statistics.  This method can only determine outliers for
datasets of size 3 <= n <= 30.  This function requires the outliers package.
}

\usage{
dixon.outliers(data)
}

\arguments{
  \item{data}{A vector of data points.
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
Statistical treatment for rejection of deviant values: critical values of Dixon's "Q"
parameter and related subrange ratios at the 95% confidence level. Anal. Chem., 1991, 63
(2), pp 139-146
DOI: 10.1021/ac00002a010. Publication Date: January 1991

One-sided and Two-sided Critical Values for Dixon's Outlier Test for Sample Sizes up to
n = 30. Economic Quality Control, Vol 23(2008), No. 1, 5-13.

}

\author{
Daniel Finnegan
}

\examples{
  
dixon.outliers(set20)
summary(dixon.outliers(set20)$subset)

}

\keyword{ ~Dixon }
\keyword{ ~outlier }
