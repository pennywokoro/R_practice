
#Health: Facility Level Indicator Script

#read in data
h_outlier <- readRDS("health_cleaned.rds")

#creating facility level data frame
h_fac <- h_outlier

#creating indicators
h_fac$iv_medications_yn <- h_fac$medication.iv_fluid

h_fac$c_section_yn <- h_fac$c_section_yn &
                      h_fac$emergency_obstetrics_yn

h_fac$num_chews_fulltime <- rowSums(h_fac[, c("num_junior_chews_posted", 
                                              "num_chews_posted")], na.rm=T)
  
h_fac$skilled_birth_attendant <- (rowSums(cbind(h_fac$num_doctors_posted, 
                                                h_fac$num_nurses_posted,
                                                h_fac$num_midwives_posted), na.rm=T) > 0)

h_fac$emerg_tran <- h_fac$transport_to_referral %in% c("ambulance", "keke", "taxi")

h_fac$num_nursemidwives_fulltime <- rowSums(h_fac[, c("num_midwives_posted", "num_chews_posted")],
                                                      na.rm = T)

#write data
write.csv(h_fac, "health_facilitylevels.csv", row.names=F)


