% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/evaluate_py.R
\name{evaluate_py}
\alias{evaluate_py}
\title{run evaluation via python scripts}
\usage{
evaluate_py(test, reference, metric = "accuracy", task = "detection",
  prefix = NULL, check_python = FALSE, set_ident_flag = FALSE)
}
\arguments{
\item{test}{character, path to test file (must be .rttm)}

\item{reference}{character, path to reference file (must be .rttm)}

\item{metric}{character, the metric to be calculated}

\item{task}{character, the task}

\item{prefix}{character, the file prefix for the \code{test} file (the default option \code{NULL} tries to guess it from the file name)}

\item{check_python}{logical, test whether python is working}

\item{set_ident_flag}{logical, should the '--identification' flag be set for the call to the python script}
}
\value{
numeric vector
}
\description{
run evaluation via python scripts
}
\examples{
\dontrun{
# get file paths to two SAD files
sad1 <- system.file("tocomboSad_spanish.rttm", package = "avutils")
sad2 <- system.file("yunitator_english_spanish.rttm", package = "avutils")
# create rttm file from ELAN and copy to temp folder
tdir <- tempdir()
elanfile <- system.file("spanish.eaf", package = "avutils")
dest1 <- elan2rttm(x = elanfile, outpath = tdir, use_py = FALSE)
file.exists(dest1)
evaluate_py(test = sad1, reference = dest1, metric = "accuracy", task = "detection")
evaluate_py(test = sad2, reference = dest1, metric = "accuracy", task = "detection")
dest2 <- elan2rttm(x = elanfile, outpath = tdir, use_py = TRUE)
file.exists(dest2)
evaluate_py(test = sad1, reference = dest2, metric = "accuracy", task = "detection")
evaluate_py(test = sad2, reference = dest2, metric = "accuracy", task = "detection")
}

}