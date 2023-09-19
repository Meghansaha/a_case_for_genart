#=============================================================================#
# Python Example - CityScape---------------------------------------------------
#=============================================================================#
# Library Load-in-------------------------------------------------------------
from plotnine import *
import pandas as pd
import numpy as np
#artpack is not available in Python....yet....

# Let's make: a "cityscape" with a sky, moon, and buildings

# Because artpack is not in python, the hex colors need to be grabbed manually#
sky_colors = ["#F6BF07", "#F6BC07", "#F6BA08", "#F6B809", "#F6B60A", "#F6B40A",
              "#F6B20B", "#F6B00C", "#F6AE0D", "#F6AC0E", "#F6AA0E", "#F6A80F",
              "#F6A610", "#F6A411", "#F6A212", "#F6A012", "#F69E13", "#F69C14",
              "#F69A15", "#F69815", "#F69616", "#F69417", "#F69218", "#F69019",
              "#F68E19", "#F68C1A", "#F68A1B", "#F6881C", "#F6861D", "#F6841D",
              "#F6821E", "#F6801F", "#F67E20", "#F67B21", "#F57822", "#F57524",
              "#F57226", "#F46F27", "#F46C29", "#F4692B", "#F4662D", "#F3632E",
              "#F35F30", "#F35C32", "#F35934", "#F25635", "#F25337", "#F25039",
              "#F14D3A", "#F14A3C", "#F1463E", "#F14340", "#F04041", "#F03D43",
              "#F03A45", "#F03747", "#EF3448", "#EF314A", "#EF2D4C", "#EE2A4D",
              "#EE274F", "#EE2451", "#EE2153", "#ED1E54", "#ED1B56", "#ED1858",
              "#ED155A", "#ED155A", "#ED155A", "#ED155B", "#EE155B", "#EE155B",
              "#EE155C", "#EE155C", "#EF155D", "#EF155D", "#EF155D", "#F0165E", 
              "#F0165E", "#F0165F", "#F0165F", "#F1165F", "#F11660", "#F11660",
              "#F11661", "#F21661", "#F21661", "#F21662", "#F31762", "#F31763",
              "#F31763", "#F31763", "#F41764", "#F41764", "#F41765", "#F41765",
              "#F51765", "#F51766", "#F51766", "#F61867"]

# Data for the sky------------------------------------------------------------
df_sky = pd.DataFrame({"x" : 0,
                       "xend" : 4,
                       "y" : np.linspace(start = 0 , stop = 3, num = 100),
                       "yend" : np.linspace(start = 0 , stop = 3, num = 100),
                       "color" : sky_colors,
                       "size" : 10})

# Data for the moon border-----------------------------------------------------
df_moon_border = pd.DataFrame({"x" : 2,
                               "y" : [1.5],
                               "size" : 102,
                               "color" : "#000000"})

# Data for the moon------------------------------------------------------------
df_moon = pd.DataFrame({"x" : 2,
                        "y" : [1.5],
                        "size" : 102,
                        "color" : "#f0e4bb"})
    
    
# Data for the buildings-------------------------------------------------------
df_buildings = pd.DataFrame({"x" : list(range(0,5)),
                             "xend" : list(range(0,5)),
                             "y" : 0,
                             "yend" : np.random.choice(list(range(1,4)), size = 5, replace=True, p=None),
                             "color" : "#000000",
                             "size" : 60})
      
# Plot Creation----------------------------------------------------------------
cityscape = (ggplot(df_sky, aes("x", "y", xend = "xend", yend = "yend")) +
                 theme_void() +
                 coord_cartesian(xlim = (0,4), ylim = (0,3), expand = False) +
                 geom_segment(color = df_sky.loc[:, "color"],
                              size = df_sky.loc[:, "size"]) +
                 geom_point(df_moon_border, aes("x", "y"),
                            color = df_moon_border.loc[:, "color"],
                            size = df_moon_border.loc[:, "size"],
                            inherit_aes = False) +
                 geom_point(df_moon, aes("x", "y"),
                            color = df_moon.loc[:, "color"],
                            size = df_moon.loc[:, "size"],
                            inherit_aes = False) +
                 geom_segment(df_buildings,
                              color = df_buildings.loc[:, "color"],
                              size = df_buildings.loc[:, "size"]) +
                 theme(figure_size=(10, 16)))

#View the plot-----------------------------------------------------------------
print(cityscape)
