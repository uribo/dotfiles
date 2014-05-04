#########################################
# Last update: 2014-05-04
#########################################
if (.Platform$pkgType == "mac.binary.leopard"){
        options(device="quartz")
}

setHook(packageEvent("grDevices", "onLoad"),function(...) grDevices::pdf.options(family="Japan1"))
setHook(packageEvent("grDevices", "onLoad"),function(...) grDevices::ps.options(family="Japan1"))
setHook(packageEvent("grDevices", "onLoad"),
        function(...){
            grDevices::quartzFonts(serif=grDevices::quartzFont(
                c("Hiragino Mincho Pro W3",
                  "Hiragino Mincho Pro W6",
                  "Hiragino Mincho Pro W3",
                  "Hiragino Mincho Pro W6")))
            grDevices::quartzFonts(sans=grDevices::quartzFont(
                c("Hiragino Kaku Gothic Pro W3",
                  "Hiragino Kaku Gothic Pro W6",
                  "Hiragino Kaku Gothic Pro W3",
                  "Hiragino Kaku Gothic Pro W6")))
        }
)
attach(NULL, name = "MacJapanEnv")

assign("familyset_hook",
       function() { if(names(dev.cur())=="quartz") par(family="serif")},
       pos="MacJapanEnv")
setHook("plot.new", get("familyset_hook", pos="MacJapanEnv"))

grDevices::X11.options(fonts=c("-ipagothic-gothic-%s-%s-normal--%d-*-*-*-*-*-*-*","-adobe-symbol-medium-r-*-*-%d-*-*-*-*-*-*-*"))

## message converted Japanes to English for Mac OS X
  Sys.setenv("LANGUAGE"="En")

.First <- function() {
     cat(R.version.string, "\n")
     cat(date(), "\n")
     cat(getwd(), "\n\n")
## fortunes
   tmp <- suppressWarnings(require("fortunes", quietly=TRUE))
   if(tmp) {
   	   print(fortunes::fortune())
   }
## Load packages
  suppressMessages(library(knitr))
  suppressMessages(library(vegan))
  suppressMessages(library(lattice))
  suppressMessages(library(MASS))
  suppressMessages(library(glmmML))
  suppressMessages(library(ggplot2))
  suppressMessages(library(popbio))
  suppressMessages(library(devtools)) 
}

## Don't show significsant stars
  options(show.signif.stars=F)