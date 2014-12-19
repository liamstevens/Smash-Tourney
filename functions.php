<?php 

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

//Performs ELO evaluation on a number of players,
//Must take a list of tupleClass objects. Each tupleClass object contains exactly three references to player objects (First, second and winning players).
//Draws are not accounted for as they are exceedingly rare in Smash.
function multiple($tupList) {
    foreach ($tupList as $tuple) {
        if ($tuple->getIndex(0) == $tuple->getIndex(2)) {
            $tuple->getIndex(0)->matchup($tuple->getIndex(1), 1);
            $tuple->getIndex(1)->matchup($tuple->getIndex(0), 0);
        } elseif ($tuple->getIndex(1) == $tuple->getIndex(2)) {
            $tuple->getIndex(1)->matchup($tuple->getIndex(0), 1);
            $tuple->getIndex(0)->matchup($tuple->getIndex(1), 0);
        } else {
            #Can only result in this case from bad input. Exception thrown.
            #TODO: exceptions in PHP???
    }
}

//Takes characters for each game in a match and does ELO evaluations for each game.
//List contains tuples with 3 characters: 1st, 2nd, winner
function modChars($charList) {
    foreach ($charList as $char) {
        if ($char->getIndex(0) == $char->getIndex(2)) {
            $char->getIndex(0)->matchup($char->getIndex(1), 1);
            $char->getIndex(1)->matchup($char->getIndex(0), 0);
        } elseif ($char->getIndex(1) == $char->getIndex(2)) {
            $char->getIndex(1)->matchup($char->getIndex(0), 1);
            $char->getIndex(0)->matchup($char->getIndex(1), 0);
        } else {
            #Can only result in this case from bad input. Exception thrown.
            #TODO: exceptions in PHP???
        }


    }
}

 
//Updates player statistics given a player object and an integer for representing the result
function addCharRes($result, $player) {
    if($result) {
       $player->wins++;
    } else {
        $player->losses++;
    }
}



?>
#Modify character specific stats for a player.
#Format is a list of tuples. Each tuple contains character name, number of wins, and number of losses.
def modChars(charList):
    


#Global character ELO rankings modifier. Called whenever a match is used to update player rankings
#TODO: this as well
