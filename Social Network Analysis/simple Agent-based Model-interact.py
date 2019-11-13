# to start a simple model
import networkx as nx
import random
import matplotlib.pyplot as plt

class Person(object):
    def __init__(self,id):
        self.id = id # personal id
        self.i = random.random()# an initial attitude
        self.a = self.i # the influencial attitude after all the influence of his friends
        self.alpha = 0.9 # factor: level of trust
    def __str__(self):
        return (str(self.id))

    def _roulette_choice(self,names,values, inverse = False):
        '''inverse = false means that names with higher numbers have a higer probability to be chosen'''
        wheel = names
        for i in range(len(names)):
            if not inverse:
                wheel.extend([names[i] for x in range(1+int(values[i]*10))])
            else:
                wheel.extend([names[i] for x in range(1+int((1-values[i])*10))])
        return (random.choice(wheel))

    def interact(self):
        '''
        randomly select a node to exchange idea instead of with all the neighbors
        use the wheel roulette choice instead of random choice
        '''
        neighbors = g[self].keys()
        values = [v['weight'] for v in g[self].values()]
        # flip dice to determine the probability of interaction
        # similarity(0.6), dissimilarity(0.3), random(0.1)
        r = random.random()
        if r <= 0.1 or len(neighbors)==0:
            partner = random.choice(g.nodes())
        elif r <= 0.4:
            partner = self._roulette_choice(neighbors,values,inverse=True)
        else:
            partner = self._roulette_choice(neighbors,values,inverse=False)

        w = 0.5
        s = self.a * w + partner.a * w
        self.a = (1 - self.alpha) * self.i + self.alpha * s
        g.add_edge(self,partner,weight = (1 - self.a - partner.a))


def consensus(g):
    '''calculate the consensus opinion'''
    aa = [n.a for n in g.nodes()]
    return min(aa),max(aa),sum(aa)/len(aa)

def trim_edges(g, weight=1):
    g2 = nx.Graph()
    for f, to, edata in g.edges(data=True):
        if edata != {}:
            if edata['weight'] > weight:
                g2.add_edge(f,to,edata)
    return g2

density = 0.9
decay_rate = 0.01
network_size = 100
runtime = 20
g = nx.Graph()

# generate a network that based on the Object Person
for i in range(network_size):
    p = Person(i)
    g.add_node(p)

# generate a simple random network
for x in g.nodes():
    for y in g.nodes():
        if random.random() <= density:
            g.add_edge(x,y,weight = random.random())

col=[n.a for n in g.nodes()]
pos=nx.spring_layout(g)
nx.draw_networkx(g,pos=pos, node_color=col,cmap=plt.cm.Reds)

cons = []
# repeat 30 time periods
for i in range(runtime):
    # loop all the nodes to let them take the first step
    for node in g.nodes():
        node.interact()

    # degrade edge weights by a fixed rate
    for f, t, data in g.edges(data=True):
        data['weight'] = data['weight'] * (1 - decay_rate)
        if data['weight'] < 0.1: g.remove_edge(f, t)

    col = [n.a for n in g.nodes()]
    ew = [1000 * edata['weight'] for f, to, edata in g.edges(data=True)]
    plt.figure(2)
    plt.plot(col)

    # collect the sum of the attitude, and print them to the terminal
    cons.append(consensus(g))

plt.figure(i)
g2=trim_edges(g, weight=0.3)
col=[n.a for n in g2.nodes()]
nx.draw_networkx(g2,node_color=col, cmap=plt.cm.Reds) #,edge_color=ew,edge_cmap=plot.cm.RdPu)

plt.figure(i+1)
plt.plot(cons)

plt.show()
