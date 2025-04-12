package hkmu.wadd.controller;

import hkmu.wadd.dao.CommentService;
import hkmu.wadd.dao.PollService;
import hkmu.wadd.exception.CommentNotFound;
import hkmu.wadd.exception.LectureNotFound;
import hkmu.wadd.exception.PollNotFound;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequestMapping("/index")
public class CommentController {
    @Resource
    private CommentService commentService;

    @Resource
    PollService pollService;

    public CommentController(CommentService commentService) {
        this.commentService = commentService;
    };

    // Add comment to lecture
    @PostMapping("/lecture/view/{lectureId}/comments/addComment")
    public String addCommentToLecture(@PathVariable("lectureId") long lectureId,
                                      @RequestParam("context") String context, Principal principal)
            throws LectureNotFound, IOException {
        String currentUser = principal.getName();
        commentService.addCommentToLecture(currentUser, context, lectureId);
        return "redirect:/index/lecture/view/" + lectureId;
    }

    @PostMapping("/lecture/view/{lectureId}/comments/deleteComment/{commentId}")
    public String deleteCommentFromLecture(@PathVariable("lectureId") long lectureId,
                                           @PathVariable("commentId") long commentId)
            throws LectureNotFound, CommentNotFound {
        commentService.deleteCommentFromLecture(lectureId, commentId);
        return "redirect:/index/lecture/view/" + lectureId;
    }

    // Add comment to poll
    @PostMapping("/poll/vote/{pollId}/comments/addComment")
    public String addCommentToPoll(@PathVariable("pollId") long pollId,
                                   @RequestParam("context") String context, Principal principal) {
        String currentUser = principal.getName();
        commentService.addCommentToPoll(currentUser, context, pollId);
        return "redirect:/index/poll/vote/" + pollId;
    }

    @PostMapping("/poll/vote/{pollId}/comments/deleteComment/{commentId}")
    public String deleteCommentFromPoll(@PathVariable("pollId") long pollId,
                                        @PathVariable("commentId") long commentId)
            throws PollNotFound, CommentNotFound {
        commentService.deleteCommentFromPoll(pollId, commentId);
        return "redirect:/index/poll/vote/" + pollId;
    }
}