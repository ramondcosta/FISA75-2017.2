# x = matrix(1:5,1:5)
# z = expand.grid(tGet = c('T','F'), tFlow = c('T','F'), tIRQ = c('T','F'), COAP = c('T','F'))
# x = rev(z)
# x$Bandwidth = NA
# x$latency = NA
# write.csv(x,"./teste.csv",row.names = F,quote = FALSE)


measuredData = c(10,12,11,15,20,18)
expectedNegativeData = c(10,15,15,15,20,25)
expectedPositiveData = c(5,10,10,10,15,20)

dados <- NULL
dados$measured = measuredData
dados$floor = expectedNegativeData
dados$roof = expectedPositiveData 

dados <- data.frame(dados)

# data = table(measuredData,expectedNegativeData,expectedPositiveData)

barplot(as.matrix(dados), beside=TRUE)

