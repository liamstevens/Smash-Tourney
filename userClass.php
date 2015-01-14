<?php

class userClass {
    //Nick is the handle that the player wishes to be known by.
    //Admin flag is set as either 1 or 0
    //Game rankings is an associative array of game names and rankings
    public function _construct($nick, $adminflag, $gameRankings) {
       $this->nick = $nick;
       $this->adminflag = $adminflag;
       $this->gameRankings = $gameRankings;
    }
//will do SQL requests for information for the page
    public function updatePage(){

    }

 }

 ?>
