% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vsFourWay.R
\name{vsFourWay}
\alias{vsFourWay}
\title{Four-Way plot for comparison of log fold changes in a multiple factor RNA
 seq
experiment from different analytical objects}
\usage{
vsFourWay(x, y, control, data, d.factor = NULL, type = c("cuffdiff",
  "deseq", "edger"), padj = 0.05, x.lim = NULL, y.lim = NULL,
  lfc = NULL, legend = TRUE, title = TRUE, grid = TRUE,
  data.return = FALSE)
}
\arguments{
\item{x}{treatment `x` for comparison (log2(x/control)). This will be a
factor level in your data.}

\item{y}{treatment `y` for comparison (log2(y/control)). This will be a 
factor level in your data.}

\item{control}{`control` treatment for comparisons of the x and y axes. This
will be a factor level in your data.}

\item{data}{output generated from calling the main routines of either
`cuffdiff`, `DESeq2`, or `edgeR` analyses. For `cuffdiff`, this will be a 
`*_exp.diff` file. For `DESeq2`, this will be a generated object of class 
`DESeqDataSet`. For `edgeR`, this will be a generated object of class 
`DGEList`.}

\item{d.factor}{a specified factor; for use with `DESeq2` objects only.
This input equates to the first parameter for the contrast argument when 
invoking the `results()` function in `DESeq2`. Defaults to `NULL`.}

\item{type}{an analysis classifier to tell the function how to process the 
data. Must be either `cuffdiff`, `deseq`, or `edger`. `cuffdiff` must be 
used with `cuffdiff` data; `deseq` must be used for `DESeq2` output; 
`edgeR` must be used with `edgeR` data. See the `data` parameter for 
further details.}

\item{padj}{a user defined adjusted p-value cutoff point. 
Defaults to `0.05`.}

\item{x.lim}{set manual limits (boundaries) to the x axis. Defaults to 
`NULL`.}

\item{y.lim}{set manual limits (boundaries) to the y axis. Defaults to 
`NULL`.}

\item{lfc}{log fold change level for setting conditonals. If no user input 
is added (`NULL`), value defaults to `1`.}

\item{legend}{display legend of plot. Logical; defaults to `TRUE`.
If set to `FALSE`, no legend will display in plot.}

\item{title}{display the main title of plot. Logical; defaults to `TRUE`.
If set to `FALSE`, no title will display in plot.}

\item{grid}{display major and minor axis lines. Logical; defaults to `TRUE`.
If set to `FALSE`, no axis lines will display in plot.}

\item{data.return}{returns data output of plot Logical; defaults to `FALSE`.
If set to `TRUE`, a data frame will also be called. Assign to object
for reproduction and saving of data frame. See final example for further
details.}
}
\value{
An object created by \code{ggplot}
}
\description{
This function allows you to extract necessary results-based data from a 
DESeq object class to create a .four-way plot to compare log fold changes 
in various treatments using ggplot2 aesthetics.
}
\details{
This function allows the user to extract various elements from a different 
analytical object class which in turn, creates a temporary data frame to 
plot the necessary ggplot aesthetics. In order for this function to work, 
RNA seq experiments must have multiple factors (i.e. two treatments and a 
control) and levels including treatments and controls. By having the 
recommended criteria, this function will extract the necessary data 
dependent on the analysis performed. Data points with 'extreme' values that 
exceed the default viewing frame of the plot will change character classes 
(i.e. points of interest a substantially large log fold change).
}
\examples{
# Cuffdiff example
data("df.cuff")
vsFourWay(
 x = 'hESC', y = 'iPS', control = 'Fibroblasts', data = df.cuff, 
 d.factor = NULL, type = 'cuffdiff', padj = 0.05, x.lim = NULL, 
 y.lim = NULL, lfc = 2, title = TRUE, grid = TRUE, 
 data.return = FALSE
)

# DESeq2 example
data("df.deseq")
vsFourWay(
 x = 'treated_paired.end', y = 'untreated_paired.end', 
 control = 'untreated_single.read', data = df.deseq, 
 d.factor = 'condition', type = 'deseq', padj = 0.05, 
 x.lim = NULL, y.lim = NULL, lfc = 2, title = TRUE, grid = TRUE, 
 data.return = FALSE
)

# edgeR example
data("df.edger")
require(edgeR)
vsFourWay(
 x = 'WM', y = 'WW', control = 'MM', data = df.edger, 
 d.factor = NULL, type = 'edger', padj = 0.05, x.lim = NULL, 
 y.lim = NULL, lfc = 2, title = TRUE, grid = TRUE, 
 data.return = FALSE
)
                
# Extract data frame from visualization
data("df.cuff")
tmp <- vsFourWay(
 x = 'WM', y = 'WW', control = 'MM', data = df.edger, 
 d.factor = NULL, type = 'edger', padj = 0.05, 
 x.lim = NULL, y.lim = NULL, lfc = 2, title = TRUE, 
 grid = TRUE, data.return = TRUE
)
df.four <- tmp[[1]]
head(df.four)
}
\author{
Brandon Monier, \email{brandon.monier@sdstate.edu}
}
