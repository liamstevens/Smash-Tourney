<?php
//Class for representing characters
class characterClass {

    public function _construct($name) {
        $this->name = $name;
        $this->rating = 1450;
        $this->wins = 0;
        $this->losses = 0;
    }
//Returns the rating for a given character
    public function getRating(){
        return $this->rating;
    }
//Updates a rating for a given character
    public function updateRating($value) {
        $this->rating = value;
    }
//Determines and applies a rating change for a matchup between characters
    public function matchup($player, $result) {
        $thisExpected = 1/(1+10**(($this->rating-$player->rating)/400));
        $otherExpected = 1/(1+10**(($player->rating-$this->rating)/400));
        #scaling factor (k) is given as a function of rating to make upper rankings closer together, and make it harder to climb past a certain point
        #k = 200e**-(0.001x)
        $k = 200*exp(-0.001*$this->rating);
        $newRating = $k*($result-$thisExpected);
        $self->updateRating($newRating);
    }
//Adds a win to a character's record
    public function addWin() {
        $this->wins++;
    }
    
//Adds a loss to a character's record
    public function addLoss() {
        $this->losses++;
    }
}

?>

