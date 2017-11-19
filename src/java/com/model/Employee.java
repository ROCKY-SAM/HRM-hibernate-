/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

/**
 *
 * @author SAM
 */
@Entity
@Table(name="employee")
public class Employee {
    
    private String name;
    private Role role;
    private Set<Task> collection;
    private int employeeID;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    @OneToOne(cascade = CascadeType.ALL)
    @NotFound(action=NotFoundAction.IGNORE)
    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @OneToMany(mappedBy = "employee",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    @NotFound(action=NotFoundAction.IGNORE)
    public Set<Task> getCollection() {
        return collection;
    }
 
    public void setCollection(Set<Task> collection) {
        this.collection = collection;
    }

    @Id
    @GeneratedValue
    @Column(name="employeeID")
    public int getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }
    
}
