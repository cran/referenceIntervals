\name{dixon.outliers}
\alias{dixon.outliers}

\title{
Determines outliers using Dixon's Q Test method
}

\description{
This determines outliers of the dataset by calculating Dixon's Q statistic and comparing
it to a standardized table of statistics.  This method can only determine outliers for
datasets of size 3 <= n <= 30.
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
parameter and related subrange ratios at the 95% confidence level. Anal. Chem., 1991, 63 (2), pp 139-146
DOI: 10.1021/ac00002a010. Publication Date: January 1991
}

\author{
Daniel Finnegan
}

\examples{
dixon.outliers(set20)
summary(dixon.outliers(set20)$subset)

## The function is currently defined as
function (data) 
{
    if (length(data) >= 3 & length(data) <= 30) {
        d = sort(data)
        gap_high = abs(d[length(data)] - d[length(data) - 1])
        gap_low = abs(d[2] - d[1])
        range = d[length(d)] - d[1]
        end = NULL
        if (gap_high > gap_low) {
            end = "high"
            Q = gap_high/range
        }
        if (gap_low > gap_high) {
            end = "low"
            Q = gap_low/range
        }
        dixonNum = subset(dixonTableValues, Size == length(data))$Q95
        sub = data
        out = as.numeric(c())
        if (Q > dixonNum & end == "high") {
            sub = subset(data, data < d[length(d)])
            out = d[length(d)]
        }
        if (Q > dixonNum & end == "low") {
            sub = subset(data, data > d[1])
            out = d[1]
        }
        return(list(outliers = out, subset = sub))
    }
    else {
        return(list(outliers = as.numeric(c()), subset = data))
    }
  }
}

\keyword{ ~Dixon }
\keyword{ ~outlier }
