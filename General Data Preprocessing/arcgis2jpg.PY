#作者：mtl
#用途：将一个文件夹中的所有mxd文件（不包括子目录）导出成jpg图片,并放置到该文件夹中。
#用法：用记事本打开，将参数path更改成指定的文件路径，注意将反斜杠“\”改成正斜杠“/”；res是设定的dpi值。
#运行方法：打开Python2.6中的IDLE，File - > Open -> run -> run Module。
##########################################################################################
import arcpy, os, time

path = r'E:\******\成果'
res = 300

print '程序开始：' + str(time.ctime())
for afile in os.listdir(path):
  if afile[-3:].lower() == 'mxd':
    mxd = arcpy.mapping.MapDocument(os.path.join(path,afile))
    arcpy.mapping.ExportToJPEG(mxd, os.path.join(path,afile[:-3] + 'jpg'), resolution = res)
    del mxd
print '程序结束：' + str(time.ctime())
