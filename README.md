# Big Data with R
This is an introduction to Big Data with R course at Imperial College London. Over the span of two 1.5-hour sessions, participants will gain hands-on experience with powerful tools such as **data.table** and **Sparklyr** in R. There sessions are designed to equip you with practical skills for managing and analyzing large datasets in your daily research activities, enhancing your research capabilities with dynamic and efficient methods. Join us to explore there essential big data techniques and elevate your data analysis proficiency.

## Course length and deliver method
2 x 2 hour classes
in-person or online

<img src="/fig/ecri.webp" width="300" />

## Prerequisites

- dplyr or tidyverse in R: self-learning tutorial [https://github.com/ImperialCollegeLondon/RCDS-data-processing-with-r](https://github.com/ImperialCollegeLondon/RCDS-data-processing-with-r)


**NOTE: If you have access to [HPC](https://www.imperial.ac.uk/admin-services/ict/self-service/research-support/rcs/get-access/), you can setup your RStudio environment on HPC with [Open OnDemand](https://openondemand.rcs.ic.ac.uk/)** 

- Setup R and RStudio environment
  - install R 4.1 or higher (**skip this step on HPC**)
  - install the latest RStudio (**skip this step on HPC** )
  - in RStudio, install packages "dplyr" and "sparklyr" if they are not installed
  - sparklyr also requires Java JDK (openjdk is OK)
  - run `library(sparklyr)` then `spark_install()`    
      - If encounter errors with `spark_install()`, use `spark_version()` to check available versions of spark. For Java version >= 11, please install spark 3.0 or higher by running `spark_install(version = "xxxx")`, where
 `xxxx` denotes the version of spark.
      - If `spark_install(version = "xxxx")` failed, could try to download the expected `tgz` file and then use `spark_install_tar("path/to/the/tgz")`
      - Run `spark_installed_versions()` to check the installed spark 
      
      
## Data for practice

- data can be download from [here or data folder](https://github.com/ImperialCollegeLondon/RCDS-BigDataWithR/raw/refs/heads/main/data/compustat2023.csv.zip)

- columns in the data
  - "gvkey": Company identifiers in the Compustat database  
  - "iid": Issue ID
  - "datadate": Trading date
  - "conm": Company names
  - "prccd": Close price
  - "prchd": High price
  - "prcld": Low price
  - "exchg": Stock exchange codes
  
## Learning Outcomes

- **Understand** the challenges of working on big datasets on local computer with common methods in R.
- **Use** the packages in RStudio or R to load big datasets more efficiently.
- **Compose** code for processing big datasets.
- **Manage** data types according to needs.
- **Interpret** common errors and use these to help debug R code.

## Part 1: Big data with data.table

Please check [bigdata_R_part1.Rmd](code/bigdata_R_part1.Rmd) for hands-on practice.

*Solution is [here](code/solutions/bigdata_R_part1_sol.Rmd)*

## Part 2: More advanced big data integration with Spark

Please check [bigdata_R_part2.Rmd](code/bigdata_R_part2.Rmd) for hands-on practice.

*Solution is [here](code/solutions/bigdata_R_part2_sol.Rmd)*

## Acknowledgement

I am particularly thankful to Dr. Katerina Michalickova, Dr. Chris Cooling, Dr. John W. Pinney, and Dr. Jay DesLauriers for their invaluable insights and advice.

## Feedback form