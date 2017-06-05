#importing the dataset
dataset = read.csv("Mall_Customers.csv")
X <- dataset[4:5]

#using Dendrogram to find the optimal cluster method
dendrogram = hclust(dist(X,method = 'euclidian'),method = "ward.D")
plot(dendrogram,
     main = "Dendrogram",
     xlab = "customers",
     ylab = "Euclidian Distances")

#Fitting the hierarchical clustering to the mall dataset
hc = hclust(dist(X,method = 'euclidian'),method = "ward.D")
y_hc = cutree(hc,5)

#Visualizing the clusters
library(cluster)
clusplot(X,
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = "Cluster of cutomers",
         xlab = "Annual Income",
         ylab = "Spending score")