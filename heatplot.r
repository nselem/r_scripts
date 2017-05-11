library(ggplot2)
library( reshape )
library(plyr )
library(RColorBrewer)
proteins <- read.table("proteinas.new.r", header=TRUE, sep=",")
gene <- read.table("gene.new.r", header=TRUE, sep=",")
egene <- melt(gene)
eprotein <- melt(proteins)
hm.palette <- colorRampPalette(rev(brewer.pal(11, 'Spectral')), space='Lab')  

###################### Graficos ##################
########## De los especiales
## Grafica de las proteinas
jpeg("Plot1.jpeg", width = 5, height = 5, units = 'in', res = 400)
ggplot(eprotein, aes(x=variable, y=Protein))+ geom_raster(aes(fill=value)) +  theme(text = element_text(size=8), axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +  coord_equal()+scale_fill_gradient(low = "white", high = "black",na.value = "orange")
dev.off()

## Grafica de los genes
jpeg("Plot2.jpeg", width = 5, height = 5, units = 'in', res = 400)
ggplot(egene, aes(x=variable, y=Gene))+ geom_raster(aes(fill=value)) +  theme(text = element_text(size=8), axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +coord_equal()+scale_fill_gradient(low = "white", high = "black",na.value = "orange")
dev.off()


## Grafica de los genes en azules
tiff("Plot5.tiff", width = 5, height = 5, units = 'in', res = 400)
ggplot(egene, aes(x=variable, y=Gene))+ geom_raster(aes(fill=value)) + theme(text = element_text(size=8), axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) + coord_equal()+ scale_fill_gradient(low = "white" , high = "steelblue",na.value = "orange")
dev.off()

## Grafica de los genes en colores
jpeg("Plot3.jpeg", width = 5, height = 5, units = 'in', res = 400)
ggplot(egene, aes(x=variable, y=Gene))+ geom_raster(aes(fill=value))+ theme(text = element_text(size=8), axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +coord_equal()+ scale_fill_gradientn(colours = hm.palette(100),na.value = "gray")
dev.off()

## Grafica de las proteinas en colores

jpeg("Plot4.jpeg", width = 5, height = 5, units = 'in', res = 400)
ggplot(eprotein, aes(x=variable, y=Protein))+ geom_raster(aes(fill=value)) +  theme(text = element_text(size=8), axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +  coord_equal()+ scale_fill_gradientn(colours = hm.palette(100),na.value = "gray")
dev.off()

#http://blog.revolutionanalytics.com/2009/01/10-tips-for-making-your-r-graphics-look-their-best.html
#https://danieljhocking.wordpress.com/2013/03/12/high-resolution-figures-in-r/
