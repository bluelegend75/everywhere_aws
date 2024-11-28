package joeun.project.dto;

public class BannerDto {
	private int id;
    private String imageUrl;
    private String linkUrl;
    private	String content;
//    private String cr_date;
    
    public BannerDto() {	}

	public BannerDto(int id, String imageUrl, String linkUrl, String content, String cr_date) {
		super();
		this.id = id;
		this.imageUrl = imageUrl;
		this.linkUrl = linkUrl;
		this.content = content;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getLinkUrl() {
		return linkUrl;
	}

	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


	@Override
	public String toString() {
		return "BannerDto [id=" + id + ", imageUrl=" + imageUrl + ", linkUrl=" + linkUrl + ", content=" + content + "]";
	}
    

}
