package hkmu.wadd.dao;

import hkmu.wadd.model.Vote;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

public interface VoteRepository extends JpaRepository<Vote, UUID> {
    Vote findByPollIdAndUsername(Long pollId, String username);
    List<Vote> findByUsername(String username);
    @Modifying
    @Transactional
    @Query("DELETE FROM Vote v WHERE v.username = :username")
    void deleteByUsername(@Param("username") String username);
}
