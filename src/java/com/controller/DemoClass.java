/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.Employee_controller;
import java.util.Set;
import com.model.Employee;
import com.model.Role;
import com.model.Task;

/**
 *
 * @author SAM
 */
public class DemoClass {
    public static void main(String args[]){
    
        
    Task ts = new Task();
 
    ts.setDescription("rajika task");
    Employee_controller.createTask(ts);
        
    
    Role ro = new Role();
    ro.setTitle("apple worker");


    Employee em = new Employee();
    em.setName("rajika");
    em.setRole(ro);
    
    Employee_controller.createStudent(em);
    
    Employee emm = new Employee();
    emm.setName("sam");
 
    
    Employee_controller.createStudent(emm);  
    
    Role roo = new Role();
    roo.setTitle("samsung worker");
    Employee_controller.createTole(roo);
    
    
    
        Role rooo = new Role();
    rooo.setTitle("samsung worker");
    rooo.setRoleID(2);
    
    
    
        Employee emmm = new Employee();
    emmm.setName("laiyaaaa");
    emmm.setRole(rooo);
    Employee_controller.createStudent(emmm);  
    
  
    Task tss = new Task();
    tss.setDescription("kavi task");
    tss.setEmployee(emmm);
    Employee_controller.createTask(tss);
    
    }
}
