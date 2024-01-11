package paincare.entities;

import java.sql.Timestamp;

public class PainReportEntity {

	 private int id;
	    private int userId;
	    private int painLevel;
	    private String painLocation;
	    private String symptoms;
	    private String worsePain;
	    private String feelings;
	    private Timestamp createdAt;
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public int getUserId() {
			return userId;
		}
		public void setUserId(int userId) {
			this.userId = userId;
		}
		public int getPainLevel() {
			return painLevel;
		}
		public void setPainLevel(int painLevel) {
			this.painLevel = painLevel;
		}
		public String getPainLocation() {
			return painLocation;
		}
		public void setPainLocation(String painLocation) {
			this.painLocation = painLocation;
		}
		public String getSymptoms() {
			return symptoms;
		}
		public void setSymptoms(String symptoms) {
			this.symptoms = symptoms;
		}
		public String getWorsePain() {
			return worsePain;
		}
		public void setWorsePain(String worsePain) {
			this.worsePain = worsePain;
		}
		public String getFeelings() {
			return feelings;
		}
		public void setFeelings(String feelings) {
			this.feelings = feelings;
		}
		public Timestamp getCreatedAt() {
			return createdAt;
		}
		public void setCreatedAt(Timestamp createdAt) {
			this.createdAt = createdAt;
		}
	    
	    
}
