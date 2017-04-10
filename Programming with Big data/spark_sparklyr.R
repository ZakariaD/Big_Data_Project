################################################Spark connection ################################################

#Specifying the Spark directory and library

Sys.setenv(SPARK_HOME="/usr/local/spark")
.libPaths(c(file.path(Sys.getenv("SPARK_HOME"), "R", "lib"), .libPaths()))

#To upgrade to the latest version of sparklyr, run the following command

devtools::install_github("rstudio/sparklyr")

#Connecting to Spark

library(sparklyr)

config <- spark_config()
sc <- spark_connect(master = "spark://master:7077", config = config)

#It may display exceptions, but it's ok , it is just a Hive exception and doesn't affect the execution of the following 
#the spark pannel should appear in the right side near the Evironment and History pannels

################################################ Loading data to spark memory ################################################

setwd("path to the csv data sets")

#Loading the data
features_train <- read.delim('features.csv',header = FALSE,sep = ",")
features_test <- read.delim('features_test.csv',header = FALSE,sep = ",")

# convert the label in factor type
features_train[,27] <- factor(features_train[,27])
features_test[,27] <- factor(features_test[,27])

data_set <-rbind.data.frame(features_train,features_test)

#Loading the data to spark memory
data_spark <- copy_to(sc, data_set,overwrite = TRUE)

#If the connection to spark is correct and the loading is done, you will see the model_data data frame in the spark pannel in right side


################################################ Training and testing the model performance ################################################
partitions <- data_spark %>%
  sdf_partition(training = 0.7, test = 0.3, seed = 1099)


features_names = c(paste("V", seq(1,26),sep=''))
class_name = "V27"


rf_model <- partitions$training %>%
  ml_random_forest(response = class_name, features = features_names, type = "classification", num.trees = 300, max.depth = 3)

library(dplyr)

pred <- sdf_predict(rf_model, newdata = partitions$test) %>%
  collect

test <- data.frame(partitions$test)
V27 <- test$V27

mean(pred$prediction != V27)

#0.9966973

table(pred$prediction, V27)
