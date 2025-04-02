package hkmu.wadd.exception;

import java.util.UUID;

public class LectureNotFound extends Exception{
    public LectureNotFound(UUID id){
        super("Lecture" + id + "Not Found");
    }
}
