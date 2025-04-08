package hkmu.wadd.controller;

import hkmu.wadd.dao.CommentService;
import hkmu.wadd.model.Comment;
import jakarta.annotation.Resource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/comments")
public class CommentController {

    @Resource
    private CommentService commentService;
    
    // Display all comments
    @GetMapping("")
    public String listComments(ModelMap model) {
        model.addAttribute("comments", commentService.getAllComments());
        return "view/admin/comments";
    }
    
    // Display comments for a specific course
    @GetMapping("/course/{courseId}")
    public String viewCourseComments(@PathVariable("courseId") Long courseId, ModelMap model) {
        List<Comment> comments = commentService.getCourseComments(courseId);
        model.addAttribute("comments", comments);
        model.addAttribute("entityType", "COURSE");
        model.addAttribute("entityId", courseId);
        model.addAttribute("title", "Course Comments");
        return "view/admin/entityComments";
    }
    
    // Display comments for a specific poll
    @GetMapping("/poll/{pollId}")
    public String viewPollComments(@PathVariable("pollId") Long pollId, ModelMap model) {
        List<Comment> comments = commentService.getPollComments(pollId);
        model.addAttribute("comments", comments);
        model.addAttribute("entityType", "POLL");
        model.addAttribute("entityId", pollId);
        model.addAttribute("title", "Poll Comments");
        return "view/admin/entityComments";
    }
    
    // Show form to add a course comment
    @GetMapping("/course/{courseId}/add")
    public String addCourseCommentForm(@PathVariable("courseId") Long courseId, ModelMap model) {
        model.addAttribute("entityType", "COURSE");
        model.addAttribute("entityId", courseId);
        model.addAttribute("title", "Add Course Comment");
        return "view/admin/addComment";
    }
    
    // Show form to add a poll comment
    @GetMapping("/poll/{pollId}/add")
    public String addPollCommentForm(@PathVariable("pollId") Long pollId, ModelMap model) {
        model.addAttribute("entityType", "POLL");
        model.addAttribute("entityId", pollId);
        model.addAttribute("title", "Add Poll Comment");
        return "view/admin/addComment";
    }
    
    // Process adding a comment
    @PostMapping("/add")
    public View addComment(CommentForm form) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        
        if ("COURSE".equals(form.getEntityType())) {
            commentService.createCourseComment(form.getContent(), form.getEntityId(), username);
            return new RedirectView("/admin/comments/course/" + form.getEntityId(), true);
        } else if ("POLL".equals(form.getEntityType())) {
            commentService.createPollComment(form.getContent(), form.getEntityId(), username);
            return new RedirectView("/admin/comments/poll/" + form.getEntityId(), true);
        }
        
        return new RedirectView("/admin/comments", true);
    }
    
    // Show form to edit a comment
    @GetMapping("/edit/{id}")
    public String editCommentForm(@PathVariable("id") Long id, ModelMap model) {
        Optional<Comment> comment = commentService.getComment(id);
        if (comment.isPresent()) {
            model.addAttribute("comment", comment.get());
            return "view/admin/editComment";
        }
        return "redirect:/admin/comments";
    }
    
    // Process editing a comment
    @PostMapping("/edit/{id}")
    public View editComment(@PathVariable("id") Long id, CommentForm form) {
        Optional<Comment> optionalComment = commentService.getComment(id);
        if (optionalComment.isPresent()) {
            Comment comment = optionalComment.get();
            commentService.updateComment(id, form.getContent());
            
            if ("COURSE".equals(comment.getEntityType())) {
                return new RedirectView("/admin/comments/course/" + comment.getEntityId(), true);
            } else if ("POLL".equals(comment.getEntityType())) {
                return new RedirectView("/admin/comments/poll/" + comment.getEntityId(), true);
            }
        }
        
        return new RedirectView("/admin/comments", true);
    }
    
    // Delete a comment
    @GetMapping("/delete/{id}")
    public View deleteComment(@PathVariable("id") Long id) {
        Optional<Comment> optionalComment = commentService.getComment(id);
        String redirectUrl = "/admin/comments";
        
        if (optionalComment.isPresent()) {
            Comment comment = optionalComment.get();
            String entityType = comment.getEntityType();
            Long entityId = comment.getEntityId();
            
            commentService.deleteComment(id);
            
            if ("COURSE".equals(entityType)) {
                redirectUrl = "/admin/comments/course/" + entityId;
            } else if ("POLL".equals(entityType)) {
                redirectUrl = "/admin/comments/poll/" + entityId;
            }
        }
        
        return new RedirectView(redirectUrl, true);
    }
    
    // Form backing object
    public static class CommentForm {
        private String content;
        private String entityType;
        private Long entityId;
        
        public String getContent() {
            return content;
        }
        
        public void setContent(String content) {
            this.content = content;
        }
        
        public String getEntityType() {
            return entityType;
        }
        
        public void setEntityType(String entityType) {
            this.entityType = entityType;
        }
        
        public Long getEntityId() {
            return entityId;
        }
        
        public void setEntityId(Long entityId) {
            this.entityId = entityId;
        }
    }
} 