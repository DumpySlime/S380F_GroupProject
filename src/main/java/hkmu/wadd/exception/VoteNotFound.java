package hkmu.wadd.exception;

//import hkmu.wadd.model.VoteId;

import java.util.UUID;

public class VoteNotFound extends RuntimeException {
    public VoteNotFound(String username, UUID voteId, long pollId) {
        super("VoteId " + voteId + " from User " + username + " in Poll " + pollId + " not found");
    }
    public VoteNotFound(UUID voteId) {
        super("VoteId " + voteId + " not found");
    }
}
