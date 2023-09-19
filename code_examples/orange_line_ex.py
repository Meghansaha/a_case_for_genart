#============================================================================#
#Python Example - Single, Orange, Line----------------------------------------
#============================================================================#

# Library Load-in-------------------------------------
from plotnine import *
import pandas as pd

# Image Options---------------------------------------
#Set the color
orange_hex = "#FFBB58"

#Set the width
chonk = 10

# Data Creation----------------------------------------
line = pd.DataFrame({"x" : list(range(0,5)),
  "y" : 1,
  "color" : orange_hex,
  "size" : chonk})

# Plot Creation----------------------------------------
orange_line = (ggplot(line, aes("x", "y"))+
                 geom_path(color = line.loc[:,"color"],
                           size = line.loc[:,"size"])+
                 coord_equal(ylim = (0,3), xlim = (0,4)))

#View the plot-----------------------------------------
print(orange_line)
