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
        //should be changed as the form submission will return an associative array. SQL queries will be needed too.
        if ($tuple->getIndex(0) == $tuple->getIndex(2)) {//will be array[playerOne] == array[winner]
            //temporary objects for players will need to be created.
            $tuple->getIndex(0)->matchup($tuple->getIndex(1), 1);//should be changed to use a float as the result.
            $tuple->getIndex(1)->matchup($tuple->getIndex(0), 0);
        } elseif ($tuple->getIndex(1) == $tuple->getIndex(2)) {//will be array[playerTwo] == array[winner]
            $tuple->getIndex(1)->matchup($tuple->getIndex(0), 1);
            $tuple->getIndex(0)->matchup($tuple->getIndex(1), 0);
        } else {
            #Can only result in this case from bad input. Exception thrown.
            #TODO: exceptions in PHP???
    }
}

//Takes characters for each game in a match and does ELO evaluations for each game.
//List contains tuples with 3 characters: 1st, 2nd, winner


//Will probably need to be redone with associative arrays and SQL queries.
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

//Uses previous functions to update database for an entire match (players, characters, maps)
//$matchlist is a list of tuples, each tuple consisting of an associative list and a player.
//The associative list contains the player and the character they played.

//May need server queries to create instance objects to represent players, and characters.
function updateMatch($matchList) {
    $playerOne = 0;
    $playerTwo = 0;
    foreach ($matchList as $tuple) {
        if (($tuple->getIndex(0))->getIndex(0) == $tuple->getIndex(2)) {
            $playerOne++;
        } elseif (($tuple->getIndex(1))->getIndex(0) == $tuple->getIndex(2)) {
            $playerTwo++;
        }
    }
    $playerOne = float($playerOne)/3;
    $playerTwo = float($playerTwo)/3;

    //Do database queries for rating and then call the "multiple" function to recalculate values.
    //Functions may need to be modified to return integers rather than altering objects, but could
    //also implement functions to send data to the database from objects easily enough.


    //Character ELO ranking changes need to be done too.
}

?>
