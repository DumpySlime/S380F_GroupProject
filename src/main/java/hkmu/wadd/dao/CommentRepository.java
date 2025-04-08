package hkmu.wadd.dao;

import hkmu.wadd.model.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {
    
    // 查找特定实体类型和ID的所有评论
    List<Comment> findByEntityTypeAndEntityIdOrderByCreatedAtDesc(String entityType, Long entityId);
    
    // 查找特定实体类型的所有评论
    List<Comment> findByEntityTypeOrderByCreatedAtDesc(String entityType);
    
    // 根据创建者查找评论
    List<Comment> findByCreatedByOrderByCreatedAtDesc(String createdBy);
} 