/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.model.Role;
import com.model.Task;
import com.util.SessionFactoryUtil;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author SAM
 */
public class Role_Controller {
    //get employee list to table
    public static List listRole() {
        List roles = null;
        
        Transaction tx = null;
        Session session = SessionFactoryUtil.getCurrentSession();
        try {
            tx = session.beginTransaction();
            roles = session.createQuery(
                    "SELECT r FROM Role AS r WHERE r.roleID NOT IN (SELECT e.role FROM Employee AS e)").list();
          
            tx.commit();
             
        } catch (RuntimeException e) {
            if (tx != null && tx.isActive()) {
                try {
                    // Second try catch as the rollback could fail as well
                    tx.rollback();
                } catch (HibernateException e1) {
                    System.out.println("Error rolling back transaction");
                }
                throw e;
            }
        }
     return roles;
    }
    
    //to show role page
        public static List listRoles() {
        List roles = null;
        
        Transaction tx = null;
        Session session = SessionFactoryUtil.getCurrentSession();
        try {
            tx = session.beginTransaction();
            roles = session.createQuery(
                    "SELECT r FROM Role AS r").list();
          
            tx.commit();
             
        } catch (RuntimeException e) {
            if (tx != null && tx.isActive()) {
                try {
                    // Second try catch as the rollback could fail as well
                    tx.rollback();
                } catch (HibernateException e1) {
                    System.out.println("Error rolling back transaction");
                }
                throw e;
            }
        }
     return roles;
    }
    
  //dashboard role count
    public static Long roleCount(){
    Long count = null;
        Transaction tx = null;
        Session session = SessionFactoryUtil.getCurrentSession();
        try {
            tx = session.beginTransaction();
            Query q = session.createQuery("select COUNT(r.roleID) from Role as r");
            count = (Long)q.uniqueResult();
            tx.commit();
             
        } catch (RuntimeException e) {
            if (tx != null && tx.isActive()) {
                try {
                    // Second try catch as the rollback could fail as well
                    tx.rollback();
                } catch (HibernateException e1) {
                    System.out.println("Error rolling back transaction");
                }
                throw e;
            }
        }        
        return count;
        
    }    
      //create role
        public static int createRole(Role ro) {
            int resultValu=0;
        Transaction tx = null;
        Session session = SessionFactoryUtil.getCurrentSession();
        try {
            tx = session.beginTransaction();
            session.save(ro);
            tx.commit();
            resultValu=1;
        } catch (RuntimeException e) {
            if (tx != null && tx.isActive()) {
                try {

                    tx.rollback();
                } catch (HibernateException e1) {
                    System.out.println("Error");
                    resultValu=2;
                }
                throw e;
            }
        }
        return resultValu;
    }  
        
        
    //get role object
    public static Role getRoleObject(String roleId) {
        List returnValue = null;
        
        Transaction tx = null;
        Session session = SessionFactoryUtil.getCurrentSession();

        try {
            tx = session.beginTransaction();
            Query q = session.createQuery("select r from Role as r where r.roleID =:roleIDs");
            q.setString("roleIDs", roleId);
            returnValue = q.list();
            
            tx.commit();

        } catch (RuntimeException e) {
            if (tx != null && tx.isActive()) {
                try {
                    tx.rollback();
                } catch (HibernateException e1) {
                    System.out.println("Error");
                }
                throw e;
            }
        }
        return (Role) returnValue.get(0);
    }
    
    //update role
        public int updateRole(Role rc) {
        int resultValu = 0;
        Transaction tx = null;
        Session session = SessionFactoryUtil.getCurrentSession();
        try {
            tx = session.beginTransaction();
            session.update(rc);
            tx.commit();
            resultValu = 1;
        } catch (RuntimeException e) {
            if (tx != null && tx.isActive()) {
                try {
                    tx.rollback();
                } catch (HibernateException e1) {
                    System.out.println("Error");
                    resultValu = 2;
                }
                throw e;
            }
        }
        return resultValu;
    }
    
    
    
    
}
