# -*- coding: utf-8 -*-
"""EDA.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1_j7Ep2PxXlavIkoBXMXRfCc21--bpcey
"""

!pip install neurokit2

import numpy as np
import pandas as pd
import neurokit2 as nk
import seaborn as sns
import matplotlib.pyplot as plt

# Generate 10 seconds of EDA signal (recorded at 250 samples / second) with 2 SCR peaks
eda = pd.read_csv("eda.csv")
condition_list = ["Negative", "Neutral", "Neutral", "Negative"]



# Process it
signals, info = nk.eda_process(eda['EDA'], sampling_rate=500)

# Visualise the processing
plot = nk.eda_plot(signals)

plot.savefig('plot.jpg')

# Import packages
import neurokit2 as nk
import pandas as pd
import numpy as np
import seaborn as sns

# Download data
df = pd.read_csv("eda.csv")
# Plot it
df.plot()