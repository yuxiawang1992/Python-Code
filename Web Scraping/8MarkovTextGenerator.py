##文本分析与写作
##通过一段演讲内容的结构生成任意长度的马尔科夫链组成的句子
from urllib.request import urlopen
from random import randint

def wordListSum(wordList):
    sum = 0
    for word, value in wordList.items():
        sum += value
    return sum

def retrieveRandomWord(wordList):
    randIndex = randint(1, wordListSum(wordList))
    for word , value in wordList.items():
        randIndex -= value
        if randIndex <= 0:
            return word

def buildWordDict(text):
    #eliminate the wraps and qutations
    text = text.replace("\n"," ");
    text = text.replace("\"","")

    #to ensure that every punctuation mark is aligned with the forward word
    punctuation = [',','.',';',':']
    for symbol in punctuation:
        text = text.replace(symbol," "+symbol+" ")
    words = text.split(" ")

    #filter the empty words
    words = [word for word in words if word != ""]

    wordDict = {}
    for i in range(1,len(words)):
        if words[i-1] not in wordDict:
            wordDict[words[i-1]] = {}
        if words[i] not in wordDict[words[i-1]]:
            wordDict[words[i-1]][words[i]] = 0
        wordDict[words[i-1]][words[i]] = wordDict[words[i-1]][words[i]] + 1

    return wordDict

text = str(urlopen("http://pythonscraping.com/files/inaugurationSpeech.txt").read(),'utf-8')
wordDict = buildWordDict(text)

# generate the 100-markove chain
length = 100
chain = ""
currentWord = "I"
for i in range(0,length):
    chain += currentWord + " "
    currentWord = retrieveRandomWord(wordDict[currentWord])
print(chain)