package paincare.dao;

import java.util.List;

import paincare.entities.CommentaireEntity;

public interface CommentaireDao {

	 
    void create(CommentaireEntity commentaire);

    List<CommentaireEntity> getAllCommentsByBlogId(int blogId);

    void update(CommentaireEntity commentaire);

    void delete(int id);
    
}
