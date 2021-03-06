\name{pfa}
\alias{pfa}
\title{ Factor analysis for compositional data }
\description{
Computes the principal factor analysis of the input data which are transformed and centered first. 
}
\usage{
pfa(x, factors, data = NULL, covmat = NULL, n.obs = NA, 
subset, na.action, start = NULL, 
scores = c("none", "regression", "Bartlett"), 
rotation = "varimax", maxiter = 5, control = NULL, ...)
}
\arguments{
  \item{x}{ (robustly) scaled input data  }
  \item{factors}{ number of factors  }
  \item{data}{ default value is NULL }
  \item{covmat}{ (robustly) computed covariance or correlation matrix }
%  \item{transformation}{Either \sQuote{clr} or \sQuote{ilr}}
  \item{n.obs}{ number of observations  }
  \item{subset}{ 	if a subset is used  }
  \item{na.action}{ what to do with NA values }
  \item{start}{ starting values  }
  \item{scores}{ which method should be used to calculate the scores }
  \item{rotation}{ 	if a rotation should be made  }
  \item{maxiter}{ maximum number of iterations  }
  \item{control}{ default value is NULL }
  \item{\dots}{ arguments for creating a list }
}
\details{
  The main difference to usual implementations is that 
  uniquenesses are nor longer of diagonal form. This kind of factor analysis is designed for centered log-ratio
  transformed compositional data. However, if the covariance is not specified, the covariance is estimated from 
  isometric log-ratio transformed data internally, but the data used for factor analysis are backtransformed to 
  the clr space (see Filzmoser et al., 2009).
}
\value{
  \item{loadings }{A matrix of loadings, one column for each factor. The factors 
  are ordered in decreasing order of sums of squares of loadings.}
  \item{uniquness }{uniquness}
  \item{correlation }{correlation matrix}
  \item{criteria}{The results of the optimization: the value of the 
  negativ log-likelihood and information of the iterations used.}
  \item{factors }{the factors }
  \item{dof }{degrees of freedom}
  \item{method }{\dQuote{principal}}
  \item{n.obs }{number of observations if available, or NA}
  \item{call }{The matched call.}
  \item{STATISTIC, PVAL }{The significance-test statistic and p-value, if they can be computed}
}
\references{ C. Reimann, P. Filzmoser, R.G. Garrett, and R. Dutter (2008): 
Statistical Data Analysis Explained. 
\emph{Applied Environmental Statistics with R}. 
John Wiley and Sons, Chichester, 2008.

P. Filzmoser, K. Hron, C. Reimann, R. Garrett (2009): Robust Factor Analysis for Compositional Data. 
\emph{Computers and Geosciences}, \bold{35} (9), 1854--1861.
}
\author{ Peter Filzmoser, Karel Hron, Matthias Templ }
\examples{
data(expenditures)
x <- expenditures
res0 <- pfa(x, factors=1, covmat="cov")

## the following produce always the same result:
res1 <- pfa(x, factors=1, covmat="covMcd")
res2 <- pfa(x, factors=1, covmat=covMcd(isomLR(x))$cov)
res3 <- pfa(x, factors=1, covmat=covMcd(isomLR(x)))
}
\keyword{ multivariate }