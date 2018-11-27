# PCAin FactoMineR and factoextra
# November27 2018
# EAS

library(FactoMineR)
library(factoextra)

#PCA
# summaraizes info in multivariable data
# Ranks PCs in order of variance they explain
# reduces dimensionality of data sets, loses least amount of info possible

# PCA
data("iris")
head(iris)

iris2 <- iris[1:4]

iris.pca <- PCA(iris2, scale.unit = TRUE, graph = FALSE)

iris.pca$eig

#Scree plot (factoextra)
fviz_screeplot(iris.pca, ncp = 4)

# simple factor map
plot.PCA(iris.pca,axes = c(1,2),choix = "var")

#factoextra biplot
fviz_pca(iris.pca)

fviz_pca_var(iris.pca, col.var = "contrib")

fviz_pca_var(iris.pca, col.var = "contrib") + scale_color_gradient2(low = "blue", mid = "steelblue", high = "red", midpoint = 25.0) + theme_void()

# individuals without labels
fviz_pca_ind(iris.pca,label = "none")

fviz_pca_ind(iris.pca,label = "none", habillage = iris$Speceis)

# ellipses
fviz_pca_ind(iris.pca,label = "none", habillage = iris$Speceis,
             addEllipses = TRUE, ellipse.level = 0.95)

# biplot with factoextra
fviz_pca_biplot(iris.pca, geom.ind = "point", fill.ind = iris$species, col.ind = "black", pointshape = 21, pointsize = 2)





