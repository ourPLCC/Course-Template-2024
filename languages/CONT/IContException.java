public class IContException extends RuntimeException {

    public int n;

    public IContException(int n) {
        this.n = n;
    }

    public String toString() {
        return Integer.toString(n);
    }

}
