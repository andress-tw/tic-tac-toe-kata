package com.mobprogramming.kata;

public class GameBoard {

    private final String[][] grid;

    public GameBoard() {
        this.grid = new String[3][3];
    }

    public int getNumberOfFields() {
    return grid.length * grid[0].length;
    }
}
