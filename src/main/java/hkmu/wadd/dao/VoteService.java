package hkmu.wadd.dao;

import hkmu.wadd.exception.PollNotFound;
import hkmu.wadd.exception.VoteNotFound;
import hkmu.wadd.model.CourseUser;
import hkmu.wadd.model.Poll;
import hkmu.wadd.model.Vote;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
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
        Vote vote = voteRepository.findByPollIdAndUsername(pollId, username);
        return vote != null ? vote : null;
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
        vote.setCreateTime(LocalDateTime.now());
        voteRepository.save(vote);
    }

    @Transactional
    public List<Vote> getUserVotingHistory(String username) {
        return voteRepository.findByUsername(username);
    }

    @Transactional
    public void deleteByUsername(String username) {
        voteRepository.deleteByUsername(username);
    }
}
