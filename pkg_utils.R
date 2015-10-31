detach_package <- function(pkg, character.only = FALSE)
{
  if(!character.only)
  {
    pkg <- deparse(substitute(pkg))
  }
  search_item <- paste("package", pkg, sep = ":")
  while(search_item %in% search())
  {
    detach(search_item, unload = TRUE, character.only = TRUE)
  }
}

handle_package <- function(x) {
  a <- require(x, character.only = TRUE)
  if(!a) {
    install.packages(x)
    require(x, character.only = TRUE)
  }
}

# load dependencies
load_dependencies <- function(pkg_list = NULL) {

  pkg <- c("ggplot2","dplyr","R.utils","fdrtool","caret","randomForest","pROC", 
           "readr", "stringr", "corrgram", "corrplot", "aod", "rvest", "ggfortify",
           "zoo", "reshape2", "jsonlite", "devtools", "scales", "forecast", 
           "wesanderson", "RColorBrewer", "read_r", "readxl", pkg_list)
  
  lapply(pkg, handle_package)

}

