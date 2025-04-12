package hkmu.wadd.controller;

import hkmu.wadd.dao.CommentService;
import hkmu.wadd.exception.CommentNotFound;
import hkmu.wadd.exception.LectureNotFound;
import hkmu.wadd.model.Comment;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/index")
public class CommentController {
    @Resource
    private CommentService commentService;

    public CommentController(CommentService commentService) {
        this.commentService = commentService;
    };
/*
    @GetMapping("/lecture/view/{lectureId}/comments/")
    public String listComments(@PathVariable("lectureId") long lectureId, Principal principal, Model model) {
        List<Comment> comments = commentService.getCommentsByLectureId(lectureId);
        model.addAttribute("comments", comments);
        return "/lecture/view/{lectureId}/comments/list";
    }
*/
    // Add comment to lecture
    @PostMapping("/lecture/view/{lectureId}/comments/addComment")
    public String addComment(@PathVariable("lectureId") long lectureId,
                             @RequestParam("context") String context, Principal principal)
            throws LectureNotFound, IOException {
        String currentUser = principal.getName();
        commentService.addCommentToLecture(currentUser, context, lectureId);
        return "redirect:/index/lecture/view/" + lectureId;
    }

    @PostMapping("/lecture/view/{lectureId}/comments/deleteComment/{commentId}")
    public String deleteComment(@PathVariable("lectureId") long lectureId,
                                @PathVariable("commentId") long commentId)
            throws LectureNotFound, IOException, CommentNotFound {
        commentService.deleteCommentFromLecture(lectureId, commentId);
        return "redirect:/index/lecture/view/" + lectureId;
    }
/*
    //Add comment to poll
    @PostMapping("/poll/view/{pollId}/comment/addComment")
    public String addComment(@PathVariable("pollId") long pollId, @RequestParam("comment") String comment, Principal principal) {
        String currentUser = principal.getName();
        commentService.addComment(currentUser, comment, pollId);
        return "/poll/view/{lectureId}/comment/list";
    }*/
}
