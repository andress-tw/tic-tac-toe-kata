package com.mobprogramming.kata;

import junit.framework.TestCase;
import org.junit.Assert;

/**
 * Unit test for simple App.
 */
public class AppTest 
    extends TestCase
{

    private static final String INPUT = "123456";

    public void testLength() {
        Assert.assertEquals(64, App.sha256hex(INPUT).length());
    }

    public void testHex() {
        String expected = "8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92";
        Assert.assertEquals(expected, App.sha256hex(INPUT));
    }

    public void gameShouldHave9Fields() {
        TicTacToe ticTacToe = new TicTacToe();

        Assert.assertEquals();
    }
}
