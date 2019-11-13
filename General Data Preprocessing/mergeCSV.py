import pandas as pd
import numpy as np
import os

f_path = "H:\\Tencent data\\CSV\\"
out_file = "F:\\data_test\\Python_tencent\\all.csv"

for input_file in os.listdir(f_path):
	pd.read_csv(input_file,header = True)
	pd.to_csv(out_file,mode = "a",index = True, header = True)