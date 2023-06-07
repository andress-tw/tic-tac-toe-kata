package com.mobprogramming.kata;

import org.junit.Assert;
import org.junit.Test;

/** Unit test for simple App. */
public class AppTest {

  @Test
  public void gameShouldHave9Fields() {
    TicTacToe ticTacToe = new TicTacToe();
    Assert.assertEquals(9, ticTacToe.getBoard().getNumberOfFields());
  }

  @Test
  public void gameBoardShouldNotBeNull() {
    TicTacToe ticTacToe = new TicTacToe();
    Assert.assertNotNull(ticTacToe.getBoard());
  }
}
