plot2 <- function() {
    
    path <- "./household_power_consumption.txt"
    data <- read.table(path, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
    df <- as_tibble(data)
    df <- df %>% subset(Date %in% c("1/2/2007","2/2/2007"))
    
    
    png("plot2.png", width=480, height=480)
    
    timestamp1 <- with(df,strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S"))
    globalA <- as.numeric(df$Global_active_power)
   
    
    plot(timestamp1, globalA, type="l", xlab=" ", ylab="Global Active Power (kilowats)")
    dev.off()
}