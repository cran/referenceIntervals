\name{horn.outliers}
\alias{horn.outliers}

\title{
Determines outliers using Horn's method and Tukey's interquartile fences
}

\description{
This function determines outliers in a dataset using Horn's method of outlier detection
using Tukey's interquartile fences.  If a data point lies outside 1.5 * IQR from the 
1st or 3rd quartile point, it is an outlier.
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
}

\author{
Daniel Finnegan
}

\examples{
horn.outliers(set200)

## The function is currently defined as
function (data) 
{
    descriptives = summary(data)
    Q1 = descriptives[[2]]
    Q3 = descriptives[[5]]
    IQR = Q3 - Q1
    out = subset(data, data <= (Q1 - 1.5 * IQR) | data >= (Q3 + 
        1.5 * IQR))
    sub = subset(data, data > (Q1 - 1.5 * IQR) & data < (Q3 + 
        1.5 * IQR))
    return(list(outliers = out, subset = sub))
  }
}

\keyword{ ~Horn }
\keyword{ ~outlier }
