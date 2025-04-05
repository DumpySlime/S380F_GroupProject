package hkmu.wadd.model;

import jakarta.persistence.*;

@Entity
public class Vote {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    private Poll poll;

    private String userId;
    private String selectedOption;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Poll getPoll() {
        return poll;
    }

    public void setPoll(Poll poll) {
        this.poll = poll;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getSelectedOption() {
        return selectedOption;
    }

    public void setSelectedOption(String selectedOption) {
        this.selectedOption = selectedOption;
    }

    @Override
    public String toString() {
        return "Vote{" +
                "id=" + id +
                ", poll=" + poll +
                ", userId='" + userId + '\'' +
                ", selectedOption='" + selectedOption + '\'' +
                '}';
    }
}
