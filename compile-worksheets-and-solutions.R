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

#### Render questions and solutions function

render_qands <- function(dir, rmd_file, out_file, knitr_params){
  
  sols_file_name <- paste0("solutions-", out_file)
  
  withr::with_dir(
    new = dir,
    code =  {
            
        rmarkdown::render(input = file_name,
                          output_file = out_file,
                          params = c(knitr_params, show_solutions = F)
        )
        
        # knit worksheet answers
        rmarkdown::render(input = file_name,
                          output_file = sols_file_name,
                          params = c(knitr_params, show_solutions = T)
        )
        
      }
  )
  
  
}

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
  out_name <- paste0(ws_file_prefix, worksheet_number,".pdf")
  ws_dir <- here::here(upper_dir)
  
  # render questions and solutions (temporarily change working directory)
  render_qands(dir = ws_dir, 
               rmd_file = file_name, 
               out_file = out_name, 
               knitr_params = knitr_params
              )
    
    
####
  
  
#### Compile all files ####
  
  worksheet_numbers <- paste0("0",1:2)
  
  for(ws_num in worksheet_numbers){
    
    upper_dir <- paste0("ws",ws_num)
    file_name <- paste0(ws_file_prefix, ws_num, ".Rmd")
    out_name <- paste0(ws_file_prefix, ws_num,".pdf")
    ws_dir <- here::here(upper_dir)
    
    render_qands(dir = ws_dir, 
                 rmd_file = file_name, 
                 out_file = out_name, 
                 knitr_params = knitr_params
    )
    
  }
  
####