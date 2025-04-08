package hkmu.wadd.dao;

import hkmu.wadd.model.Comment;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class CommentService {
    
    @Resource
    private CommentRepository commentRepository;
    
    // 获取所有评论
    public List<Comment> getAllComments() {
        return commentRepository.findAll();
    }
    
    // 获取特定评论
    public Optional<Comment> getComment(Long id) {
        return commentRepository.findById(id);
    }
    
    // 获取特定课程的所有评论
    public List<Comment> getCourseComments(Long courseId) {
        return commentRepository.findByEntityTypeAndEntityIdOrderByCreatedAtDesc("COURSE", courseId);
    }
    
    // 获取特定投票的所有评论
    public List<Comment> getPollComments(Long pollId) {
        return commentRepository.findByEntityTypeAndEntityIdOrderByCreatedAtDesc("POLL", pollId);
    }
    
    // 创建课程评论
    @Transactional
    public Comment createCourseComment(String content, Long courseId, String createdBy) {
        Comment comment = new Comment();
        comment.setContent(content);
        comment.setEntityType("COURSE");
        comment.setEntityId(courseId);
        comment.setCreatedBy(createdBy);
        
        return commentRepository.save(comment);
    }
    
    // 创建投票评论
    @Transactional
    public Comment createPollComment(String content, Long pollId, String createdBy) {
        Comment comment = new Comment();
        comment.setContent(content);
        comment.setEntityType("POLL");
        comment.setEntityId(pollId);
        comment.setCreatedBy(createdBy);
        
        return commentRepository.save(comment);
    }
    
    // 更新评论
    @Transactional
    public Comment updateComment(Long id, String content) {
        Optional<Comment> optionalComment = commentRepository.findById(id);
        if (optionalComment.isPresent()) {
            Comment comment = optionalComment.get();
            comment.setContent(content);
            return commentRepository.save(comment);
        }
        return null;
    }
    
    // 删除评论
    @Transactional
    public void deleteComment(Long id) {
        commentRepository.deleteById(id);
    }
} 