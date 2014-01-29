#Outlier Script
source("source.R")

#health normalized data
h <- readRDS("Health_774_ALL_FACILITY_INDICATORS.rds")

#cleaning
h_outlier <- outlierreplace(h, "num_doctors_posted", h$num_doctors_posted > 308)

h_outlier <- outlierreplace(h_outlier, "num_nurses_posted", h$num_nurses_posted > 99 & 
                              (h_outlier$facility_type != 'generalhospital' &
                              h_outlier$facility_type != 'teachinghospital'))

h_outlier <- outlierreplace(h_outlier, "num_nursemidwives_posted", 
                            h_outlier$num_nursemidwives_posted > 50)

#write out data
saveRDS(h_outlier, "health_cleaned.rds")




