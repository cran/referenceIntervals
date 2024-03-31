\name{referenceIntervals-package}
\alias{referenceIntervals-package}
\alias{referenceIntervals}
\docType{package}

\title{
This package calculates reference intervals from a dataset using either parametric,
non-parametric, or robust methods.
}

\description{
This package also calculates the confidence intervals around the calculated reference
intervals in order to provide a metric for how precise the calculations are.  This package
also contains four outlier detection functions.
}

\details{
\tabular{ll}{
Package: \tab referenceIntervals\cr
Type: \tab Package\cr
Version: \tab 1.3.1\cr
Date: \tab 2024-03-30\cr
License: \tab GPL-3\cr
}

}
\author{
Daniel Finnegan

Maintainer: Daniel Finnegan <dan.finnegan@gmail.com>
}

\references{

Clinical and Laboratory Standards Institute. Defining, Establishing, and Verifying Reference Intervals in the Clinical Laboratory; Approved Guideline - Third Edition. C28-A3c. 28(30).

Friedman JH. A recursive partitioning decision rule for nonparametric classification. \emph{IEEE Transactions on Computers.} 1977. April: 404-408.

Friedrichs KR, Harr KE, Freeman KP, et al. ASVCP reference interval guidelines: determination of de novo reference intervals in veterinary species and other related topics. \emph{Vet Clin Pathol.} 2012;441-453.

H.E. Solberg Department of Clinical Chemistry. Approved recommendation (1987) on the theory of reference values. Part 5. Statistical treatment of collected reference values. Determination of reference limits. \emph{Clinica Chimica Acta.} 1987:S13-S32.

Horn PS, Pesce AJ. Reference intervals: an update. \emph{Clinica Chimica Acta.} 2003. 334:5-23.

Horn PS, Pesce AJ, Copeland BE. A robust approach to reference interval estimation and evaluation. \emph{Clinical Chemistry.} 1998. 44(3):622-631.

Horn PS, Pesce AJ, Copeland BE. Reference interval computation using robust vs parametric and nonparametric analyses. \emph{Clinical Chemistry.} 1999. 45(12):2284-2285.

Linnet K. Nonparametric estimation of reference intervals by simple and bootstrap-based procedures. \emph{Clinical Chemistry.} 2000. 46(6):867-869.

Verma SP, Quiroz-Ruiz A. Critical values for six Dixon tests for outliers in normal samples up to sizes 100, and applications in science and engineering. \emph{Revista Mexicana de Ciencias Geologicas.} 2006. 23(2):133-161.

Verma SP, Quiroz-Ruiz A, Diaz-Gonzalez L. Critical values for 33 discordancy test variants for outliers in normal samples up to sizes 1000, and applications in quality control in Earth Sciences. \emph{Revista Mexicana de Ciencias Geologicas.} 2008. 25(1):82-96.

Virtanen A, Kairisto V, Uusipaikka E. Regression-based reference limits: determination of sufficient sample size. \emph{Clinical Chemistry.} 1998. 44(11):2353-2358.

}

\keyword{ package }

\examples{
refLimit(set50, out.rm = TRUE, out.method = "cook")
refLimit(set200, out.method = "horn", RI = "n", refConf = 0.90, limitConf = 0.80)
horn.outliers(set120)
dixon.outliers(set20)

refLimit(set50, out.method = "vanderLoo", out.rm = TRUE, RI = "r", bootStat = "perc")

frame = data.frame(one = rnorm(30, m = 5, sd = 2), two = rnorm(30, m = 7, sd = 1),
	three = rnorm(30, m = 2, sd = 0.5))
result = refLimit(frame)
plot(result)

}
