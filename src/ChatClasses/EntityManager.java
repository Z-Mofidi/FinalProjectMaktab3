package ChatClasses;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class EntityManager {
	   //SessionFactory factory;
	   public EntityManager(){
		   
	   }
	   
	/* Method to  READ all the users */
	   @SuppressWarnings("rawtypes")
	public ArrayList<User>  listUsers(){
		   SessionFactory factory;
		    try {
				factory = new Configuration().configure().buildSessionFactory();
			} catch (Throwable ex) {
				System.err.println("Failed to create sessionFactory object." + ex);
				throw new ExceptionInInitializerError(ex);
			}
			
			 Session session = factory.openSession();
			 org.hibernate.Transaction tx = null;
	      ArrayList<User> userArrayList = new ArrayList<User>();
	    
	      try{
	         tx = session.beginTransaction();
	         List userList = session.createQuery("from user").list();       
	         for (Iterator iterator = userList.iterator(); iterator.hasNext();){
	            User user = (User) iterator.next();
	            userArrayList.add(user);
	          
	         }
	         tx.commit();
	      }catch (HibernateException e) {
	    	 
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
		return userArrayList;
	   }

	   
	   /* Method to UPDATE  FreeStatus for an user */
	   public void updateFreeUser(String username, int FreeStatus){
		   
		   SessionFactory factory;
		    try {
				factory = new Configuration().configure().buildSessionFactory();
			} catch (Throwable ex) {
				System.err.println("Failed to create sessionFactory object." + ex);
				throw new ExceptionInInitializerError(ex);
			}
		    
	      Session session = factory.openSession();
	      Transaction tx = null;
	      try{
	         tx = session.beginTransaction();
	         User myUser = (User)session.get(User.class, username); 
	         myUser.setFreeStatus(FreeStatus);
			 session.update(myUser); 
	         tx.commit();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
	   }

	   
	   
	   
	   /* Method to  READ  free users */
	   @SuppressWarnings("rawtypes")
	public ArrayList<String>  listFreeUsers(){
		   SessionFactory factory;
		    try {
				factory = new Configuration().configure().buildSessionFactory();
			} catch (Throwable ex) {
				System.err.println("Failed to create sessionFactory object." + ex);
				throw new ExceptionInInitializerError(ex);
			}
			
			 Session session = factory.openSession();
			 org.hibernate.Transaction tx = null;
	      ArrayList<String> freeUserArrayList = new ArrayList<String>();
	    
	      try{
	         tx = session.beginTransaction();
	         List freeUserList = session.createQuery("SELECT userName FROM user WHERE freeStatus=1").list();       
	         for (Iterator iterator = freeUserList.iterator(); iterator.hasNext();){
	            //User user = (User) iterator.next();
	            freeUserArrayList.add((String) iterator.next());
	          
	         }
	         tx.commit();
	      }catch (HibernateException e) {
	    	 
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
		return freeUserArrayList;
	   }

	   
	   /* Method to  READ  list ChatGrup Request */
	   public ArrayList<ChatGroup> listChatGrupReq(String userName){
		
		   SessionFactory factory;
		    try {
				factory = new Configuration().configure().buildSessionFactory();
			} catch (Throwable ex) {
				System.err.println("Failed to create sessionFactory object." + ex);
				throw new ExceptionInInitializerError(ex);
			}
			
			 Session session = factory.openSession();
			 org.hibernate.Transaction tx = null;
	      ArrayList<ChatGroup> chatGroupArray = new ArrayList<ChatGroup>();
	    
	      try{
	         tx = session.beginTransaction();
	         List chatGroupList = session.createQuery("SELECT chatgroup.nameChatGroup FROM chatgroup, user_has_chatgroup WHERE chatgroup.nameChatGroup=user_has_chatgroup.chatGroup_nameChatGroup AND user_has_chatgroup.user_userName = "+userName).list();       
	         for (Iterator iterator = chatGroupList.iterator(); iterator.hasNext();){
	            //User user = (User) iterator.next();
	        	 chatGroupArray.add((ChatGroup) iterator.next());
	          
	         }
	         tx.commit();
	      }catch (HibernateException e) {
	    	 
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
		
		return chatGroupArray;
	   }
	   
	   
	   public void addMsg(String msgtxt, String userName, String chatGroupName){
		   SessionFactory factory;
			try {
				factory = new Configuration().configure().buildSessionFactory();
			} catch (Throwable ex) {
				System.err.println("Failed to create sessionFactory object." + ex);
				throw new ExceptionInInitializerError(ex);
			}
			
			 Session session = factory.openSession();
		      org.hibernate.Transaction tx = null;
		      Integer msgID = null;
		      
		      try{
		          tx = session.beginTransaction();
		          Msg msg = new Msg( userName , chatGroupName ,msgtxt);
		          msgID = (Integer) session.save(msg); 
		          tx.commit();
		       }catch (HibernateException e) {
		          if (tx!=null) tx.rollback();
		          e.printStackTrace(); 
		       }finally {
		          session.close(); 
		       }

	   }
	   
	   public void addUserGroup(String userName, String chatGroupName, int reqStatus){
		   SessionFactory factory;
			try {
				factory = new Configuration().configure().buildSessionFactory();
			} catch (Throwable ex) {
				System.err.println("Failed to create sessionFactory object." + ex);
				throw new ExceptionInInitializerError(ex);
			}
			
			 Session session = factory.openSession();
		      org.hibernate.Transaction tx = null;
		      Integer userGroupId = null;
		      
		      try{
		          tx = session.beginTransaction();
		          UserGroup usergroup = new UserGroup( userName , chatGroupName ,reqStatus);
		          userGroupId = (Integer) session.save(usergroup); 
		          tx.commit();
		       }catch (HibernateException e) {
		          if (tx!=null) tx.rollback();
		          e.printStackTrace(); 
		       }finally {
		          session.close(); 
		       }

	   }
	   
	   
	   public void upadateUserGroupStatus(String userName , String chatGroupName, int reqStatus){
		   
		   SessionFactory factory;
		    try {
				factory = new Configuration().configure().buildSessionFactory();
			} catch (Throwable ex) {
				System.err.println("Failed to create sessionFactory object." + ex);
				throw new ExceptionInInitializerError(ex);
			}
		    
	      Session session = factory.openSession();
	      Transaction tx = null;
	      try{
	         tx = session.beginTransaction();
	         UserGroup myUser = (UserGroup)session.get(UserGroup.class, userName ); 
	         myUser.setReqStatus(reqStatus);
			 session.update(myUser); 
	         tx.commit();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
	   }

	   

/* Method to  READ  list msg */
	public ArrayList<Msg> listMsg(String chatGroupName){
	
	   SessionFactory factory;
	    try {
			factory = new Configuration().configure().buildSessionFactory();
		} catch (Throwable ex) {
			System.err.println("Failed to create sessionFactory object." + ex);
			throw new ExceptionInInitializerError(ex);
		}
		
		 Session session = factory.openSession();
		 org.hibernate.Transaction tx = null;
   ArrayList<Msg> msgArray = new ArrayList<Msg>();
 
   try{
      tx = session.beginTransaction();
      List msgList = session.createQuery("FROM Msg WHERE chatGroup_nameChatGroup = "+chatGroupName).list();       
      for (Iterator iterator = msgList.iterator(); iterator.hasNext();){
         //User user = (User) iterator.next();
    	  msgArray.add((Msg) iterator.next());
       
      }
      tx.commit();
   }catch (HibernateException e) {
 	 
      if (tx!=null) tx.rollback();
      e.printStackTrace(); 
   }finally {
      session.close(); 
   }
	
	return msgArray;
}
}