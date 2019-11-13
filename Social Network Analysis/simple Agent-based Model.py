# to start a simple model
import networkx as nx
import random
import matplotlib.pyplot as plt

class Person(object):
    def __init__(self,id):
        self.id = id # personal id
        self.i = random.random()# an initial attitude
        self.a = self.i # the influencial attitude after all the influence of his friends
        self.alpha = 1 # factor: level of trust
    def __str__(self):
        return (str(self.id))
    def step(self):
        # loop all the neighbors and sum up all their preferences
        neighbors = g[self]
        # all the neighbors have the same weight
        w = 1 / float(len(neighbors) + 1)
        s = w * self.a
        for node in neighbors:
            s += w * node.a
        # update my opinion based on my initial attitude and the influence of my neighbors
        self.a = (1 - self.alpha) * self.i + self.alpha * s

class Influencer(Person):
    def __init__(self,id):
        self.id = id
        self.i = random.random()
        self.a = 1 # they have s strong power and can not be alterd
    def step(self):
        pass

density = 0.9
g = nx.Graph()

# generate a network that based on the Object Person
for i in range(10):
    p = Person(i)
    g.add_node(p)

# generate a simple random network
for x in g.nodes():
    for y in g.nodes():
        if random.random() <= density:
            g.add_edge(x,y)

influencers = 2
connections = 4
# add the influencers to the network and connect them with 3 other nodes
for i in range(influencers):
    inf = Influencer("Inf"+str(i))
    for x in range(connections):
        g.add_edge(random.choice(g.nodes()), inf)

# repeat 30 time periods
for i in range(30):
    # loop all the nodes to let them take the first step
    for node in g.nodes():
        node.step()

    # collect the sum of the attitude, and print them to the terminal
    col = [n.a for n in g.nodes()]
    plt.plot(col)
plt.show()

# draw the network and show the color of the nodes based on their numbers
col = [n.a for n in g.nodes()]
pos = nx.spring_layout(g)
nx.draw_networkx(g, pos = pos, node_color = col)
plt.show()
