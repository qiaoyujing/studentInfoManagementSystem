package swu.edu.cn.entity;

public class Discipline {
    private Integer id;

    private String code;

    private String name;

    private String description;

    private String parentCode;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getparentCode() {
        return parentCode;
    }

    public void setparentCode(String parentCode) {
        this.parentCode = parentCode== null ? null : parentCode.trim();
    }
}