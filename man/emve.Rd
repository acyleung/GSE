\name{emve}
\alias{emve}
\title{Extended Minimum Volume Ellipsoid (EMVE) in the presence of missing data}
\description{
  Computes the Extended S-Estimate (ESE) version of the minimum volume ellipsoid (EMVE), which is
  used as an initial estimator in Generlized S-Estimator (GSE) for missing data by default. 
}
\usage{emve(x, n.resample=600, maxits=3, seed) }
\arguments{
  \item{x}{a matrix or data frame. May contain missing values, but cannot contain columns with completely missing entries.}
  \item{n.resample}{integer indicating the number of subsamples. Default is 600. Must be at least 20.}
  \item{maxits}{integer indicating the maximum number of iterations of Gaussian MLE calculation for each subsample. Default is 3.}
  \item{seed}{optional starting value for random generator. Default is seed = 12345.} 
}
\details{
  This function computes EMVE as described in Danilov et al. (2012). Subsampling algorithm is used for computing EMVE.
  By default, we take \eqn{N = 600} subsamples of size \eqn{n_0 = p/(1-\alpha)}, where \eqn{p} is the dimension of the data and
  \eqn{\alpha} is the fraction of missing data. The subsample size \eqn{n_0} must be chosen to be larger than \eqn{p} to avoid singularity. 
  
  In the algorithm, there exists a concentration step in which Gaussian MLE is computed for \eqn{50\%} of the data points using the 
  classical EM-algorithm multiplied by a scalar factor. This step is repeated for each subsample. As the computation can be heavy as the 
  number of subsample increases, we set by default the maximum number of iteration of classical EM-algorithm (i.e. \code{maxits}) as 5. 
  Users are encouraged to refer to Danilov et al. (2012) for details about the algorithm
  and Rubin and Little (2002) for the classical EM-algorithm for missing data. 
}
\value{
  An S4 object of class \code{\link{emve-class}} which is a subclass of the virtual class \code{\link{CovRobMissSc-class}}.
  The output S4 object contains the following slots:
  
	\tabular{ll}{
	\code{mu} \tab Estimated location. Can be accessed via \code{\link{getLocation}}. \cr
	\code{S} \tab Estimated scatter matrix. Can be accessed via \code{\link{getScatter}}. \cr 
    \code{sc} \tab Estimated EMVE scale. Can be accessed via \code{\link{getScale}}. \cr
	\code{pmd} \tab Squared partial Mahalanobis distances. Can be accessed via \code{\link{getDist}}. \cr
	\code{pmd.adj} \tab Adjusted squared partial Mahalanobis distances. Can be accessed via \code{\link{getDistAdj}}. \cr
	\code{pu} \tab Dimension of the observed entries for each case. Can be accessed via \code{\link{getDim}}. \cr
	\code{call} \tab Object of class \code{"language"}. Not meant to be accessed. \cr
	\code{x} \tab Input data matrix. Not meant to be accessed. \cr
	\code{p} \tab Column dimension of input data matrix. Not meant to be accessed. \cr
	\code{estimator}\tab Character string of the name of the estimator used. Not meant to be accessed. \cr
	}
}
\references{
 	Danilov, M., Yohai, V.J., Zamar, R.H. (2012). Robust Esimation of Multivariate
	Location and Scatter in the Presence of Missing Data. \emph{Journal of the American Statistical Association}
	\bold{107}, 1178--1186.
	
	Rubin, D.B. and Little, R.J.A. (2002). \emph{Statistical analysis with missing data} (2nd ed.). New York: Wiley.
}
\author{Andy Leung \email{andy.leung@stat.ubc.ca}, Ruben H. Zamar, Mike Danilov, Victor J. Yohai}
\seealso{
  \code{\link{GSE}}, \code{\link{emve-class}}
}