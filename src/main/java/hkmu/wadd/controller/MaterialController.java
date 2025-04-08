package hkmu.wadd.controller;

import hkmu.wadd.dao.MaterialService;
import hkmu.wadd.exception.MaterialNotFoundException;
import hkmu.wadd.model.Material;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/admin/materials")
public class MaterialController {

    @Resource
    private MaterialService materialService;

    @GetMapping("")
    public String listMaterials(ModelMap model) {
        model.addAttribute("materials", materialService.getAllMaterials());
        return "admin/materials";
    }

    @GetMapping("/course/{courseId}")
    public String listCourseSpecificMaterials(@PathVariable("courseId") Long courseId, ModelMap model) {
        model.addAttribute("materials", materialService.getMaterialsByCourse(courseId));
        model.addAttribute("courseId", courseId);
        return "admin/courseMaterials";
    }

    @GetMapping("/course/view/{courseId}")
    public String viewCourse(@PathVariable("courseId") Long courseId, ModelMap model) {
        model.addAttribute("materials", materialService.getMaterialsByCourse(courseId));
        model.addAttribute("courseId", courseId);
        return "view/admin/viewCourse";
    }

    @GetMapping("/poll/view/{pollId}")
    public String viewPoll(@PathVariable("pollId") Long pollId, ModelMap model) {
        model.addAttribute("pollId", pollId);
        return "view/admin/viewPoll";
    }

    @GetMapping("/create")
    public ModelAndView createMaterialForm() {
        return new ModelAndView("admin/createMaterial", "materialForm", new MaterialForm());
    }

    @PostMapping("/create")
    public View createMaterial(MaterialForm form) throws IOException {
        materialService.createMaterial(
                form.getTitle(),
                form.getDescription(),
                form.getCourseId(),
                form.getUploadedBy(),
                form.getFile()
        );
        return new RedirectView("/admin/materials", true);
    }

    @GetMapping("/batch-upload")
    public ModelAndView batchUploadForm() {
        return new ModelAndView("admin/batchUpload", "batchForm", new BatchUploadForm());
    }

    @PostMapping("/batch-upload")
    public View batchUpload(BatchUploadForm form) throws IOException {
        materialService.batchCreateMaterials(
                form.getTitle(),
                form.getDescription(),
                form.getCourseId(),
                form.getUploadedBy(),
                form.getFiles()
        );
        return new RedirectView("/admin/materials", true);
    }

    @GetMapping("/edit/{id}")
    public ModelAndView editMaterialForm(@PathVariable("id") Long id) throws MaterialNotFoundException {
        Material material = materialService.getMaterial(id);
        MaterialForm form = new MaterialForm();
        form.setTitle(material.getTitle());
        form.setDescription(material.getDescription());
        form.setCourseId(material.getCourseId());
        
        return new ModelAndView("admin/editMaterial", "materialForm", form);
    }

    @PostMapping("/edit/{id}")
    public View editMaterial(@PathVariable("id") Long id, MaterialForm form) throws MaterialNotFoundException {
        materialService.updateMaterial(
                id,
                form.getTitle(),
                form.getDescription()
        );
        return new RedirectView("/admin/materials", true);
    }

    @GetMapping("/delete/{id}")
    public View deleteMaterial(@PathVariable("id") Long id) throws MaterialNotFoundException, IOException {
        materialService.deleteMaterial(id);
        return new RedirectView("/admin/materials", true);
    }

    // Form backing object
    public static class MaterialForm {
        private String title;
        private String description;
        private Long courseId;
        private String uploadedBy;
        private MultipartFile file;

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }

        public Long getCourseId() {
            return courseId;
        }

        public void setCourseId(Long courseId) {
            this.courseId = courseId;
        }

        public String getUploadedBy() {
            return uploadedBy;
        }

        public void setUploadedBy(String uploadedBy) {
            this.uploadedBy = uploadedBy;
        }

        public MultipartFile getFile() {
            return file;
        }

        public void setFile(MultipartFile file) {
            this.file = file;
        }
    }

    // Batch upload form
    public static class BatchUploadForm {
        private String title;
        private String description;
        private Long courseId;
        private String uploadedBy;
        private List<MultipartFile> files;

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }

        public Long getCourseId() {
            return courseId;
        }

        public void setCourseId(Long courseId) {
            this.courseId = courseId;
        }

        public String getUploadedBy() {
            return uploadedBy;
        }

        public void setUploadedBy(String uploadedBy) {
            this.uploadedBy = uploadedBy;
        }

        public List<MultipartFile> getFiles() {
            return files;
        }

        public void setFiles(List<MultipartFile> files) {
            this.files = files;
        }
    }
} 