package com.mobprogramming.kata;

import org.junit.Assert;
import org.junit.Test;

/** Unit test for simple App. */
public class TicTacToeTest {

  @Test
  public void gameBoardShouldNotBeNull() {
    TicTacToe ticTacToe = new TicTacToe();
    Assert.assertNotNull(ticTacToe.getBoard());
  }
}
