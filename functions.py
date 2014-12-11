import playerClass
import math
import hashlib

#Perform ELO evaluation for a large number of matches.
#Matches must be in a list of tuples. Tuples contain references to each player, and another reference to the winner. Draws are incredibly rare in smash so are not accounted for.
def multiple(list):
    for i in list:
        if i[0] is i[2]:
            #allows for identical players, unlikely to be needed but is good design in a robust system
            #if the first player is the winner, call the method for this case
            i[0].matchup(i[1], 1)
            i[1].matchup(i[0], 0)
        else if i[1] is i[2]:
            i[1].matchup(i[0], 1)
            i[0].matchup(i[1], 0)
        else:
            #should not happen if input is correct, throw an exception
            #TODO: exception
        