package hkmu.wadd.model;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;

import java.util.UUID;

@Entity
public class Vote {
    @Id
    @GeneratedValue
    @ColumnDefault("random_uuid()")
    private UUID id;

    @Column(name = "poll_id", insertable = false, updatable = false)
    private long pollId;
    @ManyToOne
    @JoinColumn(name = "poll_id")
    private Poll poll;

    private String userId;
    private String selectedOption;

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
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
