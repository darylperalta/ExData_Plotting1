# Read dataset
epc <- read.table("C:/Users/airscan/Documents/expts/Coursera/EDA/ExData_Plotting1/exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep=";")

# Convert data formats
epc$Date = as.Date(epc$Date, format= "%d/%m/%Y")
epc$Global_active_power = as.numeric(epc$Global_active_power)

# Filter dataset
epc_sub <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")

# Plotting for Plot 1
png("plot1.png")
hist(epc_sub$Global_active_power, col = "red", ylim = c(0,1200), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()