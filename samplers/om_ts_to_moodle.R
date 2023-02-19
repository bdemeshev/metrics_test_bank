# install.packages("exams", repos="http://R-Forge.R-project.org")
# devtools::install_github("bdemeshev/rexamsconverter")

library(tidyverse)
library(rio)

library(exams)
# library(rexamsconverter)

end_name = 'test_05' # 'test_01', 'train_02' etc

files_df = tibble(filename = list.files('../base/om_ts_2022_spring/',
                                        pattern = end_name, full.names = TRUE, recursive = TRUE))

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
res = exams2moodle(files_df$filename,
                   dir = '../snapshots/',
                   name = paste0('om_ts_', end_name),
                   mchoice = list(shuffle = TRUE, enumerate = FALSE),
                   schoice = list(shuffle = TRUE, enumerate = FALSE,
            eval = list(negative = 0, partial = TRUE, rule = 'none')))

