import networkx as nx
from urllib.request import urlopen
import matplotlib.pyplot as plt

def read_lj_friends(g , name):
    # fetch the friend-list from LiveJournal
    response = urlopen("http://www.livejournal.com/misc/fdata.bml?user="+ name)
    # walk through the lines in the response and add each one as an edge in a network
    for line in response.readlines():
        # comments in the response start with a "#"
        if str(line)[0] == '#': continue
        parts = line.split()
        if len(parts) == 0: continue
        if parts[0] == '<':
            g.add_edge(parts[1, name])
        else:
            g.add_edge(name, parts[1])

g = nx.Graph()
read_lj_friends(g, 'valerois')
nx.draw(g)
plt.show()