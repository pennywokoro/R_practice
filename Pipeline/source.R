
#Source script

library(ggplot2)
library(plyr)
library(stringr)

outlierreplace = function(df, c, rowpredicate, replaceVal = NA) {
  naCount1 <- sum(is.na(df[, c]))
  df[, c] <- replace(df[, c], rowpredicate, replaceVal)
  naCount2 <- sum(is.na(df[, c]))
  print(str_c(naCount2 - naCount1, " outliers replaced for field: ", c))
  df
  
}

bool_proportion = function(numerator_TF, denominator_TF) {
  if (is.null(numerator_TF) | is.null(denominator_TF)) {
    print("bool_proportion called on empty column")
    NA
  } else {
    if (class(numerator_TF) == "character") {
      if (length(c(which(str_detect(numerator_TF, ignore.case("yes|no|true|false"))), 
                   which(is.na(numerator_TF))))/length(numerator_TF) > 0.4) {
        numerator_TF <- as.logical(recodeVar(tolower(numerator_TF), 
                                             src = list(c("yes", "true"), c("no", "false")), tgt = list(TRUE, 
                                                                                                        FALSE), default = NA, keep.na = T))
      } else {
        warning("Cannot recode Boolean value, check the data first!")
      }
    } else if (class(denominator_TF) == "character") {
      if (length(c(which(str_detect(denominator_TF, ignore.case("yes|no|true|false"))), 
                   which(is.na(denominator_TF))))/length(denominator_TF) > 0.4) {
        denominator_TF <- as.logical(recodeVar(tolower(denominator_TF), 
                                               src = list(c("yes", "true"), c("no", "false")), tgt = list(TRUE, 
                                                                                                          FALSE), default = NA, keep.na = T))
      } else {
        warning("Cannot recode Boolean value, check the data first!")
      }
    }
    df <- data.frame(cbind(num = numerator_TF, den = denominator_TF))
    df <- na.omit(df)
    sum(df$num & df$den)/sum(df$den)
  }
}




lgas_data <- read.csv("C:/Users/OHCSF.ICTD-015/Desktop/Nigeria_R_Training-master/Nigeria_R_Training-master/Training Pipeline/Pipeline/lgas.csv", stringsAsFactors = FALSE)
  