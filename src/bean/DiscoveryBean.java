package bean;

import java.io.InputStream;

public class DiscoveryBean {
	
	private String description;
	private String story_name;
	private String artical_name;
	private String writer_name;
	
	//private String img_name;
	private String category;
	private String message;
	private InputStream img_name;
	
	
	
	
	public String getWriter_name() {
		return writer_name;
	}
	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}
	public InputStream getImg_name() {
		return img_name;
	}
	public void setImg_name(InputStream img_name) {
		this.img_name = img_name;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStory_name() {
		return story_name;
	}
	public void setStory_name(String story_name) {
		this.story_name = story_name;
	}
	public String getArtical_name() {
		return artical_name;
	}
	public void setArtical_name(String artical_name) {
		this.artical_name = artical_name;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	

}
