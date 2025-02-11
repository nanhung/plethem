% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/performReverseDosimetry.R
\name{runReverseDosimetry}
\alias{runReverseDosimetry}
\title{Estimate exposure from montecarlo results and biomonitoring data}
\usage{
runReverseDosimetry(
  mcData,
  biomData,
  percentiles = c(5, 10, 25, 50, 75, 95, 99, 100),
  dose_list = NULL
)
}
\arguments{
\item{mcData}{M by N data frame where M is the the individual exposures at which the PBPK model is run and N is the number of monte carlo runs at each exposure. It is recommended that M is between 25 and 40 and N is greater than 1000.}

\item{biomData}{List consisting of biomonitoring data. It is recommended that atleast 1000 biomonitering values be provided to ensure accuracy for results.}

\item{percentiles}{Vector of percentiles for which exposure needs to be estimated. By default returns the 5th, 50th, 95th and 99th exposure estimate.}

\item{dose_list}{A list of M elements that contain exposures at which monte carlo simulations were run. If no list is provided, the first column names of the mcData input are assumed to contain exposure values.}
}
\value{
List of values related to reverse dosimetry
\describe{
\item{cdf}{Cumulative Distribution function of the exposure estimate}
\item{pdf}{Probability distribution function of the exposure estimate}
\item{percentiles}{Data frame of percentiles and exposure estimates for the percentile}

}
}
\description{
The function estimates exposures for the observed biomonitoring data using montecarlo simulation results over a large range of exposures.
The montecarlo results are obtained from a PBPK model. The biomonitoring results are obtained from a population level study.
The montecarlo results and biomonitoring data should have the same units and should be for the same physiological data source (eg: metabolite concentration in the urine).
}
\examples{
\dontrun{
runReverseDosimetry(mcData,biomData,percentiles = c(5,50,95))
runReverseDosimetry(mcData,biomData,percentiles = c(50,95),dose_list = c(0.04,0.10,0.15,0.2,0.25,1))
}
}
