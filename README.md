
# whatamesh

Tools to Work with ASCII MeSH Files

## Description

Tools to Work with ASCII MeSH
    Files

Ref:

  - <ftp://nlmpubs.nlm.nih.gov/online/mesh/MESH_FILES/asciimesh/>
  - <https://stackoverflow.com/questions/52814022/how-to-split-txt-file-at-specific-location-and-import-each-part-as-table-in-r/52815428?noredirect=1#comment92554994_52815428>

## What’s Inside The Tin

The following functions are implemented:

  - `list_mesh_files`: List ASCII MeSH Files Available For Download
  - `read_mesh_file`: Download and parse an ASCII MeSH File

## Installation

``` r
devtools::install_github("hrbrmstr/whatamesh")
```

## Usage

``` r
library(whatamesh)

# current verison
packageVersion("whatamesh")
```

    ## [1] '0.1.0'

### List Remote MeSH Files

``` r
list_mesh_files()
```

    ## # A tibble: 3 x 3
    ##   `Size (Bytes)` `Last Modified` File     
    ##   <chr>          <chr>           <chr>    
    ## 1 98499407       Oct 15 04:38    c2018.bin
    ## 2 29052512       Jul 16 04:31    d2018.bin
    ## 3 85614          Jul 16 04:30    q2018.bin

### Read & Parse a MeSH File

If the string passed in matches a local filename it will be read in
locally, otherwise it will be downloaded. NOTE: large files take a
while.

Nested:

``` r
read_mesh_file("q2018.bin")
```

    ## # A tibble: 79 x 16
    ##    RECTYPE SH                       QE    QA    QT    MS    AN    HN    QX    DA    MR    DQ    UI    OL    TN    QS   
    ##    <chr>   <chr>                    <chr> <chr> <chr> <chr> <chr> <chr> <lis> <chr> <chr> <chr> <chr> <chr> <lis> <chr>
    ##  1 Q       diagnostic imaging       DIAG… DG    1     Used… subh… 2017… <chr… 2016… 2016… 2017… Q000… <NA>  <NUL… <NA> 
    ##  2 Q       abnormalities            ABNO… AB    1     Used… subh… 66; … <chr… 1973… 2015… 1966… Q000… sear… <chr… <NA> 
    ##  3 Q       administration & dosage  ADMIN AD    1     Used… "sub… 66; … <chr… 1973… 2017… 1966… Q000… sear… <chr… ADMI…
    ##  4 Q       adverse effects          ADV … AE    1     Used… subh… 66; … <chr… 1973… 2017… 1966… Q000… sear… <chr… <NA> 
    ##  5 Q       analogs & derivatives    ANAL… AA    1     Used… subh… 75; … <chr… 1974… 2017… 1975… Q000… sear… <chr… <NA> 
    ##  6 Q       analysis                 ANAL  AN    1     "Use… "sub… 67; … <chr… 1973… 2003… 1967… Q000… sear… <chr… <NA> 
    ##  7 Q       anatomy & histology      ANAT  AH    1     Used… subh… 66; … <chr… 1973… 2017… 1966… Q000… sear… <chr… ANAT…
    ##  8 Q       antagonists & inhibitors ANTAG AI    1     Used… subh… 68; … <chr… 1973… 2017… 1968… Q000… sear… <chr… <NA> 
    ##  9 Q       biosynthesis             BIOS… BI    1     Used… "sub… 66; … <chr… 1973… 2003… 1966… Q000… sear… <chr… <NA> 
    ## 10 Q       blood                    BLOOD BL    1     "Use… "sub… 67; … <NUL… 1973… 2003… 1967… Q000… sear… <chr… <NA> 
    ## # ... with 69 more rows

Wide:

``` r
read_mesh_file("q2018.bin", wide = TRUE)
```

    ## # A tibble: 79 x 108
    ##    RECTYPE SH     QE    QA    QT    MS    AN    HN    QX    QX.1  QX.2  QX.3  QX.4  QX.5  QX.6  QX.7  QX.8  QX.9  QX.10
    ##    <chr>   <chr>  <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr>
    ##  1 Q       diagn… DIAG… DG    1     Used… subh… 2017… X-ra… X-ra… X-ra… echo… echo… radi… radi… radi… roen… ultr… ultr…
    ##  2 Q       abnor… ABNO… AB    1     Used… subh… 66; … agen… anom… apla… atre… birt… cong… defe… defo… hypo… malf… <NA> 
    ##  3 Q       admin… ADMIN AD    1     Used… "sub… 66; … admi… <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA> 
    ##  4 Q       adver… ADV … AE    1     Used… subh… 66; … side… <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA> 
    ##  5 Q       analo… ANAL… AA    1     Used… subh… 75; … anal… deri… <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA> 
    ##  6 Q       analy… ANAL  AN    1     "Use… "sub… 67; … assa… chem… dete… <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA> 
    ##  7 Q       anato… ANAT  AH    1     Used… subh… 66; … anat… anat… hist… morp… <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA> 
    ##  8 Q       antag… ANTAG AI    1     Used… subh… 68; … anta… anta… inhi… <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA> 
    ##  9 Q       biosy… BIOS… BI    1     Used… "sub… 66; … anab… biof… <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA> 
    ## 10 Q       blood  BLOOD BL    1     "Use… "sub… 67; … <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA> 
    ## # ... with 69 more rows, and 89 more variables: QX.11 <chr>, DA <chr>, MR <chr>, DQ <chr>, UI <chr>, OL <chr>,
    ## #   TN <chr>, TN.1 <chr>, TN.2 <chr>, TN.3 <chr>, TN.4 <chr>, TN.5 <chr>, TN.6 <chr>, TN.7 <chr>, TN.8 <chr>,
    ## #   TN.9 <chr>, TN.10 <chr>, TN.11 <chr>, TN.12 <chr>, QS <chr>, TN.13 <chr>, TN.14 <chr>, TN.15 <chr>, TN.16 <chr>,
    ## #   TN.17 <chr>, TN.18 <chr>, TN.19 <chr>, TN.20 <chr>, TN.21 <chr>, TN.22 <chr>, TN.23 <chr>, TN.24 <chr>,
    ## #   TN.25 <chr>, TN.26 <chr>, TN.27 <chr>, TN.28 <chr>, TN.29 <chr>, TN.30 <chr>, TN.31 <chr>, TN.32 <chr>,
    ## #   TN.33 <chr>, TN.34 <chr>, TN.35 <chr>, TN.36 <chr>, TN.37 <chr>, TN.38 <chr>, TN.39 <chr>, TN.40 <chr>,
    ## #   TN.41 <chr>, TN.42 <chr>, TN.43 <chr>, TN.44 <chr>, TN.45 <chr>, TN.46 <chr>, TN.47 <chr>, TN.48 <chr>,
    ## #   TN.49 <chr>, TN.50 <chr>, TN.51 <chr>, TN.52 <chr>, TN.53 <chr>, TN.54 <chr>, TN.55 <chr>, TN.56 <chr>,
    ## #   TN.57 <chr>, TN.58 <chr>, TN.59 <chr>, TN.60 <chr>, TN.61 <chr>, TN.62 <chr>, TN.63 <chr>, TN.64 <chr>,
    ## #   TN.65 <chr>, TN.66 <chr>, TN.67 <chr>, TN.68 <chr>, TN.69 <chr>, TN.70 <chr>, TN.71 <chr>, TN.72 <chr>,
    ## #   TN.73 <chr>, TN.74 <chr>, TN.75 <chr>, TN.76 <chr>, TN.77 <chr>, TN.78 <chr>, QX.12 <chr>, QX.13 <chr>, QX.14 <chr>
