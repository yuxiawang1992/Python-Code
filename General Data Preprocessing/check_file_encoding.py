
import chardet

f = open("E:\\China Economics\\Data\\firm_name.csv", 'rb')
data = f.read()
print(chardet.detect(data))