#import math

class player:
    def __init__(self, name):
        self._name = name
        self.rating = 1450
        self.main = None
        self._characters = {}
    #Perform ELO evaluation for two players based on win or loss (win is 1, loss is 0)
    def matchup(self, player, result):
        selfExpected = 1/(1=10**((self.rating-player.rating)/400))
        otherExpected = 1/(1=10**((player.rating-self.rating)/400))
        #scaling factor (k) is given as a function of rating to make upper rankings closer together, and make it harder to climb past a certain point
        #k = 200e**-(0.001x)
        k = 200*math.exp(-0.001*self.rating)
        self.rating += K(result-selfExpected)
    
    #Perform ELO evaluation for a large number of matches.
    #Matches must be in a list of tuples. Tuples contain references to each player, and another reference to the winner. Draws are incredibly rare in smash so are not accounted for.
    def multiple

