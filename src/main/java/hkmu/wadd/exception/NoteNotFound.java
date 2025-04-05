package hkmu.wadd.exception;

import java.util.UUID;

public class NoteNotFound extends Exception {
    public NoteNotFound(UUID id) {
        super("Note "+ id +"Not Found");
    }
}
