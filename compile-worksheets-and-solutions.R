#################################################################################
# This R script compiles one or all of the worksheets with specific parameters.
# Whilst you can knit the .Rmd documents individually, this code automates the
# process of making a question sheet and answer sheet at the same time with the
# correct naming conventions etc.
#
# Make sure you have the "here" package installed.
# install.packages("here")
#
#################################################################################

#### Params - always run ####

  knitr_params <- list(
    tutor_name = "Chris"
  )
  
  ws_file_prefix <- "mxn601-ws-"

####

#### Compile one file ####

  worksheet_number <- "01"
  
  upper_dir <- paste0("ws",worksheet_number)
  file_name <- paste0(ws_file_prefix, worksheet_number, ".Rmd")
  ws_dir <- here::here(upper_dir)
  
  ws_file_loc <- here::here(
    upper_dir,
    file_name
    )
  
  sols_file_name <- paste0("solutions-", sub(".Rmd", "", file_name), ".pdf")
  
  # knit worksheet questions
  rmarkdown::render(input = ws_file_loc,
                    output_dir = ws_dir,
                    params = c(knitr_params, show_solutions = F) 
                    )
  
  # knit worksheet answers
  rmarkdown::render(input = ws_file_loc, 
                    output_dir = ws_dir,
                    output_file = sols_file_name,
                    params = c(knitr_params, show_solutions = T) 
                    )
  
####
  
  
#### Compile all files ####
  
  worksheet_numbers <- paste0("0",1:2)
  
  for(ws_num in worksheet_numbers){
    
    upper_dir <- paste0("ws",ws_num)
    file_name <- paste0(ws_file_prefix, ws_num, ".Rmd")
    ws_dir <- here::here(upper_dir)
    
    ws_file_loc <- here::here(
      upper_dir,
      file_name
    )
    
    sols_file_name <- paste0("solutions-", sub(".Rmd", "", file_name), ".pdf")
    
    # knit worksheet questions
    rmarkdown::render(input = ws_file_loc,
                      output_dir = ws_dir,
                      params = c(knitr_params, show_solutions = F) 
    )
    
    # knit worksheet answers
    rmarkdown::render(input = ws_file_loc, 
                      output_dir = ws_dir,
                      output_file = sols_file_name,
                      params = c(knitr_params, show_solutions = T) 
    )
    
  }
  
####