/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Tu
 */
public class Slider {
    
    private int sliderID;
    private String urlImage;
    private Category category;
    private String backLink;

    public Slider() {
    }

    public Slider(int sliderID, String urlImage, Category category, String backLink) {
        this.sliderID = sliderID;
        this.urlImage = urlImage;
        this.category = category;
        this.backLink = backLink;
    }

    public int getSliderID() {
        return sliderID;
    }

    public void setSliderID(int sliderID) {
        this.sliderID = sliderID;
    }

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getBackLink() {
        return backLink;
    }

    public void setBackLink(String backLink) {
        this.backLink = backLink;
    }

    @Override
    public String toString() {
        return "Slider{" + "sliderID=" + sliderID + ", urlImage=" + urlImage + ", category=" + category + ", backLink=" + backLink + '}';
    }
    
    
}
