package com.company.gate.logic;
import java.util.Arrays;

/**
 * This file defines the Gate class.
 */
public class Gate {
    public static final int IN = 1;
    public static final int OUT = -1;
    public static final int CLOSED = 0;
    private int mSwing = CLOSED;

    public boolean open(int direction) {
        return (Arrays.asList(IN, OUT).contains(direction)) ? setSwing(direction) : false;
    }

    public int getSwingDirection() { return mSwing; }

    public void close() { mSwing = CLOSED; }

    public int thru(int count) {
        if (mSwing == IN) return count;
        if (mSwing == OUT) return -count;
        return 0;
    }

    public boolean setSwing(int direction) {
        if (Arrays.asList(IN, OUT, CLOSED).contains(direction)) {
            mSwing = direction;
            return true;
        }
        return false;
    }

    public String toString() {
        if (mSwing == IN) return "This gate is open and swings to enter the pen only";
        if (mSwing == OUT) return "This gate is open and swings to exit the pen only";
        if (mSwing == CLOSED) return "This gate is closed";
        return "This gate has an invalid swing direction";
    }
}
