package com.spear.blog.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity
public class User {
	
	private static final long serialVersionUID = 1L;
	  
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long id;
	
	private String email;
	private String user_name;
	private String password;
	private String joinDate;

}
