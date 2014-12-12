import math
class player:
    def __init__(self, name):
        self._name = name
        self.rating = 1450
        self.main = None
        self.characters = [()]

    def __str__(self):
        return "Name: "+self._name+" Rating: "+self.rating+ " Main: "+self.main
#Adds a "main" character to a player's statistics, if applicable
    def addMain(self, main):
        self.main = main

#Keeps track of games played with each character - this is for updating a record en masse
    def addChar(self, character, wins, losses):
        if character not in self.characters:
            self.characters[-1] = (character, wins, losses)
        else:
            for i in self.characters:
                if character in i:
                    i[1] = wins
                    i[2] = losses

#For updating player's character stats after a single match
    def charPlayed(self, character, result): 
        if character not in self.characters:
            self.characters[-1] = (character, 0, 0)
            if result == 1:
                self.characters[-1][1]++
            else:
                self.characters[-1][2]++
        else:
            for i in self.characters:
                if character in i:
                    if result == 1:
                        i[1]++
                    else:
                        i[2]++

#In case player name is wrong/wants it changed
    def changeName(self, name):
        self._name = name


#Ratings management
    def updateRating(self, value):
        self.rating += value

    #Perform ELO evaluation for two players based on win or loss (win is 1, loss is 0)
    def matchup(self, player, result):
        selfExpected = 1/(1=10**((self.rating-player.rating)/400))
        otherExpected = 1/(1=10**((player.rating-self.rating)/400))
        #scaling factor (k) is given as a function of rating to make upper rankings closer together, and make it harder to climb past a certain point
        #k = 200e**-(0.001x)
        k = 200*math.exp(-0.001*self.rating)
        selfValue = K(result-selfExpected)
        self.updateRating(selfValue)
            

