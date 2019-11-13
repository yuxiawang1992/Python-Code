from urllib.request import urlopen
from urllib.error import HTTPError, URLError
from bs4 import BeautifulSoup
import re

def getImage(url):
    try:
        html = urlopen(url)
    except(HTTPError, URLError) as e:
        return None
    try:
        bsObj = BeautifulSoup(html.read(), "html.parser")
        images = bsObj.findAll("img",{"src":re.compile("\.\.\/img\/gifts\/img.*\.jpg")})
        for image in images:
            print(image["src"])
    except AttributeError as e:
        return None
    return images

image = getImage("http://pythonscraping.com/pages/page3.html")
if image == None:
    print("Image could not be found")


