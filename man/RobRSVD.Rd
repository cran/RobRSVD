\name{RobRSVD}
\alias{RobRSVD}
\title{
Robust Regularized Singular Value Decomposition
}
\description{
This function provides the Robust Regularized Singular Value Decomposition method based on Zhang, Shen and Huang (2013). We will return the first triplets: singular value, left and right singular vectors, for the first robust and regualrized SVD component.
}
\usage{
RobRSVD(data, irobust = F, huberk = 1.345, iinituv = F, inits, initu, initv, 
niter = 1000, tol = 1e-05, istablize = T, uspar = 0, vspar = 0, iugcv = F, 
ivgcv = F, usparmax = 10000, usparmin = 1e-10, nuspar = 14, iloguspar = T, 
vsparmax = 10000, vsparmin = 1e-10, nvspar = 14, ilogvspar = T)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
The input data.
}
  \item{irobust}{
A logical value. \code{TRUE} means a robust method is used. \code{FALSE} (default) means non-robust method is used.
}
  \item{huberk}{
The Huber robustness parameter. The default value is 1.345, as suggested in many Robust Statistics textbook
}
  \item{iinituv}{
A logical value. \code{TRUE} means initial value of \code{s}, \code{u}, and \code{v} will be provided.
}
  \item{inits}{
The initial value for \code{s}
}
  \item{initu}{
The initial value for \code{u}
}
  \item{initv}{
The initial value for \code{v}
}
  \item{niter}{
The largest possible iteration number. The default value is set to be 1000.
}
  \item{tol}{
The tolerance for numberical zero. The default value is 1e-5 
}
  \item{istablize}{
A logical value. \code{TRUE} means that before applying RobRSVD method, we will normalized the data. \code{FALSE} means that no normalization will be used.
}
  \item{uspar}{
A specified smoothing parameter for \code{u}
}
  \item{vspar}{
A specified smoothing parameter for \code{v}
}
  \item{iugcv}{
A logical value. \code{TRUE} means that the program will use GCV to choose optimal smoothing parameter for \code{u}. Otherwise, it will either use 0 or the parameter specified in \code{uspar}.
}
  \item{ivgcv}{
A logical value. \code{TRUE} means that the program will use GCV to choose optimal smoothing parameter for \code{v}. Otherwise, it will either use 0 or the parameter specified in \code{vspar}.
}
  \item{usparmax}{
When \code{iugcv} is \code{TRUE}, this one is to specify the largest possible smoothing parameter for \code{u}.
}
  \item{usparmin}{
When \code{iugcv} is \code{TRUE}, this one is to specify the smallest possible smoothing parameter for \code{u}.
}
  \item{nuspar}{
When \code{iugcv} is \code{TRUE}, this one is to specify number of possible smoothing parameters for \code{u}.
}
  \item{iloguspar}{
A logical value. When \code{iugcv} is \code{TRUE}, this one is to specify whether the equal spaced interval is defined in log-scale (if \code{TRUE}) or the original scale (if \code{FALSE}), for \code{u}.
}
  \item{vsparmax}{
When \code{ivgcv} is \code{TRUE}, this one is to specify the largest possible smoothing parameter for \code{v}.
}
  \item{vsparmin}{
When \code{ivgcv} is \code{TRUE}, this one is to specify the smallest possible smoothing parameter for \code{v}.
}
  \item{nvspar}{
When \code{ivgcv} is \code{TRUE}, this one is to specify number of possible smoothing parameters for \code{v}.
}
  \item{ilogvspar}{
A logical value. When \code{ivgcv} is \code{TRUE}, this one is to specify whether the equal spaced interval is defined in log-scale (if \code{TRUE}) or the original scale (if \code{FALSE}), for \code{v}.
}
}
\details{
This program applied alternating regression technique to estimate singular value decomposition. The usual least squares for regular SVD is replaced by the iterative reweighted least squares to achieve robustness.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
A list contains the following fields
\item{s}{The singular value}
\item{u}{The left singular vector, or singular column}
\item{v}{The right singular vector, or singular row}
\item{diagout}{A list of diagnosis measures, which include \code{ugcvscore}, \code{vgcvscore}, \code{ugcvmat} and \code{vgcvmat}}
}
\references{
Zhang, L., Shen, H., & Huang, J. Z. (2013). Robust regularized singular value decomposition with application to mortality data. The Annals of Applied Statistics, 7(3), 1540-1561.
}
\author{
Lingsong Zhang (lingsong@purdue.edu) and Chao Pan (panc@purdue.edu)
}

\seealso{
See Also as \code{\link{svd}}, \code{\link[svdvisual]{svd3dplot}}
}
\examples{
#generate a simulated data set, which is provided in Zhang et al (2013) AoAS paper.
u0<-log(10/9)*10^seq(0, 1, length=100)
v0<-sin(2*pi*seq(0, 1, length=100))/(1+1/pi)
s0<-773
data0<-s0*u0 \%*\% t(v0)
data<-data0+matrix(rnorm(10000, sd=20), nrow=100)
data[ceiling(10000*runif(50))]<-max(data0)+max(data0)*runif(50)
#the above provides random outlying cell simulation

#the svd calculation
data.svd<-RobRSVD(data, irobust=FALSE, uspar=0, vspar=0)

#the robsvd calculation
data.robsvd<-RobRSVD(data, irobust=TRUE, uspar=0, vspar=0)

#the ssvd calculation
data.ssvd<-RobRSVD(data, irobust=FALSE, iugcv=TRUE, ivgcv=TRUE)

#the robrsvd calculation
data.robrsvd<-RobRSVD(data, irobust=TRUE, iugcv=TRUE, ivgcv=TRUE)

#compare v's
plot(data.svd$v, type='l', ylab='V')
lines(data.robrsvd$v, col=2)
lines(data.ssvd$v, col=6)
lines(data.robsvd$v, col=4)

#compare u's
plot(data.svd$u, type='l', ylab='U')
lines(data.robrsvd$u, col=2)
lines(data.ssvd$u, col=6)
lines(data.robsvd$u, col=4)

#compare approximation matrices
#app.svd=data.svd$s * data.svd$u %*% t(data.svd$v)
#app.ssvd=data.ssvd$s * data.ssvd$u %*% t(data.ssvd$v)
#app.robsvd=data.robsvd$s * data.robsvd$u %*% t(data.robsvd$v)
#app.robrsvd=data.robrsvd$s * data.robrsvd$u %*% t(data.robrsvd$v)

#par(mfrow=c(2, 2))
#persp(app.svd, main='SVD', theta=-45, phi=40, xlab='', ylab='', zlab='')
#persp(app.ssvd, main='Regularized SVD', theta=-45, phi=40, xlab='', ylab='', zlab='');
#persp(app.robsvd, main='Robust SVD', theta=-45, phi=40, xlab='', ylab='', zlab='');
#persp(app.robrsvd, main='RobRSVD', theta=-45, phi=40, xlab='', ylab='', zlab='');
#dev.off()
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{SVD}
\keyword{Robustness}
\keyword{Smoothing}
\keyword{GCV}
% __ONLY ONE__ keyword per line
