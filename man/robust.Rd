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

## The function is currently defined as
function (data, indices = c(1:length(data)), refConf = 0.95) 
{
    data = sort(data[indices])
    n = length(data)
    median = summary(data)[[3]]
    Tbi = median
    TbiNew = 10000
    c = 3.7
    MAD = summary(abs(data - median))[[3]]
    MAD = MAD/0.6745
    smallDiff = FALSE
    repeat {
        ui = (data - Tbi)/(c * MAD)
        ui[ui < -1] = 1
        ui[ui > 1] = 1
        wi = (1 - ui^2)^2
        TbiNew = (sum(data * wi)/sum(wi))
        if ((abs(TbiNew - Tbi)) < 1e-06) {
            break
        }
        Tbi = TbiNew
    }
    ui = NULL
    ui = (data - median)/(205.6 * MAD)
    sbi205.6 = 205.6 * MAD * sqrt((n * sum(((1 - ui[ui > -1 & 
        ui < 1]^2)^4) * ui[ui > -1 & ui < 1]^2))/(sum((1 - ui[ui > 
        -1 & ui < 1]^2) * (1 - 5 * ui[ui > -1 & ui < 1]^2)) * 
        max(c(1, -1 + sum((1 - ui[ui > -1 & ui < 1]^2) * (1 - 
            5 * ui[ui > -1 & ui < 1]^2))))))
    ui = NULL
    ui = (data - median)/(3.7 * MAD)
    sbi3.7 = 3.7 * MAD * sqrt((n * sum(((1 - ui[ui > -1 & ui < 
        1]^2)^4) * ui[ui > -1 & ui < 1]^2))/(sum((1 - ui[ui > 
        -1 & ui < 1]^2) * (1 - 5 * ui[ui > -1 & ui < 1]^2)) * 
        max(c(1, -1 + sum((1 - ui[ui > -1 & ui < 1]^2) * (1 - 
            5 * ui[ui > -1 & ui < 1]^2))))))
    ui = NULL
    ui = (data - Tbi)/(3.7 * sbi3.7)
    St3.7 = 3.7 * sbi3.7 * sqrt((sum(((1 - ui[ui > -1 & ui < 
        1]^2)^4) * ui[ui > -1 & ui < 1]^2))/(sum((1 - ui[ui > 
        -1 & ui < 1]^2) * (1 - 5 * ui[ui > -1 & ui < 1]^2)) * 
        max(c(1, -1 + sum((1 - ui[ui > -1 & ui < 1]^2) * (1 - 
            5 * ui[ui > -1 & ui < 1]^2))))))
    tStatistic = qt(1 - ((1 - refConf)/2), (n - 1))
    margin = tStatistic * sqrt(sbi205.6^2 + St3.7^2)
    robustLower = Tbi - margin
    robustUpper = Tbi + margin
    RefInterval = c(robustLower, robustUpper)
    return(RefInterval)
  }
}

\keyword{ ~robust }
\keyword{ ~interval }
