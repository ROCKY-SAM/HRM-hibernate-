package com.model;

import com.model.Role;
import com.model.Task;
import com.util.SessionFactoryUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author SAM
 */
public class Task_Controller {

    //get task list
    public static List listTask() {
        List task = null;
        Transaction tx = null;
        Session session = SessionFactoryUtil.getCurrentSession();
        try {
            tx = session.beginTransaction();
            task = session.createQuery(
                    "select t from Task as t where t.employee = null").list();
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
        return task;
    }
    
        //get task list to view
    public static List listTasks() {
        List task = null;
        Transaction tx = null;
        Session session = SessionFactoryUtil.getCurrentSession();
        try {
            tx = session.beginTransaction();
            task = session.createQuery(
                    "select t from Task as t").list();
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
        return task;
    }

    //dashboard role count
    public static Long taskCount() {
        Long count = null;
        Transaction tx = null;
        Session session = SessionFactoryUtil.getCurrentSession();
        try {
            tx = session.beginTransaction();
            Query q = session.createQuery("select COUNT(t.taskID) from Task as t");
            count = (Long) q.uniqueResult();
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

    //create task
    public static int createTask(Task ts) {
        int resultValu = 0;
        Transaction tx = null;
        Session session = SessionFactoryUtil.getCurrentSession();
        try {
            tx = session.beginTransaction();
            session.save(ts);
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

    //get task by id
    public static Task getTaskObject(String taskId) {
        List returnValue = null;

        Transaction tx = null;
        Session session = SessionFactoryUtil.getCurrentSession();

        try {
            tx = session.beginTransaction();
            Query q = session.createQuery("select t from Task as t where t.taskID =:taskIDs");
            q.setString("taskIDs", taskId);
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
        return (Task) returnValue.get(0);
    }


    public int updateTask(Task tc) {
        int resultValu = 0;
        Transaction tx = null;
        Session session = SessionFactoryUtil.getCurrentSession();
        try {
            tx = session.beginTransaction();
            session.update(tc);
            tx.commit();
            resultValu = 1;
        } catch (RuntimeException e) {
            if (tx != null && tx.isActive()) {
                try {
                    tx.rollback();
                    resultValu = 2;
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
