plot3 <- function() {
    
    path <- "./household_power_consumption.txt"
    data <- read.table(path, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
    df <- as_tibble(data)
    df <- df %>% subset(Date %in% c("1/2/2007","2/2/2007"))
    
    
    png("plot3.png", width=480, height=480)
    
    timestamp1 <- with(df,strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S"))
    sub1 <- as.numeric(df$Sub_metering_1)
    sub2 <- as.numeric(df$Sub_metering_2)
    sub3 <- as.numeric(df$Sub_metering_3)

    plot(timestamp1, sub1, type="l", ylab="Energy Submetering", xlab=" ")
    lines(timestamp1, sub2, type="l", col="red")
    lines(timestamp1, sub3, type="l", col="blue")
    
    dev.off()
}