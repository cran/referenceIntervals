\name{plot.interval}
\alias{plot.interval}

\title{
Overload of plot function to include the ability to plot the results of refLimit
}

\description{
Plots the reference interval and confidence intervals around the limits of the reference
interval.
}

\usage{
\method{plot}{interval}(x, main, ...)
}

\arguments{
	\item{x}{ Object x is of type "interval".
	}
	\item{main}{ Title of plot.
	}
	\item{\dots}{ Arguments to be passed to methods, such as graphical parameters (see 'par').
	}
}

\value{
	No return value.
}

\author{
Daniel Finnegan
}

\examples{

result = refLimit(set200)
plot(result)

}

\keyword{ methods }
