package hkmu.wadd.exception;

public class PollNotFound extends RuntimeException {
    public PollNotFound(long pollId) {
        super("Poll " + pollId + "Not Found");
    }
}
