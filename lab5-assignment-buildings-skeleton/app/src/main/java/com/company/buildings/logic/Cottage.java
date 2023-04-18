package com.company.buildings.logic;

/**
 * This is the cottage class file.  It is a subclass of House.
 */
public class Cottage
        extends House {

    private boolean mSecondFloor;

    public Cottage(int dimension, int lotLength, int lotWidth) {
        super(dimension, dimension, lotLength, lotWidth);
    }


    public Cottage(int dimension, int lotLength, int lotWidth, String owner, boolean secondFloor) {
        super(dimension, dimension, lotLength, lotWidth, owner);
        mSecondFloor = secondFloor;
    }

    public boolean hasSecondFloor() {
        return mSecondFloor;
    }

    @Override
    public String toString() {
        String result = "";

        result += super.toString();
        if (this.hasSecondFloor())
            result += "; is a two story cottage";
        else
            result += "; is a cottage";
        return result;
    }
}

