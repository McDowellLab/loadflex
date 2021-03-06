% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/loadModelInterface.R
\name{predictSolute}
\alias{predictSolute}
\title{Make flux or concentration predictions from a load model.}
\usage{
predictSolute(load.model, flux.or.conc = c("flux", "conc"), newdata,
  interval = c("none", "confidence", "prediction"), level = 0.95,
  lin.or.log = c("linear", "log"), se.fit = FALSE, se.pred = FALSE,
  date = FALSE, attach.units = FALSE, agg.by = c("unit", "day", "month",
  "water year", "calendar year", "total", "mean water year",
  "mean calendar year", "[custom]"), ...)
}
\arguments{
\item{load.model}{A load model object, typically inheriting from loadModel 
and always implementing the loadModelInterface.}

\item{flux.or.conc}{character. Should the predictions be reported as flux 
rates or concentrations?}

\item{newdata}{An optional data.frame of predictor observations. The column 
names in this data.frame must match those specified in the load model's 
metadata.}

\item{interval}{character. One of "none", "confidence" or "prediction". If 
"confidence" or "prediction", the interval bounds will be returned in 
columns named "lwr" and "upr". Confidence intervals describe confidence in 
the model prediction for the mean value given a set of predictors, whereas 
prediction bounds describe the expected distribution of observations at 
that prediction point.}

\item{level}{numeric. Fraction of density distribution to include within 
confidence or prediction interval}

\item{lin.or.log}{character. Either "linear" or "log" to say whether the
predictions should be converted to log space or not. If converted to log
space, a bias correction will be applied, see \code{\link{linToLog}}.}

\item{se.fit}{logical. If TRUE, the output data.frame will include a column 
named "se.fit" describing the standard error of the model fit for each row 
of predictors.}

\item{se.pred}{logical. If TRUE, the output data.frame will include a column 
named "se.pred" describing the standard error of the prediction for each 
row of predictors. The values in the se.pred column will be larger than 
those in the se.fit column, because the se.pred values are standard errors 
of prediction (SEPs) and take into account not only the parameter 
uncertainty associated with the model coefficients (also covered by 
se.fit), but also the random error associated with any given observation 
(the epsilon term in a typical regression model).}

\item{date}{logical. If TRUE, the output data.frame will include a column 
named "date" containing the dates of the predictions.}

\item{attach.units}{logical. Should the units be attached to columns in the 
resulting data.frame?}

\item{agg.by}{character Time period to aggregate results by.}

\item{...}{Additional arguments passed to class-specific implementations of 
the \code{predictSolute} generic function.}
}
\value{
If interval=="none" and both se.fit and se.pred are FALSE, a vector 
  of predictions. Otherwise, a data.frame with a column called "fit" 
  containing the predictions for the solute. Values associated with interval,
  se.fit, and se.pred are additional columns with names noted in those 
  argument descriptions.
}
\description{
A function in the loadModelInterface. Uses a load model and a predictor 
dataset (which may differ from the original model-fitting dataset) to make 
predictions for loads or concentrations at the time points in the new 
dataset.
}
\details{
This is the S3 generic predictSolute(), for which specific methods should be 
implemented for each load model class (e.g., \code{\link{loadModel}}. Unlike 
rloadest::predLoad() and predConc(), and more like most other predict 
functions in R, this function makes no attempt to aggregate the results.
}
\seealso{
Other loadModelInterface: \code{\link{estimateMSE}},
  \code{\link{getFittedModel}},
  \code{\link{getFittingData}},
  \code{\link{getFittingFunction}},
  \code{\link{getMetadata}}, \code{\link{simulateSolute}},
  \code{\link{summarizeModel}},
  \code{\link{validLoadModelInterface}}

Other predictSolute: \code{\link{predictSolute.loadComp}},
  \code{\link{predictSolute.loadInterp}},
  \code{\link{predictSolute.loadLm}},
  \code{\link{predictSolute.loadModel}},
  \code{\link{predictSolute.loadReg2}}
}
