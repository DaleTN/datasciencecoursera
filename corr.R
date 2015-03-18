corr <- function(directory, threshold = 0) {
      ## 'directory' is a character vector of length 1 indicating
      ## the location of the CSV files

      file_lst3 <- list.files(path=directory)
      file.ln <- length(file_lst3)
      output.vec <- numeric(0)

      for (i in 1:file.ln){

            Y1 <- read.csv(paste(directory,file_lst3[i],sep="/"))

            compl_out <- sum(complete.cases(Y1))

##            if(compl_out > threshold){
##                  output.vec <- c(output.vec,round(cor(Y1$sulfate,Y1$nitrate,use="complete.obs"),digits = 5))
##
##            }
            if(compl_out == 0 & threshold == 0){
                  output.vec <- c(output.vec,0)
            }
            else {
                  output.vec <- c(output.vec,round(cor(Y1$sulfate,Y1$nitrate,use="complete.obs"),digits = 5))
            }

      }

      ## 'threshold' is a numeric vector of length 1 indicating the
      ## number of completely observed observations (on all
      ## variables) required to compute the correlation between
      ## nitrate and sulfate; the default is 0


      output.final <-output.vec
}