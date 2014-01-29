

#Health: LGA level script
source("Training Pipeline/Pipeline/source.R")

#reading in data
h <- read.csv("Training Pipeline/Pipeline/health_facilitylevels.csv", stringsAsFactors=F)


#idataframe
ih <- idata.frame(h)

#aggregations
h_lga <- ddply(ih, .(lga_id), function(df) {
    data.frame(
      proportion_at_least_1_sba = 
        bool_proportion(df$skilled_birth_attendant, TRUE), proportion_emerg_tran = 
            bool_proportion(df$emerg_tran, TRUE), total_nursemidwives = 
                sum(df$num_nursemidwives_fulltime)
)})






#writing out
write.csv(h_lga, "C:./././Training Pipeline/Pipeline/health_lgalevels.csv", row.names=F)

  


