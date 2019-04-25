package com.javaex.vo;

public class UsersVo {
private int userNo ;
private String userName;
private String password;
private String joinDate;
private String id;

public UsersVo() { }

public UsersVo( String userName, String password, String id) {
	this.userName = userName;
	this.password = password;
	this.id = id;
}

public int getUserNo() {
	return userNo;
}

public void setUserNo(int userNo) {
	this.userNo = userNo;
}

public String getUserName() {
	return userName;
}

public void setUserName(String userName) {
	this.userName = userName;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public String getJoinDate() {
	return joinDate;
}

public void setJoinDate(String joinDate) {
	this.joinDate = joinDate;
}

public String getId() {
	return id;
}

public void setId(String id) {
	this.id = id;
}

@Override
public String toString() {
	return "UsersVo [userNo=" + userNo + ", userName=" + userName + ", password=" + password + ", joinDate=" + joinDate
			+ ", id=" + id + "]";
}



}
