from urllib.request import urlopen
from urllib.error import HTTPError, URLError
from bs4 import BeautifulSoup

def getCSS(url):
    try:
        html = urlopen(url)
    except(HTTPError, URLError) as e:
        return None
    try:
        bsObj = BeautifulSoup(html.read(), "html.parser")
        nameList = bsObj.findAll("span",{"class":"green"})
        for name in nameList:
            print(name.get_text())
    except AttributeError as e:
        return None
    return name

name = getCSS("http://pythonscraping.com/pages/warandpeace.html")
if name == None:
    print("Name could not be found")
else:
    print(name)

