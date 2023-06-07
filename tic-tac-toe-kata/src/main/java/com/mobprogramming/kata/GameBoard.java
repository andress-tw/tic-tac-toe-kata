package com.mobprogramming.kata;

public class GameBoard {

    private final FieldState[][] grid;

    public GameBoard() {
        this.grid = new FieldState[3][3];
    }

    public int getNumberOfFields() {
    return grid.length * grid[0].length;
    }
}
