import java.util.*;

public abstract class ICont {

    public abstract ICont apply();

    public void run() {
        ICont icont = this;
        try {
            icont.apply().run();
        } catch (RuntimeException e) {
            System.out.println(e.toString());
        }
    }










    // used to de-couple nested calls to apply
    public void trampoline() {
        ICont icont = this;
        try {
            while(true) 
                icont = icont.apply();
        } catch (RuntimeException e) {
            System.out.println(e.toString());
        }
    }

}
