/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rec.erecruit.ejb;

import com.rec.erecruit.common.CommentDetails;
import com.rec.erecruit.common.UserDetails;
import com.rec.erecruit.entity.Comment;
import com.rec.erecruit.entity.User;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

/**
 *
 * @author popa_
 */
@Stateless
public class CommentBean {

    private static final Logger LOG = Logger.getLogger(CommentBean.class.getName());
    
    @PersistenceContext
    private EntityManager em;
    
    public UserDetails findById(Integer userId) {
        User user = em.find(User.class, userId);
        return new UserDetails(user.getId(), user.getLastName(), user.getFirstName(), user.getPhoneNumber(), user.getMobilePhoneNumber(), user.getEmail(), user.getJobTitle(), user.getDescription(), user.getUsername(), user.getPassword(), user.getRoles());
    }
    
    public void createComment(Integer ownedBy,String content,Integer createdBy){
        LOG.info("createComment");
        Comment com=new Comment();
        
        Calendar rightNow = Calendar.getInstance();
        com.setContent(content);
        com.setCreatedBy(createdBy);
        com.setOwnedBy(ownedBy);
        com.setDate(content);
        
        Integer second=rightNow.get(rightNow.SECOND);
        Integer minute=rightNow.get(rightNow.MINUTE);
        Integer hour=rightNow.get(rightNow.HOUR);
        Integer day=rightNow.get(rightNow.DATE);
        Integer month=rightNow.get(rightNow.MONTH)+1;
        Integer year=rightNow.get(rightNow.YEAR);
        
             
      
        String date=year.toString()+"-"+month.toString()+"-"+day.toString()+" "+hour.toString()+":"+minute.toString()+":"+second.toString();
        com.setDate(date);
        
        em.persist(com);
        
    }
    
    public List<CommentDetails> getAllComments(Integer userId){
        LOG.info("getAllComments");
        
        String allComms="Select c FROM Comment c JOIN User u on c.createdBy=u.id where c.ownedBy="+userId.toString();
        TypedQuery<Comment> typedQuery=em.createQuery(allComms,Comment.class);  
        List<Comment> comments = (List<Comment>) typedQuery.getResultList();
        return copyCommentsToDetails(comments);
    }
    
    private List<CommentDetails> copyCommentsToDetails(List<Comment> comments) {
        List<CommentDetails> detailsList = new ArrayList<>();
        for (Comment comment : comments) {
            CommentDetails commentDetails = new CommentDetails(comment.getId(),comment.getContent(),comment.getCreatedBy(),comment.getOwnedBy(),comment.getDate(),findById(comment.getCreatedBy()).getUsername());
            detailsList.add(commentDetails);

        }
        return detailsList;
    }
    
     public void deleteComment(Integer id){
        LOG.info("deleteComment");      
        Comment iddelete = em.find(Comment.class, id);
        em.remove(iddelete);
    }
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
