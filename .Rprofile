#########################################
# Last update: 2016-01-24
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
local({
   r <- getOption("repos");
   r["CRAN"] <- "https://cran.rstudio.com/"
   options(repos = r)
})

.First <- function() {

  # options
  options(browserNLdisabled     = TRUE,
          deparse.max.lines     = 2, 
          download.file.method  = "libcurl",
          show.signif.stars     = FALSE, # Don't show significant star
          scipen                = 10,
          error                 = suppressPackageStartupMessages(DYM::DYM),
          knitr.duplicate.label = "allow",
          github.user           = "uribo", 
          shiny.reactlog        = TRUE,
          devtools.name         = "Shinya Uryu",
          devtools.desc.author  = 'c(person(given = "Shinya", family = "Uryu", 
                                            email = "suika1127@gmail.com", 
                                            role  = c("aut", "cre")))',
          devtools.desc.license = "MIT + file LICENSE")
  # load packages
  suppressMessages(library(knitr))
  suppressMessages(library(magrittr))
  suppressMessages(library(ggplot2))
  suppressMessages(library(remoji))
  suppressMessages(library(git2r))
  # Hello world!
  cowsay::say(date(), by = "signbunny")
}

## message converted Japanese to English for Mac OS X
Sys.setenv("LANGUAGE" = "En")
## 
Sys.setenv(RSTUDIO_PDFLATEX = "/usr/texbin/lualatex") # windowsなら変更

if (interactive()) {
  suppressMessages(require(devtools))
}
