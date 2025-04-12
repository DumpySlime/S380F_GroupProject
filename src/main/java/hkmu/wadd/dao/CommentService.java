package hkmu.wadd.dao;

import hkmu.wadd.exception.CommentNotFound;
import hkmu.wadd.exception.LectureNotFound;
import hkmu.wadd.exception.PollNotFound;
import hkmu.wadd.model.Comment;
import hkmu.wadd.model.Lecture;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.security.Principal;
import java.time.LocalDateTime;
import java.util.List;

@Service
@Transactional
public class CommentService {
    @Resource
    CommentRepository commentRepository;

    @Resource
    LectureRepository lectureRepository;

    //@Resource
    //PollRepository pollRepository;

    // Service for lecture
    @Transactional
    public List<Comment> getCommentsByLectureId(long lectureId) {
        Lecture lecture = lectureRepository.findById(lectureId).orElse(null);
        if (lecture != null) {
            return commentRepository.findByLecture(lecture);
        }
        return List.of();
    }

    @Transactional
    public void addCommentToLecture(String username, String context, long lectureId) throws LectureNotFound, IOException {
        Lecture lecture = lectureRepository.findById(lectureId).orElse(null);
        Comment newComment = new Comment();
        newComment.setContext(context);
        newComment.setLecture(lecture);
        newComment.setUsername(username);
        newComment.setCreateTime(LocalDateTime.now());
        commentRepository.save(newComment);
    }

    @Transactional(rollbackFor = LectureNotFound.class)
    public void deleteCommentFromLecture(long lectureId, long commentId)
            throws LectureNotFound, CommentNotFound, IOException {
        Lecture lecture = lectureRepository.findById(lectureId).orElse(null);
        if (lecture == null) {
            throw new LectureNotFound(lectureId);
        }
        for (Comment comment : lecture.getComments()) {
            if (comment.getId() == commentId) {
                lecture.deleteComment(comment);
                lectureRepository.save(lecture);
                return;
            }
        }
        throw new CommentNotFound(commentId);
    }

    // Service for poll
/*
    @Transactional
    public List<Comment> getCommentByPollId(long pollId) {
        Poll poll = pollRepository.findById(pollId).orElse(null);
        if (poll != null) {
            return commentRepository.findByPoll(poll);
        }
        return List.of();
    }

    @Transactional void addCommentToPoll(long pollId, String comment, String username) throws PollNotFound, IOException {
        Poll poll = pollRepository.findById(pollId).orElse(null);
        Comment newComment = new Comment();
        newComment.setComment(comment);
        newComment.setPoll(poll);
        newComment.setUser(username);
        newComment.setPollId(pollId);
        commentRepository.save(newComment);
    }*/
}
