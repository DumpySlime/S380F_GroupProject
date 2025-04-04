package hkmu.wadd.model;

import jakarta.persistence.*;

@Entity
public class Poll {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long pollId;
    @Column(name = "name")
    private String
            question,
            author,
            option1,
            option2,
            option3,
            option4;

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

    public String getOption1() {
        return option1;
    }

    public void setOption1(String pollOption1) {
        this.option1 = pollOption1;
    }

    public String getOption2() {
        return option2;
    }

    public void setOption2(String pollOption2) {
        this.option2 = pollOption2;
    }

    public String getOption3() {
        return option3;
    }

    public void setOption3(String pollOption3) {
        this.option3 = pollOption3;
    }

    public String getOption4() {
        return option4;
    }

    public void setOption4(String pollOption4) {
        this.option4 = pollOption4;
    }
}
