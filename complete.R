complete <- function(directory, id = 1:332) {
      ## 'directory' is a character vector of length 1 indicating
      ## the location of the CSV files

      file_lst3 <- list.files(path=directory)
      my_out_nm <- c("id","nobs")
      my_out_df <- as.data.frame(setNames(replicate(2,numeric(0),simplify=F), my_out_nm))

      for (i in id){

            Y1 <- read.csv(paste(directory,file_lst3[i],sep="/"))

            my_out_df <- rbind(my_out_df,c(i,sum(complete.cases(Y1))))
      }
      ##      subset_na_only <- subset(Y1,is.na(sulfate)& is.na(nitrate))
      ##      subset_rows <- nrow(subset_na_only)
      ##      nobs_rows <- nrow(Y1)-subset_rows
      my_out_final <- as.data.frame(setNames(my_out_df,my_out_nm))
      print(my_out_final)
      ## 'id' is an integer vector indicating the monitor ID numbers
      ## to be used

      ## Return a data frame of the form:
      ## id nobs
      ## 1  117
      ## 2  1041
      ## ...
      ## where 'id' is the monitor ID number and 'nobs' is the
      ## number of complete cases
}