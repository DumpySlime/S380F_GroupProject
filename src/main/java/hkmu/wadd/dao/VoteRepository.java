package hkmu.wadd.dao;

import hkmu.wadd.model.Vote;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface VoteRepository extends JpaRepository<Vote, UUID> {
    Vote findByPollIdAndUsername(Long pollId, String username);
    List<Vote> findByUsername(String username);
}
