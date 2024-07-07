# Step 1: Clean the data

# Select relevant columns from the Household_Income dataset and remove rows with missing values
H1_data <- Household_Income %>%
  dplyr::select(Geo_QName, SE_A14006_001, SE_A12001_005, SE_A12001_006, SE_A17002_006, SE_A06001_003, SE_A06001_001, 
                SE_A17002_001, SE_A12001_001, SE_A01001_007,  SE_A01001_008, SE_A02001_002, SE_A02001_003, 
                SE_A17007A_002, SE_A17007B_002, SE_A17002B_005, SE_A01001_011, SE_A01001_012, SE_A01001_013, 
                SE_A17007A_009, SE_A17007A_010, SE_A17007B_009, SE_A17007B_010, SE_A17007A_001, SE_A17007B_001, 
                SE_A17007A_012, SE_A17007B_012, SE_A17007A_013, SE_A17007B_013, SE_A17007A_014, SE_A17007B_014, 
                SE_A17007A_007, SE_A17007A_008, SE_A17007B_007, SE_A17007B_008, SE_A03001_002, Geo_STUSAB) %>%
  na.omit()

# Rename columns for better readability
names(H1_data) <- c("COUNTY", "MEDINC", "BACHELORS", "GRAD", "UNEMP", "FORBORN", "Total_pop", "pop_16andover", 
                    "pop_25andover", "AGE2534", "AGE3544", "MALE", "FEMALE", "MALEMGMTOCCPCT", "FEMALEMGMTOCCPCT", "EMP", 
                    "AGE6574", "AGE7584", "AGE85andover", "Male_Sales", "Male_Office", "Female_Sales",
                    "Female_Office", "Male_Total", "Female_Total", "Male_Construction", "Female_Construction",
                    "Production_Male", "Production_Female", "Transportation_Male", "Transportation_Female", "Male_Building", 
                    "Male_Personal", "Female_Building", "Female_Personal", "White", "STATE")

# Calculate percentages for age groups, education levels, unemployment, and various demographics
H1_data$AGE2534 = ((H1_data$AGE2534)/H1_data$Total_pop)*100
H1_data$AGE3544 = ((H1_data$AGE3544)/H1_data$Total_pop)*100
H1_data$BACHELORS = (H1_data$BACHELORS/H1_data$pop_25andover)*100
H1_data$GRAD = (H1_data$GRAD/H1_data$pop_25andover)*100
H1_data$FORBORN = (H1_data$FORBORN/H1_data$Total_pop)*100
H1_data$UNEMPRATE = (H1_data$UNEMP/H1_data$pop_16andover)*100
H1_data$MALE = (H1_data$MALE/H1_data$Total_pop)*100
H1_data$FEMALE = (H1_data$FEMALE/H1_data$Total_pop)*100
H1_data$AGE65OVER = ((H1_data$AGE6574+H1_data$AGE7584+H1_data$AGE85andover)/H1_data$Total_pop)*100
H1_data$MGMTOCC = ((H1_data$MALEMGMTOCCPCT+H1_data$FEMALEMGMTOCCPCT)/
                     (H1_data$Male_Total+H1_data$Female_Total))*100
H1_data$SALES = ((H1_data$Male_Sales+H1_data$Female_Sales)/
                   (H1_data$Male_Total+H1_data$Female_Total))*100
H1_data$OFFICE = ((H1_data$Male_Office+H1_data$Female_Office)/
                    (H1_data$Male_Total+H1_data$Female_Total))*100
H1_data$CONSTRUCTION = ((H1_data$Male_Construction+H1_data$Female_Construction)/
                          (H1_data$Male_Total+H1_data$Female_Total))*100
H1_data$PRODUCTION = ((H1_data$Production_Male+H1_data$Production_Female+
                         H1_data$Transportation_Male+H1_data$Transportation_Female)/
                        (H1_data$Male_Total+H1_data$Female_Total))*100

H1_data$SERVICE = ((H1_data$Male_Personal+H1_data$Female_Personal)/
                     (H1_data$Male_Total+H1_data$Female_Total))*100
H1_data$WHITE = (H1_data$White/H1_data$Total_pop)*100


# Step 2: Filter Data for Texas Counties Only

# Filter the data to include only Texas counties and select specific columns for analysis
H2_data <- H1_data %>%
  filter(STATE == "tx") %>%
  dplyr::select(COUNTY, MEDINC, BACHELORS, GRAD, UNEMPRATE, FORBORN, AGE65OVER,
                WHITE, MALE, MGMTOCC, SALES, CONSTRUCTION, PRODUCTION) %>%
  na.omit()

# Save the filtered data to a CSV file
write.csv(H2_data, "Texas_Income_Data.csv", row.names = FALSE)
