package hkmu.wadd.dao;

import hkmu.wadd.exception.NoteNotFound;
import hkmu.wadd.exception.LectureNotFound;
import hkmu.wadd.model.Lecture;
import hkmu.wadd.model.Note;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class LectureService {
    @Resource
    private NoteRepository noteRepository;

    @Resource
    private LectureRepository lectureRepository;

    @Transactional
    public List<Lecture> getLectures() {
        return lectureRepository.findAll();
    }

    @Transactional
    public Lecture getLecture(long id)
            throws LectureNotFound {
        Lecture lecture = lectureRepository.findById(id).orElseThrow(() -> new LectureNotFound(id));
        return lecture;
    }

    @Transactional
    public Note getNote(long lectureId, UUID noteId) throws LectureNotFound, NoteNotFound {
        Lecture lecture = lectureRepository.findById(lectureId).orElse(null);
        if (lecture == null) {
            throw new LectureNotFound(lectureId);
        }
        Note note = noteRepository.findById(noteId).orElse(null);
        if (note == null) {
            throw new NoteNotFound(noteId);
        }
        return note;
    }

    @Transactional(rollbackFor = LectureNotFound.class)
    public void delete(long id) throws LectureNotFound {
        Lecture deletedLecture = lectureRepository.findById(id).orElse(null);
        if (deletedLecture == null) {
            throw new LectureNotFound(id);
        }
        lectureRepository.delete(deletedLecture);
    }

    @Transactional(rollbackFor = LectureNotFound.class)
    public void deleteNote(long lectureId, UUID noteId)
            throws NoteNotFound, LectureNotFound {
        Lecture lecture = lectureRepository.findById(lectureId).orElse(null);
        if (lecture == null) {
            throw new LectureNotFound(lectureId);
        }
        for (Note note : lecture.getNotes()) {
            if (note.getId().equals(noteId)) {
                lecture.deleteNote(note);
                lectureRepository.save(lecture);
                return;
            }
        }
        throw new NoteNotFound(noteId);
    }

    @Transactional
    public long createLecture(String teacherName, String lectureTitle,
                             String comment, List<MultipartFile> notes)
            throws IOException {
        Lecture lecture = new Lecture();
        lecture.setTeacherName(teacherName);
        lecture.setTitle(lectureTitle);
        lecture.setComment(comment);

        for (MultipartFile filePart : notes) {
            Note note = new Note();
            note.setName(filePart.getOriginalFilename());
            note.setMimeContentType(filePart.getContentType());
            note.setContents(filePart.getBytes());
            note.setLecture(lecture);
            if (note.getName() != null && note.getName().length() > 0
                    && note.getContents() != null
                    && note.getContents().length > 0) {
                note.getNotes().add(note);
            }
        }
        Lecture savedLecture = lectureRepository.save(lecture);
        return savedLecture.getId();
    }

    @Transactional(rollbackFor = LectureNotFound.class)
    public void updateLecture(long id, String teacherName, String lectureTitle,
                             String comment, List<MultipartFile> notes)
            throws IOException, LectureNotFound {
        Lecture updatedLecture = lectureRepository.findById(id).orElse(null);
        if (updatedLecture == null) {
            throw new LectureNotFound(id);
        }
        updatedLecture.setTeacherName(teacherName);
        updatedLecture.setTitle(lectureTitle);
        updatedLecture.setComment(comment);
        for (MultipartFile filePart : notes) {
            Note note = new Note();
            note.setName(filePart.getOriginalFilename());
            note.setMimeContentType(filePart.getContentType());
            note.setContents(filePart.getBytes());
            note.setLecture(updatedLecture);
            if (note.getName() != null && note.getName().length() > 0
                    && note.getContents() != null
                    && note.getContents().length > 0) {
                updatedLecture.getNotes().add(note);
            }
        }
        lectureRepository.save(updatedLecture);
    }
}
