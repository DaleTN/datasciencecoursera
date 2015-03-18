pollutantmean <- function(directory, pollutant, id = 1:332) {
      ## 'directory' is a character vector of length 1 indicating
      ## the location of the CSV files

      mean_rawsum <- numeric(0)
      mean_rawcount <- numeric(0)
      file_lst3 <- list.files(path=directory)

      for (i in id){

            Y1 <- read.csv(paste(directory,file_lst3[i],sep="/"))
            raw_data <- Y1[[pollutant,exact=TRUE]]
            mean_rawsum <- c(mean_rawsum,sum(Y1[[pollutant,exact=TRUE]],na.rm=TRUE))
            mean_rawcount <- c(mean_rawcount,NROW(na.omit(raw_data)))
      }

      mean_final2 <- sum(mean_rawsum)/sum(mean_rawcount)

      print(round(mean_final2, digits = 3))


      ## 'pollutant' is a character vector of length 1 indicating
      ## the name of the pollutant for which we will calculate the
      ## mean; either "sulfate" or "nitrate".

      ## 'id' is an integer vector indicating the monitor ID numbers
      ## to be used

      ## Return the mean of the pollutant across all monitors list
      ## in the 'id' vector (ignoring NA values)
}