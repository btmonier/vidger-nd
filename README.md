ViDGER-nd <img src="vignettes/vidger-logo.png" align="right" />
==================================================

[![Build Status](https://travis-ci.org/btmonier/vidger-nd.svg?branch=master)](https://travis-ci.org/btmonier/vidger-nd)


Overview
--------
**Vi**sualization of **D**ifferential **G**ene **E**xpression using **R**

**Note:** this is the **non-developmental** version of ViDGER. This version 
of ViDGER requires you to have an R version `>= 3.4`.


Installation
------------
The easiest way to obtain this package is to install `devtools` and pull the package contents directly from GitHub.

``` r
if (!require("devtools")) install.packages("devtools")
devtools::install_github("btmonier/vidger-nd")
```


New Functions
-------------
* `vsScatterPlot()`
* `vsScatterMatrix()`
* `vsBoxplot()`
* `vsDEGMatrix()`
* `vsVolcano()`
* `vsVolcanoMatrix()`
* `vsMAPlot()`
* `vsMAMatrix()`
* `vsFourWay()`


Package Dependencies
--------------------
This package requires a few additional packages to work properly. Make sure the following packages are installed and loaded into your `R` directory. The current version of the package automatically installs and loads these if not found in your `R` directory:

* `ggplot2` for main visualizations
* `dplyr` for data munging
* `tidyr` for additional data munging
* `GGally` for matrix visualizations


Loading test data
-----------------
I have loaded three objects from three seperate analysis types:

* `df.cuff` A `cuffdiff` output file.
* `df.deseq` A `DESeq2` object class.
* `df.edger` An `edgeR` object class.

To load these data sets, use the following command:

``` r
data("<object-type>")
```
...where `<object-type>` is one of the previously mentioned data sets.


Getting help
------------
For additional information on these functions, please see the given documentation in the `vidger` package by adding the `?` help operator before any of the given functions in this package or by using the `help()` function. 
