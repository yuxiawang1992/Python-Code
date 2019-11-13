import dbf
import time
print(time.asctime(time.localtime(time.time())))
d = dbf.Table("D:\\fahui_wang\\d_05.dbf",ignore_memos = True)
d.open()
dbf.export(d,filename = "d_05.csv",format = 'csv',header = True)
print(time.asctime( time.localtime(time.time()) ))
