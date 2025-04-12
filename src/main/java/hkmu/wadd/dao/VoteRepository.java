package hkmu.wadd.dao;

import hkmu.wadd.model.Vote;
//import hkmu.wadd.model.VoteId;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface VoteRepository extends JpaRepository<Vote, UUID> {
Vote findByPollIdAndUsername(Long pollId, String username);
}
