# Read dataset
epc <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep=";")

# Convert data formats
epc$dateTime <- strptime(paste(epc$Date, epc$Time), format="%d/%m/%Y %H:%M:%S")
epc$Date = as.Date(epc$Date, format= "%d/%m/%Y")
epc$Global_active_power = as.numeric(epc$Global_active_power)
epc$Sub_metering_1 = as.numeric(epc$Sub_metering_1)
epc$Sub_metering_2 = as.numeric(epc$Sub_metering_2)
epc$Sub_metering_3 = as.numeric(epc$Sub_metering_3)

# Filter dataset
epc_sub <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")

# Plotting for Plot 1
png("plot3.png")
plot(epc_sub$dateTime, epc_sub$Sub_metering_1, type = 'l', xlab = "", ylab = "Energy sub metering")
lines(epc_sub$dateTime, epc_sub$Sub_metering_2, type = 'l', xlab = "", ylab = "Sub_metering_2", col = "red")
lines(epc_sub$dateTime, epc_sub$Sub_metering_3, type = 'l', xlab = "", ylab = "Sub_metering_3", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), lwd=1)
dev.off()