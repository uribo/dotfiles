#########################################
# Last update: 2015-04-27
#########################################
if (capabilities("aqua")) {
    options(device = "quartz")
}
setHook(packageEvent("grDevices", "onLoad"),
    function(...) {
        if (.Platform$OS.type == "windows")
            grDevices::windowsFonts(sans  = "MS Gothic",
                                    serif = "MS Mincho",
                                    mono  = "FixedFont")
        if (capabilities("aqua"))
            grDevices::quartzFonts(
              sans = grDevices::quartzFont(
                c("Hiragino Kaku Gothic Pro W3",
                  "Hiragino Kaku Gothic Pro W6",
                  "Hiragino Kaku Gothic Pro W3",
                  "Hiragino Kaku Gothic Pro W6")),
              serif = grDevices::quartzFont(
                c("Hiragino Mincho Pro W3",
                  "Hiragino Mincho Pro W6",
                  "Hiragino Mincho Pro W3",
                  "Hiragino Mincho Pro W6")))
        # if (capabilities("X11"))
        #     grDevices::X11.options(
        #         fonts=c("-kochi-gothic-%s-%s-*-*-%d-*-*-*-*-*-*-*",
        #                 "-adobe-symbol-medium-r-*-*-%d-*-*-*-*-*-*-*"))
        grDevices::pdf.options(family = "Japan1GothicBBB")
        grDevices::ps.options(family  = "Japan1GothicBBB")
    }
)
attach(NULL, name = "JapanEnv")
assign("familyset_hook",
       function() {
            winfontdevs=c("windows", "win.metafile", "png", 
                          "bmp", "jpeg", "tiff", "RStudioGD")
            macfontdevs=c("quartz", "quartz_off_screen", "RStudioGD")
            devname=strsplit(names(dev.cur()), ":")[[1L]][1]
            if ((.Platform$OS.type == "windows") &&
                (devname %in% winfontdevs))
                    par(family = "sans")
            if (capabilities("aqua") &&
                devname %in% macfontdevs)
                    par(family = "sans")
       },
       pos = "JapanEnv")
setHook("plot.new", get("familyset_hook", pos = "JapanEnv"))
setHook("persp", get("familyset_hook", pos = "JapanEnv"))

# latticeの日本語表示
# http://d.hatena.ne.jp/kiwamu_i/20100808/
setHook(packageEvent("lattice", "attach"),
        function(...) {
            lattice.options(default.args = list(as.table = TRUE))
            my.pdf.theme <- standard.theme("pdf", color = TRUE)
            my.pdf.theme$grid.pars <- list(fontfamily = "sans")
            my.pdf.theme$axis.text$fontfamily <- "sans"
            my.pdf.theme$axis.text$cex <- 1
            my.quartz.theme <- standard.theme("quartz", color = FALSE)
            my.quartz.theme$grid.pars <- list(fontfamily = "sans")
            my.quartz.theme$axis.text$fontfamily <- "sans"
            my.quartz.theme$axis.text$cex <- 1
            lattice.options(default.theme =
                function() {
                    switch(EXPR = .Device,
                           pdf  = my.pdf.theme,
                           my.quartz.theme)
                })
            })

#########################################
options(download.file.method = "libcurl")
local({
   r <- getOption("repos");
   r["CRAN"] <- "https://cran.rstudio.com/"
   options(repos=r)
})

.First <- function() {

  # options
  options(browserNLdisabled     = TRUE,
          deparse.max.lines     = 2, 
          show.signif.stars     = FALSE, # Don't show significant star
          scipen                = 10,
          error                 = suppressPackageStartupMessages(DYM::DYM),
          knitr.duplicate.label = "allow",
          github.user           = "uribo", 
          shiny.reactlog        = TRUE,
          devtools.name         = "Shinya Uryu",
          devtools.desc.author  = "Shinya Uryu <suika1127@gmail.com> [aut, cre]",
          devtools.desc.license = "MIT + file LICENSE")
  # load packages
  suppressMessages(library(knitr))
  suppressMessages(library(stringr))
  suppressMessages(library(magrittr))
  suppressMessages(library(ggplot2))
  suppressMessages(library(devtools))
  suppressMessages(library(rmarkdown))
  suppressMessages(library(ggvis))
  suppressMessages(library(dplyr))
  suppressMessages(library(tidyr))
  suppressMessages(library(readxl))
  suppressMessages(library(Rgitbook)) # devtools::install_github("uribo/Rgitbook")
  suppressMessages(library(slackr))
  # Hello world!
  cowsay::say(date(), by = "signbunny")
}

## message converted Japanes to English for Mac OS X
Sys.setenv("LANGUAGE" = "En")
## 
Sys.setenv(RSTUDIO_PDFLATEX = "/usr/texbin/lualatex") # windowsなら変更

if (interactive()) {
  suppressMessages(require(devtools))
}
