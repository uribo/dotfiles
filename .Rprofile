#########################################
# Last update: 2013-11-13
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

.First <- function() {
     cat(R.version.string, "\n")
     cat(date(), "\n")
     cat(getwd(), "\n\n")
## Load packages
     library(vegan)
     library(lattice)
     library(MASS)
     library(glmmML)
     library(ggplot2)
     library(popbio)
}

## Don't show significsant stars
  options(show.signif.stars=F)
