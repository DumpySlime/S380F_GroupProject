package hkmu.wadd.exception;

public class MaterialNotFoundException extends Exception {
    public MaterialNotFoundException(Long id) {
        super("Material #" + id + " not found");
    }
} 