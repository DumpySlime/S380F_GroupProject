package hkmu.wadd.dao;

import hkmu.wadd.exception.LectureNotFound;
import hkmu.wadd.exception.PollNotFound;
import hkmu.wadd.model.Poll;
import hkmu.wadd.model.Vote;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.List;

@Service
public class PollService {
    @Resource
    private PollRespsitory pollRespsitory;

    @Transactional
    public List<Poll> getPolls() {
        return pollRespsitory.findAll();
    }

    @Transactional
    public Poll getPoll(long pollId) throws PollNotFound {
        Poll poll = pollRespsitory.findById(pollId).orElse(null);
        if (poll == null) {
            throw new PollNotFound(pollId);
        }
        return poll;
    }

    @Transactional(rollbackFor = PollNotFound.class)
    public void delete(long pollId) throws PollNotFound {
        Poll deletedTicket = pollRespsitory.findById(pollId).orElse(null);
        if (deletedTicket == null) {
            throw new PollNotFound(pollId);
        }
        pollRespsitory.delete(deletedTicket);
    }

    @Transactional
    public long createPoll(String question, String author, String option1, String option2, String option3, String option4) throws IOException {
        Poll poll = new Poll();
        poll.setQuestion(question);
        poll.setAuthor(author);
        poll.setOptionA(option1);
        poll.setOptionB(option2);
        poll.setOptionC(option3);
        poll.setOptionD(option4);

        Poll savedPoll = pollRespsitory.save(poll);
        return savedPoll.getPollId();
    }

    @Transactional(rollbackFor = LectureNotFound.class)
    public void deletePoll(long pollId) throws PollNotFound {
        Poll poll = pollRespsitory.findById(pollId).orElseThrow(() -> new PollNotFound(pollId));
        pollRespsitory.delete(poll);
    }

    // Update/Add user vote
    @Transactional
    public void vote(Long pollId, String userId, String selectedOption) {
        Poll poll = pollRespsitory.findById(pollId).orElseThrow(() -> new PollNotFound(pollId));

        Vote existingVote = findVoteByUser(poll, userId);

        if (existingVote != null) {
            existingVote.setSelectedOption(selectedOption);
        } else {
            Vote newVote = new Vote();
            newVote.setPoll(poll);
            newVote.setUserId(userId);
            newVote.setSelectedOption(selectedOption);
            poll.getVotes().add(newVote);
        }

        pollRespsitory.save(poll);
    }

    private Vote findVoteByUser(Poll poll, String userId) {
        return poll.getVotes().stream()
                .filter(vote -> vote.getUserId().equals(userId))
                .findFirst()
                .orElse(null);
    }
}
