\name{huberWeightLS}
\alias{huberWeightLS}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Huber's function
}
\description{
This function provides the usual Huber's weight function in Robust estimation context. See Huber (1981) for details. Let \eqn{\rho(x)} be the usual Huber's function, this function is \eqn{\rho'(x)/x}, where \eqn{\rho'(x)} is the derivative of \eqn{\rho(x)}. 
}
\usage{
huberWeightLS(data, k)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
The input vector or matrix
}
  \item{k}{
The parameter to control robustness, the default value is 1.345, as suggested in many Robust Statistics textbooks
}
}
\details{
See details of the huber weights in iterative least squares in the references
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
the weight vector or matrix for Huber-type robust regression
}
\references{
Huber, P. J. (1981). Robust statistics. Wiley series in probability and mathematical statistics.
}
\author{
Lingsong Zhang (lingsong@purdue.edu) and Chao Pan (panc@purdue.edu)
}
\examples{
#generate a t distrbution matrix
x<-matrix(rt(100, 1), nrow=10)

#generate the huber weight matrix with k=1.345
y=huberWeightLS(x, k=1.345)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{linear operator}
