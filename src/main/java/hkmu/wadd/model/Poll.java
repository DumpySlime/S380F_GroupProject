package hkmu.wadd.model;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
public class Poll {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long pollId;
    private String question;
    private String author;
    private String optionA;
    private String optionB;
    private String optionC;
    private String optionD;
    private String comment;
    @OneToMany(mappedBy = "poll", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Vote> votes = new ArrayList<>();

    public Long getPollId() {
        return pollId;
    }

    public void setPollId(Long pollId) {
        this.pollId = pollId;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String pollQuestion) {
        this.question = pollQuestion;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String pollCreater) {
        this.author = pollCreater;
    }

    public String getOptionA() {
        return optionA;
    }

    public void setOptionA(String pollOption1) {
        this.optionA = pollOption1;
    }

    public String getOptionB() {
        return optionB;
    }

    public void setOptionB(String pollOption2) {
        this.optionB = pollOption2;
    }

    public String getOptionC() {
        return optionC;
    }

    public void setOptionC(String pollOption3) {
        this.optionC = pollOption3;
    }

    public String getOptionD() {
        return optionD;
    }

    public void setOptionD(String pollOption4) {
        this.optionD = pollOption4;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public List<Vote> getVotes() {
        return votes;
    }

    public void setVotes(List<Vote> votes) {
        this.votes = votes;
    }

    public int getTotalVotes() {
        return votes.size();
    }

    @Override
    public String toString() {
        return "Poll{" +
                "pollId=" + pollId +
                ", question='" + question + '\'' +
                ", author='" + author + '\'' +
                ", option1='" + optionA + '\'' +
                ", option2='" + optionB + '\'' +
                ", option3='" + optionC + '\'' +
                ", option4='" + optionD + '\'' +
                ", comment='" + comment + '\'' +
                ", votes=" + votes +
                '}';
    }
}
