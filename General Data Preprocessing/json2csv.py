
import json
from pandas import DataFrame

path = "E:\\TecentCheckIn\\migration\\city coord\\"
result = json.load(open(path+'guangxi.json',encoding='utf-8'))
df = DataFrame(result)

df.to_csv(path+'guangxi.csv')
