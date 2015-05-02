# loopScript.R
# run exampleData.R first to create sample data
# run this script to create 3 example reports based on the exampleData script.


# loading required packages
library(rmarkdown); library(knitr)

# getting the data
load("dat.rda")

# the participants I want to create the report for
select <- c("pa1", "pa4", "pa5")

select[1]
dat
# create a loop for subsetting the data
# and create the report
for(i in 1:length(select)){
  
  reportData <- dat[dat$participant==select[i],]
  
  save(reportData, file="reportData.rda")
  
  render("report.Rmd", pdf_document(),
         output_file = paste(select[i],".pdf",sep=""))
  
    
}