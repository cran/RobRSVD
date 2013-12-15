\name{ssmatls}
\alias{ssmatls}
\title{
The smoothing spline matrix
}
\description{
This function returns the smoothing matrix based on cubic smoothing spline method
}
\usage{
ssmatls(n)
}
\arguments{
  \item{n}{
the number of (equally spaced) grid
}
}
\details{
This function is based on Green and Silverman (1994) smoothing spline technique
}
\value{
A smoothing matrix based on smoothing spline method
}
\references{
Green, P. J., & Silverman, B. W. (1994). Nonparametric regression and generalized linear models: a roughness penalty approach (pp. 12-27). London: Chapman & Hall.
}
\author{
Lingsong Zhang (lingsong@purdue.edu)
Chao Pan (panc@purdue.edu)
}
\seealso{
See Also as \code{\link{smooth.spline}}}
\examples{
#set the number of grid
n<-100

#calculate the smoothing matrix
g<-ssmatls(n)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{smoothing}
\keyword{linear operator}% __ONLY ONE__ keyword per line
