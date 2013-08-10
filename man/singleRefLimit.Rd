\name{singleRefLimit}
\alias{singleRefLimit}

\title{
This is the workhorse of the refLimit function
}

\description{
This is the function called to work on each individual vector of data.
}

\usage{
singleRefLimit(data, dname = "default", out.method = "horn", out.rm = FALSE, 
RI = "p", CI = "p", refConf = 0.95, limitConf = 0.9)
}

\arguments{
	\item{data}{ A vector of data points.
	}
	\item{dname}{ Name of dataset.
	}
  	\item{out.method}{ The outlier detection method.  Valid options include "horn", 
  	"cook", "dixon", and "vanderLoo".
  	}
	\item{out.rm}{ Remove outliers.  If value is TRUE, outliers will be automatically 
	removed prior to calculations.  If FALSE (default), outliers will be detected but 
	not removed.
	}
	\item{RI}{ Method for reference interval calculations.  Valid options include 
	"p" (default) for parametric, "n" for non-parametric, and "r" for robust method.
	}
	\item{CI}{ Method for confidence interval calculations.  Valid options include "p" 
	for parametric (default), "n" for non-parametric, and "boot" for bootstrapping 
	method.  The minimum sample size for non-parametric confidence interval calculations 
	is 120.  With smaller samples, bootstrapping methods are used.
	}
	\item{refConf}{ Desired coverage for the calculated reference interval.  The 
	default is a 95% reference interval.
	}
	\item{limitConf}{ Desired confidence interval level.  The default is a 90% 
	confidence interval around the reference interval limits.
	}
}

\value{
	Returns a list of necessary information.
	
	\item{size}{ Size of dataset
	}
	\item{dname}{ Name of dataset
	}
	\item{out.method}{ Method of outlier detection
	}
	\item{out.rm}{ Boolean indicating whether outliers are automatically removed
	}
	\item{outliers}{ Vector of detected outliers
	}
	\item{methodRI}{ Method for reference interval calculations (p, n, or r)
	}
	\item{methodCI}{ Method for confidence interval calculations (p, n, boot)
	}
	\item{norm}{ Results of running Shapiro-Wilk and Kolmorgorov-Smirnov normacy tests
	}
	\item{refConf}{ Desired coverage of reference interval
	}
	\item{limitConf}{ Desired confidence interval level
	}
	\item{Ref_Int}{ List containing the reference interval and confidence interval 
	values
	}
}

\author{
Daniel Finnegan
}

\examples{
singleRefLimit(set200, out.method = "horn", out.rm = TRUE)

## The function is currently defined as
function (data, dname = "default", out.method = "horn", out.rm = FALSE, 
    RI = "p", CI = "p", refConf = 0.95, limitConf = 0.9) 
{
    if (out.method == "dixon") {
        output = dixon.outliers(data)
    }
    else if (out.method == "cook") {
        output = cook.outliers(data)
    }
    else if (out.method == "vanderLoo") {
        output = vanderLoo.outliers(data)
    }
    else {
        output = horn.outliers(data)
    }
    if (out.rm == TRUE) {
        data = output$subset
    }
    outliers = output$outliers
    n = length(data)
    mean = mean(data, na.rm = TRUE)
    sd = sd(data, na.rm = TRUE)
    norm = NULL
    if (RI == "n") {
        methodRI = "Reference Interval calculated nonparametrically"
        data = sort(data)
        holder = nonparRI(data, indices = 1:length(data), refConf)
        lowerRefLimit = holder[1]
        upperRefLimit = holder[2]
        if (CI == "p") {
            CI = "n"
        }
    }
    if (RI == "r") {
        methodRI = "Reference Interval calculated using Robust algorithm"
        holder = robust(data, 1:length(data), refConf)
        lowerRefLimit = holder[1]
        upperRefLimit = holder[2]
        CI = "boot"
    }
    if (RI == "p") {
        methodRI = "Reference Interval calculated parametrically"
        methodCI = "Confidence Intervals calculated parametrically"
        refZ = qnorm(1 - ((1 - refConf)/2))
        limitZ = qnorm(1 - ((1 - limitConf)/2))
        lowerRefLimit = mean - refZ * sd
        upperRefLimit = mean + refZ * sd
        se = sqrt(((sd^2)/n) + (((refZ^2) * (sd^2))/(2 * n)))
        lowerRefLowLimit = lowerRefLimit - limitZ * se
        lowerRefUpperLimit = lowerRefLimit + limitZ * se
        upperRefLowLimit = upperRefLimit - limitZ * se
        upperRefUpperLimit = upperRefLimit + limitZ * se
        shap_normalcy = shapiro.test(data)
        shap_output = paste(c("Shapiro-Wilk: W = ", format(shap_normalcy$statistic, 
            digits = 6), ", p-value = ", format(shap_normalcy$p.value, 
            digits = 6)), collapse = "")
        ks_normalcy = suppressWarnings(ks.test(data, "pnorm", 
            m = mean, sd = sd))
        ks_output = paste(c("Kolmorgorov-Smirnov: D = ", format(ks_normalcy$statistic, 
            digits = 6), ", p-value = ", format(ks_normalcy$p.value, 
            digits = 6)), collapse = "")
        if (shap_normalcy$p.value < 0.05 | ks_normalcy$p.value < 
            0.05) {
            norm = list(shap_output, ks_output)
        }
        else {
            norm = list(shap_output, ks_output)
        }
    }
    if (CI == "n") {
        if (n < 120) {
            cat("\nSample size too small for non-parametric confidence intervals, 
            bootstrapping instead\n")
            CI = "boot"
        }
        else {
            methodCI = "Confidence Intervals calculated nonparametrically"
            ranks = subset(nonparRanks, subset = (nonparRanks$SampleSize == 
                n))
            lowerRefLowLimit = data[ranks$Lower]
            lowerRefUpperLimit = data[ranks$Upper]
            upperRefLowLimit = data[(n + 1) - ranks$Upper]
            upperRefUpperLimit = data[(n + 1) - ranks$Lower]
        }
    }
    if (CI == "boot" & (RI == "n" | RI == "r")) {
        methodCI = "Confidence Intervals calculated by bootstrapping, R = 5000"
        if (RI == "n") {
            bootresult = boot(data = data, statistic = nonparRI, 
                refConf = refConf, R = 5000)
        }
        if (RI == "r") {
            bootresult = boot(data = data, statistic = robust, 
                refConf = refConf, R = 5000)
        }
        bootresultlower = boot.ci(bootresult, conf = limitConf, 
            type = "basic", index = 1)
        bootresultupper = boot.ci(bootresult, conf = limitConf, 
            type = "basic", index = 2)
        lowerRefLowLimit = bootresultlower$basic[4]
        lowerRefUpperLimit = bootresultlower$basic[5]
        upperRefLowLimit = bootresultupper$basic[4]
        upperRefUpperLimit = bootresultupper$basic[5]
    }
    RVAL = list(size = n, dname = dname, out.method = out.method, 
        out.rm = out.rm, outliers = outliers, methodRI = methodRI, 
        methodCI = methodCI, norm = norm, refConf = refConf, 
        limitConf = limitConf, Ref_Int = c(lowerRefLimit = lowerRefLimit, 
            upperRefLimit = upperRefLimit), 
            Conf_Int = c(lowerRefLowLimit = lowerRefLowLimit, 
            lowerRefUpperLimit = lowerRefUpperLimit, 
            upperRefLowLimit = upperRefLowLimit, 
            upperRefUpperLimit = upperRefUpperLimit))
    class(RVAL) = "interval"
    return(RVAL)
  }
}

\keyword{ ~reference }
\keyword{ ~interval }
