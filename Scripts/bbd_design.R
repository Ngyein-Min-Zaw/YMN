## bbd design 3 factors for two types of dye
if (!requireNamespace("rsm", quietly = TRUE)) install.packages("rsm")

library(rsm)
# for cationic dye
set.seed(9)
cat_bbd <- bbd(3,
     n0 = 4,
     coding = list(
          x1 ~ (pH - 6) / 1,
          x2 ~ (Temp - 35) / 5,
          x3 ~ (Time - 24) / 12
     ),
     randomize = T
)
print(cat_bbd, decode = F)
print(cat_bbd, decode = T)
coding <- codings(cat_bbd)

# for anionic dye
ani_bbd <- bbd(3,
     n0 = 4,
     coding = coding,
     randomize = T
)
print(ani_bbd, decode = F)
print(ani_bbd, decode = T)

cat_bbd_df <- as.data.frame(cat_bbd)
ani_bbd_df <- as.data.frame(ani_bbd)

if (!requireNamespace("writexl", quietly = TRUE)) install.packages("writexl")
library(writexl)
write_xlsx(
     list(
          Cationic = cat_bbd_df,
          Anionic  = ani_bbd_df
     ),
     path = "./Documents/Dye_decolorization_Designs.xlsx"
)
