# ---
# jupyter:
#   jupytext:
#     formats: ipynb,py:percent
#     text_representation:
#       extension: .py
#       format_name: percent
#       format_version: '1.3'
#       jupytext_version: 1.10.1
#   kernelspec:
#     display_name: Python 3
#     language: python
#     name: python3
# ---

# %% [markdown]
# # Notebook Using Python

# %%
import pandas as pd

# %%
path_data = "../01_data/penguins.csv"
path_output = "../03_outputs/"

# %%
penguins = pd.read_csv(path_data)

# %%
penguins.head(10)

# %%
export = (penguins[['year', 'island']])

# %%
export.to_csv(path_output + "filtered_penguins_python.csv", index=False)

# %% [markdown]
# ### Install A Package (docker session)

# %%
# ! pip3 install Pillow

# %%
import PIL

# %%
