<?php
//Class for representing players.
class playerClass {

    public function _construct($playName) {
        $this->name = $playName;
        $this->rating = 1450;
        $this->main = [];
        $this->characters = [];
    }
//Adds a main to a player
    public function addMain($newMain) {
        $this->main = $newMain;
    }
//Updates the rating of the player
    public function updateRating($update) {
        $this->rating += $update;
    }
//Returns a player's rating
    public function getRating() {
       return $this->rating; 
    }

//This function takes another player, and a float, representing the ratio of games won to lost
    public function matchup($player, $result) {
        $thisExpected = 1/(1+10**(($player->rating-$this->rating)/400));
        #scaling factor (k) is given as a function of rating to make upper rankings closer together, and make it harder to climb past a certain point
        #k = 200e**-(0.001x)
        $k = 200*exp(-0.001*$this->rating);
        $newRating = $k*($result-$thisExpected);
        $this->updateRating($newRating);
    }

    public function addChar($name) {
        $tup = new tupleClass($name, 0, 0);
        $this->characters = $tup;
    }

}
