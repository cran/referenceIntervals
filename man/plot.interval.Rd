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
plot.interval(result)

## The function is currently defined as
function (x, main = NULL, ...) 
{
    original.parameters = par()
    if (class(x[[1]]) != "interval") {
        range = max(x[["Conf_Int"]][[4]]) - min(x[["Conf_Int"]][[1]])
        y_low = min(x[["Conf_Int"]][[1]]) - 0.05 * range
        y_high = max(x[["Conf_Int"]][[4]]) + 0.05 * range
        plot.new()
        plot.window(xlim = c(0, 2), ylim = c(y_low, y_high))
        segments(1, min(x[["Ref_Int"]]), 1, max(x[["Ref_Int"]]), 
            col = "red")
        segments(1 - 0.05, x[["Conf_Int"]][[1]], 1 + 0.05, x[["Conf_Int"]][[1]], 
            col = "blue")
        segments(1 - 0.05, x[["Conf_Int"]][[2]], 1 + 0.05, x[["Conf_Int"]][[2]], 
            col = "blue")
        segments(1 - 0.05, x[["Conf_Int"]][[3]], 1 + 0.05, x[["Conf_Int"]][[3]], 
            col = "blue")
        segments(1 - 0.05, x[["Conf_Int"]][[4]], 1 + 0.05, x[["Conf_Int"]][[4]], 
            col = "blue")
        axis(1, at = 1:1, labels = x[["dname"]])
        axis(2)
        if (!is.null(main)) {
            title(main = main)
        }
        else {
            title(main = "Reference Range")
        }
        title(xlab = "Parameter")
        title(ylab = "Units")
        legend(x = "topright", col = c("red", "blue"), lty = 1, 
            inset = c(0, -0.09), legend = c("Reference Interval", 
                "Confidence Intervals"), cex = 0.75, xpd = TRUE)
        box()
    }
    if (class(x[[1]]) == "interval") {
        numRanges = length(x)
        intervals = unlist(sapply(x, "[", "Conf_Int"))
        labels = unlist(sapply(x, "[", "dname"))
        range = max(intervals) - min(intervals)
        y_low = min(intervals) - 0.05 * range
        y_high = max(intervals) + 0.05 * range
        plot.new()
        plot.window(xlim = c(0, numRanges + 1), ylim = c(y_low, 
            y_high))
        for (i in 1:numRanges) {
            segments(i, x[[i]]$Ref_Int[1], i, x[[i]]$Ref_Int[2], 
                col = "red")
            segments(i - 0.05, x[[i]]$Conf_Int[[1]], i + 0.05, 
                x[[i]]$Conf_Int[[1]], col = "blue")
            segments(i - 0.05, x[[i]]$Conf_Int[[2]], i + 0.05, 
                x[[i]]$Conf_Int[[2]], col = "blue")
            segments(i - 0.05, x[[i]]$Conf_Int[[3]], i + 0.05, 
                x[[i]]$Conf_Int[[3]], col = "blue")
            segments(i - 0.05, x[[i]]$Conf_Int[[4]], i + 0.05, 
                x[[i]]$Conf_Int[[4]], col = "blue")
        }
        axis(1, at = 1:numRanges, labels = FALSE)
        text(x = seq(1, numRanges, by = 1), par("usr")[3] - 0.2, 
            labels = labels, cex = 0.75, srt = 90, pos = 1, offset = 2, 
            xpd = TRUE)
        axis(2)
        if (!is.null(main)) {
            title(main = main)
        }
        else {
            title(main = "Reference Range")
        }
        title(xlab = "Parameter")
        title(ylab = "Units")
        legend(x = "topright", col = c("red", "blue"), lty = 1, 
            inset = c(0, -0.09), legend = c("Reference Interval", 
                "Confidence Intervals"), cex = 0.75, xpd = TRUE)
        box()
    }
    par(original.parameters[-c(13, 19, 21:23)])
  }
}

\keyword{ ~plot }
\keyword{ ~interval }
