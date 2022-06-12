import pandas as pd

df = pd.read_csv("nombres.csv")




df['nombre'] = df['nombre'].str.lower()
df['nombre'] = df['nombre'].str.capitalize()


print(df.head())
df.to_csv("nombres_mexico.csv")



