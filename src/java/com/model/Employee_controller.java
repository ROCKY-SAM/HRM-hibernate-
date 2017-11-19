package com.model;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.util.SessionFactoryUtil;
import com.model.Employee;
import com.model.Role;
import com.model.Task;
import java.util.List;
import org.hibernate.Query;

/**
 *
 * @author SAM
 */
public class Employee_controller {

    public static void createStudent(Employee em) {
        Transaction tx = null;
        Session session = SessionFactoryUtil.getCurrentSession();
        try {
            tx = session.beginTransaction();
            session.save(em);
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
    }

    public static void createTask(Task ts) {
        Transaction tx = null;
        Session session = SessionFactoryUtil.getCurrentSession();
        try {
            tx = session.beginTransaction();
            session.save(ts);
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
    }

    public static void createTole(Role rs) {
        Transaction tx = null;
        Session session = SessionFactoryUtil.getCurrentSession();
        try {
            tx = session.beginTransaction();
            session.save(rs);
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
    }

    //get employee list to table
    public static List listEmployee() {
        List<Object> employees = null;

        Transaction tx = null;
        Session session = SessionFactoryUtil.getCurrentSession();
        try {
            tx = session.beginTransaction();
            employees = session.createQuery(
                    "select e from Employee as e").list();

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
        return employees;
    }
    //dashboard employee count

    public static Long employeeCount() {
        Long count = null;
        Transaction tx = null;
        Session session = SessionFactoryUtil.getCurrentSession();
        try {
            tx = session.beginTransaction();
            Query q = session.createQuery("select COUNT(e.employeeID) from Employee as e");
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

    public static int createEmployee(Employee em) {
        int statusValue=0;
        Transaction tx = null;
        Session session = SessionFactoryUtil.getCurrentSession();
        try {
            tx = session.beginTransaction();
            session.save(em);
            tx.commit();
            statusValue=1;
        } catch (RuntimeException e) {
            if (tx != null && tx.isActive()) {
                try {

                    tx.rollback();
                } catch (HibernateException e1) {
                    System.out.println("Error");
                    statusValue=2;
                }
                throw e;
            }
        }
        return statusValue;
    }

    //get task by id
    public static Employee getEmployeeObject(String empid) {
        List returnValue = null;

        Transaction tx = null;
        Session session = SessionFactoryUtil.getCurrentSession();

        try {
            tx = session.beginTransaction();
            Query q = session.createQuery("select e from Employee as e where e.employeeID =:employeeIDs");
            q.setString("employeeIDs", empid);
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
        return (Employee) returnValue.get(0);
    }

    //update employee
    public static int updateEmployee(Employee ec) {
        int returnValue = 0;
        Transaction tx = null;
        Session session = SessionFactoryUtil.getCurrentSession();
        try {
            tx = session.beginTransaction();
            session.update(ec);
            tx.commit();
            returnValue = 1;
        } catch (RuntimeException e) {
            if (tx != null && tx.isActive()) {
                try {
                    tx.rollback();
                } catch (HibernateException e1) {
                    System.out.println("Error");
                    returnValue = 2;
                }
                throw e;
            }
        }
        return returnValue;
    }
}
