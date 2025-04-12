package hkmu.wadd.dao;

import hkmu.wadd.exception.PollNotFound;
import hkmu.wadd.exception.VoteNotFound;
import hkmu.wadd.model.CourseUser;
import hkmu.wadd.model.Poll;
import hkmu.wadd.model.Vote;
//import hkmu.wadd.model.VoteId;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

@Service
public class VoteService {
    @Resource
    private VoteRepository voteRepository;
    @Resource
    private PollRepository pollRepository;
    @Resource
    private CourseUserRepository courseUserRepository;

    @Transactional
    public Vote getVote(String username, Long pollId, UUID voteId) {
        Poll poll = pollRepository.findById(pollId).orElse(null);
        if (poll == null) {
            throw new PollNotFound(pollId);
        }
        Vote vote = voteRepository.findById(voteId).orElse(null);
        if (vote == null) {
            throw new VoteNotFound(username, vote.getId(), pollId);
        }
        return vote;
    }

    @Transactional
    public Vote getUserVote(String username, Long pollId) {
        return voteRepository.findByPollIdAndUsername(pollId, username);
    }

    @Transactional
    public void addVoteToPoll(String username, long pollId, String choice) {
        Poll poll = pollRepository.findById(pollId).orElse(null);
        CourseUser courseUser = courseUserRepository.findByUsername(username).get();
        if (poll == null) {
            throw new PollNotFound(pollId);
        }
        Vote vote = new Vote();
        vote.setUsername(username);
        vote.setPollId(pollId);
        vote.setChoice(choice);
        vote.setCourseUser(courseUser);
        vote.setPoll(poll);
        voteRepository.save(vote);
    }
}
