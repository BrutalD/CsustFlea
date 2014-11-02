package com.csustflea.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "t_uandt")
public class UserAndTec {

	private int id;
	private int uid;
	private int tid;
	private String uname;
	private Date utdate;
	private int tscore;
	private String unumber;
	private String appname;

	public String getAppname() {
		return appname;
	}

	public void setAppname(String appname) {
		this.appname = appname;
	}

	public String getUnumber() {
		return unumber;
	}

	public void setUnumber(String unumber) {
		this.unumber = unumber;
	}

	public int getTscore() {
		return tscore;
	}

	public void setTscore(int tscore) {
		this.tscore = tscore;
	}

	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public Date getUtdate() {
		return utdate;
	}

	public void setUtdate(Date utdate) {
		this.utdate = utdate;
	}

}
