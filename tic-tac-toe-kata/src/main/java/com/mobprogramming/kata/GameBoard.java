package com.mobprogramming.kata;

public class GameBoard {

    private final FieldState[][] grid;

    public GameBoard() {
        this.grid = new FieldState[3][3];
        for(int i = 0; i < grid.length; i++) {
            for(int j = 0; j < grid[i].length; j++) {
                grid[i][j] = FieldState.NOT_SET;
            }
        }
    }

    public int getNumberOfFields() {
    return grid.length * grid[0].length;
    }


    public FieldState getField(int x, int y) {
        return grid[x][y];
    }
}
