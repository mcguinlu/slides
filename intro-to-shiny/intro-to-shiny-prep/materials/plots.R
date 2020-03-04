# Need description of dataset

# Bar plot
ggplot(BristolVis::med, aes(x=status)) + 
  geom_bar(aes(fill=input$histogram_fill))

  # When histogram_fill = dosage
  ggplot(BristolVis::med, aes(x=status)) + 
    geom_bar(aes(fill=dosage))
  
  # When histogram_fill = gender
  ggplot(BristolVis::med, aes(x=status)) + 
    geom_bar(aes(fill=gender))
  
  # When histogram_fill = health
  ggplot(BristolVis::med, aes(x=status)) + 
    geom_bar(aes(fill=health))

# Scatter plot

library(ggplot2)

ggplot(data=BristolVis::med, aes(x=age, y=time))+
  geom_point(aes(colour=dosage))+
  theme(legend.position = "bottom")

ggplot(data=BristolVis::med, aes(x=age, y=time))+
  geom_point(aes(colour=gender))+
  theme(legend.position = "bottom")

ggplot(data=BristolVis::med, aes(x=age, y=time))+
  geom_point(aes(colour=treatment))+
  theme(legend.position = "bottom") +
  facet_grid(.~status)


# Raster plot

ggplot(BristolVis::med, aes(gender, health)) +
  geom_raster(aes(fill=time))

ggplot(BristolVis::med, aes(gender, health)) +
  geom_raster(aes(fill=age))

# Facets

ggplot(BristolVis::med, aes(x=time)) +
  geom_histogram(aes(y=..density.., fill=treatment), binwidth=0.2) + 
  facet_grid(gender ~ health) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

ggplot(BristolVis::med, aes(x=time)) +
  geom_histogram(aes(y=..density.., fill=gender), binwidth=0.2) + 
  facet_grid(treatment ~ health) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
