package hkmu.wadd.dao;

import hkmu.wadd.exception.PollNotFound;
import hkmu.wadd.model.Poll;
import jakarta.annotation.Resource;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Service;

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
        poll.setOption1(option1);
        poll.setOption2(option2);
        poll.setOption3(option3);
        poll.setOption4(option4);

        Poll savedPoll = pollRespsitory.save(poll);
        return savedPoll.getPollId();
    }
}
