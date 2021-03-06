# ggtree
# November 28, 2018\
# EAS

# phylogenetic trees - visualization and annotations
# diagram which represents evolutionary relationships among organisms
# node - common ancestors
# tips - species
# branch length - evolutionary time

# ggtree - designed by extending ggplot

library(ggtree)
set.seed(112818)
tree <- rtree(n=15, tip.label = LETTERS[seq(1:15)]) # random tree of 15 tips

# to visualize a tree
ggtree(tree)

# layouts - slanted, circular, fan
ggtree(tree, layout = "slanted")
ggtree(tree, layout = "circular")
ggtree(tree, layout = "fan", open.angle = 120)

# unrooted trees
ggtree(tree, layout = "daylight")

# for cladograms
ggtree(tree, layout = "slanted", branch.length = "none")

# to display nodes and tips - geom_nodepoint and geom_tippoint
p <- ggtree(tree) + geom_nodepoint(color = "blue", alpha=0.5, size=4)
p

# not tips
p + geom_tippoint(color = "red", shape = 5, size = 3)

# manipulate a tree
# view tiplabel and node labels

p + geom_text2(aes(subset=!isTip, label = node), hjust = -.5) + geom_tiplab()

# single out a clade -  node and all of its descendents
viewClade(p + geom_tiplab(), node = 26)

# group clades
tree <- groupClade(tree, .node=c(21,25))
geom_tiplab(aes(color=group, linetype=group)) + geom_tiplab(aes(subset=(group==1)))

# collapse a clade
cp <- collapse(p, node=21)
cp + geom_point2(aes(subset=(node==21)), size=5, shape=23, fill="steelblue")

# expand a collapsed clade
cp %>% expand(node=21)

# tree annotation
# to annotate a clade
p + geom_cladeLabel(n = 21, label = "my clade") + 
  geom_cladelabel(node = 25, label = "your clade")

# position/color
p + geom_cladeLabel(n = 21, label = "my clade", align = T, offset = -1, color = "red") + geom_cladelabel(node = 25, label = "your clade") + 
  geom_cladelabel(node = 25, label = "your clade")

# change the fontsize/ barsize
p + geom_cladeLabel(n = 21, label = "my clade", align = T, offset = -1, color = "red", barsize = 1.5, fontsize = 5) + 
geom_cladelabel(node = 25, label = "your clade", align = T, offset=-0.5, color = "blue", barsize  =2, fontsize =5)  

#phylomoji
library(emojifont)

# label a clade using emoji
p +
geom_Cladelabel(node = 21, label = "chicken", parse = "emoji", fontsize = 12, align = T, color "firebrick") +
  geom_cladelabel(node = 25, label = "duck", parse = "emoji", fontsize = 12, align = T, color = "steelblue")

tree_text <- "(((((cow, whale, dolphin)), (pig, boar)), camel), fish), seedling);"
x <- read.tree(text=tree_text)

ggtree(x, linetype="dashed", color="firebrick") + 
  xlim(NA,7), ylim(NA, 8.5) + 
  geom_tiplab(aes(color=label), parse = "emoji",
              size=14, vjust=0.25) + 
  
  labs(title = "exploring cool emji in phylogenetics",
      caption = "powered by ggtree + emojifont")



























