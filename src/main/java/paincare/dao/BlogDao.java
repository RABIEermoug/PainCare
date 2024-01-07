package paincare.dao;

import java.util.List;

import paincare.entities.BlogEntity;

public interface BlogDao {
	
	  void create(BlogEntity blog);
	 
	  List<BlogEntity> getAllBlogs();
	  
	  void update(BlogEntity blog);

	  void delete(Long Id);
	  
}
