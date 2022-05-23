# Deliverable 1:

library(dplyr)
mecha_mpg_table <- read.csv(file='Resources/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
#generate multiple linear regression model with all 6 columns
model <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_mpg_table)
summary(model)
plot(model)

# Deliverable 2:
##import suspension coil datat csv file
suspension_coil_table <- read.csv(file='Resources/Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
## creates summary tables
total_summary <- suspension_coil_table %>% summarize(Mean=mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
lot_summary <- suspension_coil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI)) 
