<?php
class characterClass {

    public function _construct($name) {
        $this->name = $name;
        $this->rating = 1450;
    }

    public function getRating(){
        return $this->rating;
    }

    public function matchup($player, $result) {
        $thisExpected = 1/(

    }

}

?>


class character:
    def __init__(self, name):
        self._name = name
        self.rating = 1450

    def __str__(self):
        print self._name +": "+self.rating

#Functionally identical to ELO rankings for players
    def updateRating(self, value):
        self.rating += value

    #Perform ELO evaluation for two characters based on win or loss (win is 1, loss is 0)
    def matchup(self, player, result):
        selfExpected = 1/(1+10**((self.rating-player.rating)/400))
        otherExpected = 1/(1+10**((player.rating-self.rating)/400))
        #scaling factor (k) is given as a function of rating to make upper rankings closer together, and make it harder to climb past a certain point
        #k = 200e**-(0.001x)
        k = 200*math.exp(-0.001*self.rating)
        selfValue = K(result-selfExpected)
        self.updateRating(selfValue)


//Class to represent tuples (contain
class tupleClass {
    public $contents = [];

    public function _construct($playerOne, $playerTwo, $winner) {
        $this->contents[] = $playerOne;
        $this->contents[] = $playerTwo;
        $this->contents[] = $winner;
    }

    public function getIndex($index) {
        return ($this->contents)[$index];
    }

}
