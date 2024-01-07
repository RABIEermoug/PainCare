package paincare.entities;

import java.sql.Date;
import java.sql.Timestamp;

public class UserEntity {
	
	 	private int idUser;

	 	private String name;

	 	private String email;

	 	private String password;

	    private Timestamp dateTime;

	    private Date birthday;
	    
		private byte[] image; // Content of the photo as bytes
		
		public int getIdUser() {
			return idUser;
		}

		public void setIdUser(int idUser) {
			this.idUser = idUser;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public Timestamp getDateTime() {
			return dateTime;
		}

		public void setDateTime(Timestamp dateTime) {
			this.dateTime = dateTime;
		}

		public Date getBirthday() {
			return birthday;
		}

		public void setBirthday(Date birthday) {
			this.birthday = birthday;
		}

		public byte[] getImage() {
			return image;
		}

		public void setImage(byte[] image) {
			this.image = image;
		}
	    
	    
	    
}
