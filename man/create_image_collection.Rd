% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/image_collection.R
\name{create_image_collection}
\alias{create_image_collection}
\title{Create an image collection from a set of GDAL datasets or files}
\usage{
create_image_collection(files, format, out_file = tempfile(fileext =
  ".sqlite"), unroll_archives = TRUE, quiet = FALSE)
}
\arguments{
\item{files}{character vector with paths to image files on disk or any GDAL dataset identifiers (including virtual file systems and higher level drivers or GDAL subdatasets)}

\item{format}{collection format, can be either a name to use predefined formats (as output from \code{\link{collection_formats}}) or a path to a custom JSON format description file}

\item{out_file}{optional name of the output SQLite database file, defaults to a temporary file}

\item{unroll_archives}{automatically convert .zip, .tar archives and .gz compressed files to GDAL virtual file system dataset identifiers (e.g. by prepending /vsizip/) and add contained files to the list of considered files}

\item{quiet}{logical; if TRUE, do not print resulting image collection if return value is not assigned to a variable}
}
\value{
image collection proxy object, which can be used to create a data cube using \code{\link{raster_cube}}
}
\description{
This function iterates over files or GDAL dataset identifiers and extracts datetime, image identifiers, and band information according to a given
collection format.
}
\details{
An image collection is a simple SQLite database file that indexes and references existing image files / GDAL dataset identifiers.
}
\examples{
# create image collection from example Landsat data only 
# if not already done in other examples
if (!file.exists(file.path(tempdir(), "L8.db"))) {
  L8_files <- list.files(system.file("L8NY18", package = "gdalcubes"),
                         ".TIF", recursive = TRUE, full.names = TRUE)
  create_image_collection(L8_files, "L8_L1TP", file.path(tempdir(), "L8.db")) 
}
}
