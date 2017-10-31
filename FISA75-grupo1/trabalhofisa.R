data = read.csv("TABELAS - MEDIDA 1 - FISICA - experimento 1.csv")
x <- c(1:length(data$t1.s))
heading = "t1"
par(pch=22, col="red") # plotting symbol and color
# dev.new(width=5, height=4)
plot(x, data$t1.s, type="o", main=heading)


counts <- data$t1.s
names(counts) = x
# dev.new(width=5, height=4)
barplot(counts, main="T1 Variation",
        xlab="Experiment number", ylab="T1") 

# lines(x, data$t1.s, type="S")
x <- c(1:5); y <- x # create some data
par(pch=22, col="red") # plotting symbol and color
par(mfrow=c(2,4)) # all plots on one page
opts = c("p","l","o","b","c","s","S","h")
for(i in 1:length(opts)){
  heading = paste("type=",opts[i])
  plot(x, y, type=opts[i], main=heading)
}

# x <- c(1:5); y <- x # create some data
# par(pch=22, col="blue") # plotting symbol and color
# par(mfrow=c(2,4)) # all plots on one page
# opts = c("p","l","o","b","c","s","S","h")
# for(i in 1:length(opts)){
#   heading = paste("type=",opts[i])
#   plot(x, y, main=heading)
#   lines(x, y, type=opts[i])
# }

# Create Line Chart

# convert factor to numeric for convenience
Orange$Tree <- as.numeric(Orange$Tree)
ntrees <- max(Orange$Tree)

# get the range for the x and y axis
xrange <- range(Orange$age)
yrange <- range(Orange$circumference)

dev.new(width=5, height=4)

# set up the plot
plot(xrange, yrange, type="n", xlab="Age (days)",
     ylab="Circumference (mm)" )
colors <- rainbow(ntrees)
linetype <- c(1:ntrees)
plotchar <- seq(18,18+ntrees,1)


# add lines
for (i in 1:ntrees) {
  tree <- subset(Orange, Tree==i)
  lines(tree$age, tree$circumference, type="b", lwd=1.5,
        lty=linetype[i], col=colors[i], pch=plotchar[i])
}

# # add a title and subtitle
# title("Tree Growth", "example of line plot")
# 
# # add a legend
# legend(xrange[1], yrange[2], 1:ntrees, cex=0.8, col=colors,
#        pch=plotchar, lty=linetype, title="Tree")