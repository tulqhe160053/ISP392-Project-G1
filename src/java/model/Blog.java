/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Tu
 */
public class Blog {
    
    private int id;
    private Users user;
    private Category category;
    private String title;
    private String description;
    private String content;
    private String imageLink;
    private String createTime;
    private int viewer;
    private BlogStatus blogstatus;

    public Blog() {
    }

    public Blog(int id, Users user, Category category, String title, String description, String content, String imageLink, String createTime, int viewer, BlogStatus blogstatus) {
        this.id = id;
        this.user = user;
        this.category = category;
        this.title = title;
        this.description = description;
        this.content = content;
        this.imageLink = imageLink;
        this.createTime = createTime;
        this.viewer = viewer;
        this.blogstatus = blogstatus;
    }

    

    
    

     

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImageLink() {
        return imageLink;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public int getViewer() {
        return viewer;
    }

    public void setViewer(int viewer) {
        this.viewer = viewer;
    }

    public BlogStatus getBlogstatus() {
        return blogstatus;
    }

    public void setBlogstatus(BlogStatus blogstatus) {
        this.blogstatus = blogstatus;
    }
    
    

    @Override
    public String toString() {
        return "Blog{" + "id=" + id + ", user=" + user + ", category=" + category + ", title=" + title + ", description=" + description + ", content=" + content + ", imageLink=" + imageLink + '}';
    }
    
    
}
