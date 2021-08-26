# install.packages("exams", repos="http://R-Forge.R-project.org")
# devtools::install_github("bdemeshev/rexamsconverter")

library(tidyverse)
library(rio)

library(exams)
# library(rexamsconverter)

files_df = tibble(filename = list.files('../base/2017_kr_01/', pattern = "*.Rmd", full.names = TRUE, recursive = TRUE))

files_df

# res = exams2pdf_source(files_df$filename, date = "2021-xx-yy",
#                       add_seed = 12378,
#                 n_vars = 1, title = "Подборочка",
#                 institution = "Поехали :)", nops = FALSE, shuffle = TRUE,
#                 template = "plain_no_sweave.tex",
#                 header = "\\input{../header.tex}",
#                 output_dir = "output/")


# to canvas!
# res = exams2canvas(files_df$filename)

# to moodle!
res = exams2moodle(files_df$filename, dir = 'output/sample_a')
