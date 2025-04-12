package hkmu.wadd.dao;

import hkmu.wadd.model.Comment;
import hkmu.wadd.model.Lecture;
import hkmu.wadd.model.Poll;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {
    List<Comment>findByLecture(Lecture lecture);
    List<Comment>findByPoll(Poll poll);
}
