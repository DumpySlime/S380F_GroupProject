package hkmu.wadd.dao;

import hkmu.wadd.exception.PollNotFound;
import hkmu.wadd.model.Poll;
import hkmu.wadd.model.Vote;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class PollService {
    @Resource
    private PollRepository pollRepository;

    @Resource
    private VoteRepository voteRepository;

    @Transactional
    public List<Poll> getUndeletedPolls() {
        if (pollRepository.count() != 0) {
        List<Poll> undeletedPolls = new ArrayList<>();
            for (Poll poll : pollRepository.findAll()) {
                if (!poll.isDeleted()) {
                    undeletedPolls.add(poll);
                }
            }
            return undeletedPolls;
        }
        return null;
   }

    @Transactional
    public List<Poll> getPolls() {
        return pollRepository.findAll();
    }

    @Transactional
    public Poll getPollById(Long pollId) throws PollNotFound { return pollRepository.findById(pollId).orElseThrow(() -> new PollNotFound(pollId)); }

    @Transactional(rollbackFor = PollNotFound.class)
    public void deletePoll(Long pollId) throws PollNotFound {
        Poll poll = pollRepository.findById(pollId).orElse(null);
        if (poll == null) {
            throw new PollNotFound(pollId);
        }

        poll.setDeleted(true);
        pollRepository.save(poll);
    }

    @Transactional
    public long createPoll(String question, String teacherName, String optionAText, String optionBText, String optionCText, String optionDText) {
        Poll poll = new Poll();
        poll.setTeacherName(teacherName);
        poll.setQuestion(question);
        poll.setOptionAText(optionAText);
        poll.setOptionBText(optionBText);
        poll.setOptionCText(optionCText);
        poll.setOptionDText(optionDText);
        Poll savedPoll = pollRepository.save(poll);
        return savedPoll.getId();
    }

    @Transactional(rollbackFor = PollNotFound.class)
    public void updatePoll(Long id, String question, String optionAText, String optionBText, String optionCText, String optionDText) throws PollNotFound {
        Poll updatedPoll = pollRepository.findById(id).orElse(null);
        if (updatedPoll == null) {
            throw new PollNotFound(id);
        }
        updatedPoll.setQuestion(question);
        updatedPoll.setOptionAText(optionAText);
        updatedPoll.setOptionBText(optionBText);
        updatedPoll.setOptionCText(optionCText);
        updatedPoll.setOptionDText(optionDText);
        pollRepository.save(updatedPoll);
    }
}
