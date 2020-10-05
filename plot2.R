# Read dataset
epc <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep=";")

# Convert data formats
epc$dateTime <- strptime(paste(epc$Date, epc$Time), format="%d/%m/%Y %H:%M:%S")
epc$Date = as.Date(epc$Date, format= "%d/%m/%Y")
epc$Global_active_power = as.numeric(epc$Global_active_power)

# Filter dataset
epc_sub <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")

# Plotting for Plot 1
png("plot2.png")
plot(epc_sub$dateTime, epc_sub$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()