package com.company.diamonds.logic;

import com.company.diamonds.ui.OutputInterface;

/**
 * This is where the logic of this App is centralized for this assignment.
 * <p>
 * The assignments are designed this way to simplify your early
 * Android interactions.  Designing the assignments this way allows
 * you to first learn key 'Java' features without having to beforehand
 * learn the complexities of Android.
 */
public class Logic implements LogicInterface {
    /**
     * This is a String to be used in Logging (if/when you decide you
     * need it for debugging).
     */
    public static final String TAG = Logic.class.getName();

    /**
     * This is the variable that stores our OutputInterface instance.
     * <p>
     * This is how we will interact with the User Interface [MainActivity.java].
     * <p>
     * It is called 'out' because it is where we 'out-put' our
     * results. (It is also the 'in-put' from where we get values
     * from, but it only needs 1 name, and 'out' is good enough).
     */
    private OutputInterface mOut;

    /**
     * This is the constructor of this class.
     * <p>
     * It assigns the passed in [MainActivity] instance (which
     * implements [OutputInterface]) to 'out'.
     */
    public Logic(OutputInterface out) {
        mOut = out;
    }

    /**
     * This is the method that will (eventually) get called when the
     * on-screen button labeled 'Process...' is pressed.
     */
    public void process(int size) {
        String start_symbols = '+' + repeat(size, "-", true) + '+';
        String str;

        mOut.println(start_symbols);
        for (int i = 0; i < size - 1; ++i) {
            str = repeat(size - 1 - i, " ", false);
            mOut.println('|' + str + '/' + repeat(i, ((i % 2 == 0) ? "=" : "-"), true) + '\\' + str + '|');
        }

        mOut.println("|<" + repeat(size - 1, ((size % 2 != 0) ? "=" : "-"), true)+ ">|") ;

        for (int i = size - 2; i > -1; --i) {
            str = repeat(size - 1 - i, " ", false);
            mOut.println('|' + str + '\\' + repeat(i, ((i % 2 == 0) ? "=" : "-"), true) + '/' + str + '|');
        }
        mOut.println(start_symbols);
    }

    public String repeat(int num, String symbol, boolean dual) {
        StringBuilder builder = new StringBuilder();
        if (dual) {
            num *= 2;
        }
        for (int i = 0; i < num; i++)
            builder.append(symbol);
        return builder.toString();
    }

}
