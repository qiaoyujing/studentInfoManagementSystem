package swu.edu.cn.entity;

import java.util.Date;

public class ClassInfo {
    private Integer id;

    private String code;

    private String name;

    private Integer studentnum;

    private String managerId;

    private String description;

    private String slogan;

    private String url;

    private String teacherId;

    private Date graduateyear;

    private Integer inputId;

    private Date inputTime;

    private Integer modifyId;

    private Date mofifyTime;

    private Integer deleteId;

    private Date deleteTime;

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

    public Integer getStudentnum() {
        return studentnum;
    }

    public void setStudentnum(Integer studentnum) {
        this.studentnum = studentnum;
    }

    public String getManagerId() {
        return managerId;
    }

    public void setManagerId(String managerId) {
        this.managerId = managerId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getslogan() {
        return slogan;
    }

    public void setslogan(String slogan) {
        this.slogan = slogan == null ? null : slogan.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public Date getGraduateyear() {
        return graduateyear;
    }

    public void setGraduateyear(Date graduateyear) {
        this.graduateyear = graduateyear;
    }

    public Integer getInputId() {
        return inputId;
    }

    public void setInputId(Integer inputId) {
        this.inputId = inputId;
    }

    public Date getInputTime() {
        return inputTime;
    }

    public void setInputTime(Date inputTime) {
        this.inputTime = inputTime;
    }

    public Integer getModifyId() {
        return modifyId;
    }

    public void setModifyId(Integer modifyId) {
        this.modifyId = modifyId;
    }

    public Date getMofifyTime() {
        return mofifyTime;
    }

    public void setMofifyTime(Date mofifyTime) {
        this.mofifyTime = mofifyTime;
    }

    public Integer getDeleteId() {
        return deleteId;
    }

    public void setDeleteId(Integer deleteId) {
        this.deleteId = deleteId;
    }

    public Date getDeleteTime() {
        return deleteTime;
    }

    public void setDeleteTime(Date deleteTime) {
        this.deleteTime = deleteTime;
    }
}