import pandas as pd
import numpy as np
import os
import xlrd

from openpyxl import Workbook
from openpyxl import load_workbook

path = "E:\\TecentCheckIn\\economics\\county_gdp\\"

inwb = load_workbook(path+"2016年9月13日22-47-03HAWWR.xls")
print(inwb)

