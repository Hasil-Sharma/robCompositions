\name{impKNNa}
\alias{impKNNa}
\title{ Imputation of missing values in compositional data using knn methods }
\description{
  This function offers several k-nearest neighbor methods for the imputation of missing values in compositional data.
}
\usage{
impKNNa(x, method = "knn", k = 3, metric = "Aitchison", agg = "median", 
        primitive = FALSE, normknn = TRUE, das = FALSE, adj="median")
}
\arguments{
  \item{x}{ data frame or matrix }
  \item{method}{ method (at the moment, only \dQuote{knn} can be used) }
  \item{k}{ number of nearest neighbors chosen for imputation }
  \item{metric}{ \dQuote{Aichison} or \dQuote{Euclidean} }
  \item{agg}{ \dQuote{median} or \dQuote{mean}, for the aggregation of the nearest neighbors }
  \item{primitive}{ if TRUE, a more enhanced search for the $k$-nearest neighbors is obtained (see details)}
  \item{normknn}{ An adjustment of the imputed values is performed if TRUE }
  \item{das}{depricated. if TRUE, the definition of the Aitchison distance, based on simple logratios of the compositional
  part, is used (Aitchison, 2000) to calculate distances between observations.
             if FALSE, a version using the clr transformation is used.}
  \item{adj}{ either \sQuote{median} (default) or \sQuote{sum} can be chosen for the adjustment of the nearest 
  neighbors, see Hron et al., 2010. }
}
\details{
The Aitchison \code{metric} should be chosen when dealing with compositional data, the Euclidean \code{metric} otherwise. 

If \code{primitive} \eqn{==} FALSE, a sequential search for the \eqn{k}-nearest neighbors 
is applied for every missing value where all information corresponding to the 
non-missing cells plus the information in the variable to be imputed plus some 
additional information is available. If \code{primitive} \eqn{==} TRUE, a search of the 
\eqn{k}-nearest neighbors among observations is applied where in addition to the variable 
to be imputed any further cells are non-missing. 

If \code{normknn} is TRUE (prefered option) the imputed cells from a nearest neighbor method are adjusted with special adjustment factors (more details can be found online (see the references)).
}
\value{
  \item{xOrig }{Original data frame or matrix}
  \item{xImp }{Imputed data}
  \item{w }{Amount of imputed values}
  \item{wind }{Index of the missing values in the data}
  \item{metric }{Metric used}
}
\references{ 
Aitchison, J. and Barcelo-Vidal, C. and Martin-Fernandez, J.A. and Pawlowsky-Glahn, V. (2000) 
Logratio analysis and compositional distance, Mathematical Geology 32(3):271-275.

Hron, K. and Templ, M. and Filzmoser, P. (2010) Imputation of missing values for compositional data using classical and robust methods 
\emph{Computational Statistics and Data Analysis}, vol 54 (12), pages 3095-3107.  
 }
\author{ Matthias Templ }
\seealso{ \code{\link{impCoda}} }
\examples{
data(expenditures)
x <- expenditures
x[1,3]
x[1,3] <- NA
xi <- impKNNa(x)$xImp
xi[1,3]
}
\keyword{ manip }
\keyword{ multivariate }
