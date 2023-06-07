package com.mobprogramming.kata;

import org.junit.Assert;
import org.junit.Test;

public class GameBoardTest {

  @Test
  public void gameBoardShouldHave3x3Grid() {
    GameBoard gameBoard = new GameBoard();
    Assert.assertEquals(9, gameBoard.getNumberOfFields());
  }


}
