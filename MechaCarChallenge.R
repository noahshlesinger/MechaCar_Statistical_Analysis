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



# Deliverable 3:
##generate 50 randomly sampled data points
sample_table <- suspension_coil_table %>% sample_n(50)
#compare sample versus population means
t.test(log10(sample_table$PSI),mu=1500) #THIS IS SIGNIFICANT( P-VALUE <0.05)

##generate another 50 randomly sampled data points from only Lot1
sample_table_Lot1 <- suspension_coil_table[suspension_coil_table$Manufacturing_Lot == "Lot1",]
t.test(sample_table_Lot1$PSI,sample_table$PSI, paired = T) #Not significant (P-value = 0.063)
sample_table_Lot2 <- suspension_coil_table[suspension_coil_table$Manufacturing_Lot == "Lot2",]
t.test(sample_table_Lot2$PSI,sample_table$PSI, paired = T) #Significant (P-Value = 0.426)
sample_table_Lot3 <- suspension_coil_table[suspension_coil_table$Manufacturing_Lot == "Lot3",]
t.test(sample_table_Lot3$PSI,sample_table$PSI, paired = T) #Not Significant (P-value =0.4464)







