import pandas as pd
import rpa as r

r.init()
listaCOD = pd.read_excel('NTFs.xlsx')
print(listaCOD)
r.url()
