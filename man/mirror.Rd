\name{mirror}
\alias{mirror}
\alias{mirror.coords}
\alias{mirror.pdb}
\title{Reflexion of Atomic Coordinates}
\description{Perform a reflexion (or mirror) operation on atomic coordinates with respect to a given reflexion plan.}
\usage{
mirror(...)
\method{mirror}{coords}(x, p1, p2 = NULL, p3 = NULL, mask = TRUE, cryst1 = NULL, \dots)
\method{mirror}{pdb}(x, p1, p2 = NULL, p3 = NULL, mask = TRUE, cryst1 = x$cryst1, \dots)
}
\arguments{
  \item{x}{an R object containing atomic coordinates.}
  \item{p1}{a numeric vector of length 3 containing the coordinates of the first point defining the reflexion plan. Can also be a 3x3 matrix or data.frame containing by row \code{p1}, \code{p2} and \code{p3}.}
  \item{p2}{a numeric vector of length 3 containing the coordinates of the second point defining the reflexion plan.}
  \item{p3}{a numeric vector of length 3 containing the coordinates of the thrid point defining the reflexion plan.}
  \item{mask}{a logical vector indicating the set of coordinates to which to apply the reflexion.}
  \item{cryst1}{an object of class \sQuote{cryst1} use to convert fractional into Cartesian coordinates when need.}
  \item{\dots}{further arguments passed to or from other methods.}
}
\details{
\code{mirror} is generic functions. Method for objects of class \sQuote{coords} first convert the coordinates into Cartesian coordinates using \code{cryst1} if needed. Once reflected, the coordinates are reconverted back to the orginal basis set using again \code{cryst1}. Method for objects of class \sQuote{pdb} first extract coordinates from the object using the function \code{coords}, perform the reflection, and update the coordinates of the \sQuote{pdb} object using the function \code{coords<-}.
}
\value{An object of the same class as \code{x} with reflected coordinates.}

\seealso{
Helper functions for reflection with respect to a given Cartesian plan or a plan defined by two lattice vectors:\cr
\code{\link{Mxy}}, \code{\link{Myz}}, \code{\link{Mzx}}, \code{\link{Mab}}, \code{\link{Mbc}}, \code{\link{Mca}}\cr
Passing from Cartesian to fractional coordinates (or Vis Versa):\cr
\code{\link{xyz2abc}}, \code{\link{abc2xyz}}
}
\examples{
# First lets read a pdb file
x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
cell <- cell.coords(x)
visualize(x, mode = NULL)
# Mirror operation with respect to the ab-plan
visualize(mirror(x, rep(0,3), p1=cell[,"a"], p2=cell[,"b"]), mode = NULL)
# Mirror operation with respect to the ab-plan for residue 1
visualize(mirror(x, rep(0,3), p1=cell[,"a"], p2=cell[,"b"], mask=x$atoms$resid==1), mode = NULL)
}
\keyword{ manip }
