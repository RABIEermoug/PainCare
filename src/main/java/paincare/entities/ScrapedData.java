package paincare.entities;

public class ScrapedData {
	private String title;
    private String paragraphe;
    private String imageUrl;
    private String relativeLink;
    private String date;

    // Constructeur, getters et setters ici

    // Exemple de constructeur
    public ScrapedData(String title, String paragraphe, String imageUrl, String relativeLink, String date) {
        this.title = title;
        this.paragraphe = paragraphe;
        this.imageUrl = imageUrl;
        this.relativeLink = relativeLink;
        this.date = date;
    }

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getParagraphe() {
		return paragraphe;
	}

	public void setParagraphe(String paragraphe) {
		this.paragraphe = paragraphe;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getRelativeLink() {
		return relativeLink;
	}

	public void setRelativeLink(String relativeLink) {
		this.relativeLink = relativeLink;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
}
