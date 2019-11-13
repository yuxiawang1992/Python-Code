from urllib.request import urlopen
from urllib.parse import  urlparse
from bs4 import BeautifulSoup
import datetime
import re
import random

pages = set()
random.seed(datetime.datetime.now())

# get all the internal links of a page
def getInternalLinsk(bsObj,includeUrl):
    includeUrl = urlparse(includeUrl).scheme+"://"+urlparse(includeUrl).netloc
    internalLinks = []
    # find all the links that start with "/"
    for link in bsObj.findAll("a", href = re.compile("^(/|.*"+includeUrl+")")):
        if link.attrs['href'] is not None:
            if link.attrs['href'] not in internalLinks:
                if (link.attrs['href'].startswith("/")):
                    internalLinks.append(includeUrl+link.attrs['href'])
                else:
                    internalLinks.append(link.attrs['href'])
    return internalLinks

# get all the external links of a page
def getExternalLinks(bsObj, excludeUrl):
    externalLinks = []
    # find all the links that start with "http" or "www"
    for link in bsObj.findAll("a", href = re.compile(("^(http|www)((?!"+excludeUrl+").)*$"))):
        if link.attrs['href'] is not None:
            if link.attrs['href'] not in externalLinks:
                externalLinks.append(link.attrs['href'])
    return externalLinks

def getRandomExternalLink(startingPage):
    html = urlopen(startingPage)
    bsObj = BeautifulSoup(html,"html.parser")
    externalLinks = getExternalLinks(bsObj,urlparse(startingPage).netloc)
    if len(externalLinks) == 0:
        print("No external links, looking around the site for one")
        domain = urlparse(startingPage).scheme + "://"+ urlparse(startingPage).netloc
        internalLinks = getInternalLinsk(bsObj,domain)
        return getRandomExternalLink(internalLinks[random.randint(0,len(internalLinks)-1)])
    else:
        return externalLinks[random.randint(0,len(externalLinks)-1)]

def followExternalOnly(startingSite):
    externalLink = getRandomExternalLink(startingSite)
    print("Random external link is:"+ externalLink)
    followExternalOnly(externalLink)

followExternalOnly("http://oreilly.com")