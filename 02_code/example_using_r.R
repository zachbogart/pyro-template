# ---
# jupyter:
#   jupytext:
#     formats: ipynb,R:percent
#     text_representation:
#       extension: .R
#       format_name: percent
#       format_version: '1.3'
#       jupytext_version: 1.10.1
#   kernelspec:
#     display_name: R
#     language: R
#     name: ir
# ---

# %% [markdown]
# ## Notebook Using R

# %%
suppressMessages(library(tidyverse))
suppressMessages(library(janitor))

# %%
path_data <- "../01_data/penguins.csv"
path_output <- "../03_outputs/"

# %%
penguins <- read_csv(path_data)

# %%
plot <- penguins  %>% 
    ggplot(aes(x=bill_length_mm, y=bill_depth_mm, color=species)) +
        geom_point()

# %%
plot + ggsave(paste0(path_output, "scatterplot_r.png"))

# %%
export <- penguins  %>% 
    select('year', 'island', everything())

# %%
head(export)

# %%
export %>% 
    write_csv(paste0(path_output, "reordered_penguins_r.csv"))

# %% [markdown]
# ### Install a Package (docker session)

# %%
install.packages("fortunes")

# %%
library(fortunes)

# %%
fortune()

# %%
