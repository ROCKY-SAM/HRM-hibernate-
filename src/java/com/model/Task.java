/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

/**
 *
 * @author SAM
 */


@Entity
@Table(name="task")
public class Task {
    


    private int taskID;
    private String description;
    private Employee employee;
    
    @Id
    @GeneratedValue 
    @Column(name="taskID")
    public int getTaskID() {
        return taskID;
    }

    public void setTaskID(int taskID) {
        this.taskID = taskID;
    }
    @Column(name="description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    @ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @NotFound(action=NotFoundAction.IGNORE)
    @JoinColumn(name="employeeID")
    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
    


    
 

    
}

        
    