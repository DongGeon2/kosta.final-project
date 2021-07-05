package org.kosta.myproject.model.vo;

import java.io.Serializable;

public class Authority implements Serializable {
	private static final long serialVersionUID = 5188280555844223102L;
	private String id;
	private String authority;
	
	public Authority(){}

	public Authority(String id, String authority) {
		this.id = id;
		this.authority = authority;
	}
  
	public String getUsername() {
		return id;
	}

	public void setUsername(String id) {
		this.id = id;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	@Override
	public String toString() {
		return "Authority [id=" + id + ", authority=" + authority
				+ "]";
	}	
}
