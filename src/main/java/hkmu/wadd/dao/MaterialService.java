package hkmu.wadd.dao;

import hkmu.wadd.exception.MaterialNotFoundException;
import hkmu.wadd.model.Material;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class MaterialService {
    
    @Resource
    private MaterialRepository materialRepository;
    
    private final Path uploadDirectory = Paths.get("uploads");
    
    public MaterialService() throws IOException {
        if (!Files.exists(uploadDirectory)) {
            Files.createDirectories(uploadDirectory);
        }
    }
    
    public List<Material> getAllMaterials() {
        return materialRepository.findAll();
    }
    
    public List<Material> getMaterialsByCourse(Long courseId) {
        return materialRepository.findByCourseId(courseId);
    }
    
    public Material getMaterial(Long id) throws MaterialNotFoundException {
        return materialRepository.findById(id)
                .orElseThrow(() -> new MaterialNotFoundException(id));
    }
    
    @Transactional
    public Long createMaterial(String title, String description, Long courseId, 
                              String uploadedBy, MultipartFile file) throws IOException {
        Material material = new Material();
        material.setTitle(title);
        material.setDescription(description);
        material.setCourseId(courseId);
        material.setUploadedBy(uploadedBy);
        material.setUploadDate(new Date());
        
        if (file != null && !file.isEmpty()) {
            String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
            String filePath = uploadDirectory.resolve(fileName).toString();
            
            Files.copy(file.getInputStream(), Paths.get(filePath));
            
            material.setFileName(file.getOriginalFilename());
            material.setFilePath(filePath);
            material.setFileType(file.getContentType());
            material.setFileSize(file.getSize());
        }
        
        Material savedMaterial = materialRepository.save(material);
        return savedMaterial.getId();
    }
    
    @Transactional
    public List<Long> batchCreateMaterials(String title, String description, Long courseId, 
                                        String uploadedBy, List<MultipartFile> files) throws IOException {
        return files.stream()
                .filter(file -> file != null && !file.isEmpty())
                .map(file -> {
                    try {
                        return createMaterial(title, description, courseId, uploadedBy, file);
                    } catch (IOException e) {
                        throw new RuntimeException("Error uploading file: " + file.getOriginalFilename(), e);
                    }
                })
                .toList();
    }
    
    @Transactional
    public void updateMaterial(Long id, String title, String description) 
            throws MaterialNotFoundException {
        Material material = getMaterial(id);
        material.setTitle(title);
        material.setDescription(description);
        materialRepository.save(material);
    }
    
    @Transactional
    public void deleteMaterial(Long id) throws MaterialNotFoundException, IOException {
        Material material = getMaterial(id);
        
        // 删除物理文件
        if (material.getFilePath() != null) {
            Path fileToDelete = Paths.get(material.getFilePath());
            if (Files.exists(fileToDelete)) {
                Files.delete(fileToDelete);
            }
        }
        
        materialRepository.deleteById(id);
    }
} 