plot1 <- function() {

    path <- "./household_power_consumption.txt"
    data <- read.table(path, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
    df <- as_tibble(data)
    df <- df %>% subset(Date %in% c("1/2/2007","2/2/2007"))
    
    
    png("plot1.png", width=480, height=480)
    
    globalA <- as.numeric(df$Global_active_power)
    
    hist(globalA, col="red", main="Global Active Power", xlab="Global Active Power (kilowats)")
    dev.off()

}