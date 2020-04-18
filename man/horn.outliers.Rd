\name{horn.outliers}
\alias{horn.outliers}

\title{
Determines outliers using Horn's method and Tukey's interquartile fences on a Box-Cox
transformation of the data.
}

\description{
This function determines outliers in a Box-Cox transformed dataset using Horn's method
of outlier detection using Tukey's interquartile fences.  If a data point lies outside
1.5 * IQR from the 1st or 3rd quartile point, it is an outlier.
}

\usage{
horn.outliers(data)
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
ASVCP reference interval guidelines: determination of de novo reference intervals in
veterinary species and other related topics. Vet Clin Pathol 41/4 (2012) 441-453, 2012
American Society for Veterinary Clinical Pathology

Horn, P. S., Feng, L., Li, Y., & Pesce, A. J. (2001). Effect of outliers and nonhealthy
individuals on reference interval estimation. Clinical Chemistry, 47(12), 2137-2145.
}

\author{
Daniel Finnegan
}

\examples{
  
horn.outliers(set200)

}

\keyword{ ~Horn }
\keyword{ ~outlier }
