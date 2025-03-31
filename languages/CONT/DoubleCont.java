import java.util.*;

public class DoubleCont extends ICont {

    int n;
    int d;

    public DoubleCont(int n, int d) {
	    this.n = n;
	    this.d = d;
    }

    public DoubleCont apply() {
        if (n > 0) {
            n = n-1;     // n goes down by 1
            d = d+2;     // d goes up by 2
            apply();
            // return new DoubleCont(n,d).apply();
            // return new DoubleCont(n,d);
        }
        throw new IContException(d);
    }

    public static void main(String [] args) {
        DoubleCont dbl = new DoubleCont(100, 0);
        dbl.run();
    }

}


                
