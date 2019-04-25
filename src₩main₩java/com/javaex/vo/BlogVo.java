package com.javaex.vo;

public class BlogVo {
public String id;
public String blogTitle;
public String logoFile;

public String userName;

public BlogVo(){ }

public BlogVo(String id, String blogTitle, String logoFile, String userName) {
	this.id = id;
	this.blogTitle = blogTitle;
	this.logoFile = logoFile;
	this.userName = userName;
}

public String getId() {
	return id;
}

public void setId(String id) {
	this.id = id;
}

public String getBlogTitle() {
	return blogTitle;
}

public void setBlogTitle(String blogTitle) {
	this.blogTitle = blogTitle;
}

public String getlogoFile() {
	return logoFile;
}

public void setlogoFile(String logoFile) {
	this.logoFile = logoFile;
}

public String getUserName() {
	return userName;
}

public void setUserName(String userName) {
	this.userName = userName;
}

@Override
public String toString() {
	return "BlogVo [id=" + id + ", blogTitle=" + blogTitle + ", logoFile=" + logoFile + ", userName=" + userName + "]";
}


}
