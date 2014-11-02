package com.csustflea.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t_technician")
public class Technician {
	private int id;
	private int uid;
	private double score;
	private String introduce;
	private int price;
	private String aspect;
	private String identy;
	private String application;
	private String tname;
	private String timg;
	private String trealname;
	private String flag;
	private String comment;
	private int tcount;
	
	
	public int getTcount() {
		return tcount;
	}

	public void setTcount(int tcount) {
		this.tcount = tcount;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getTrealname() {
		return trealname;
	}

	public void setTrealname(String trealname) {
		this.trealname = trealname;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getTimg() {
		return timg;
	}

	public void setTimg(String timg) {
		this.timg = timg;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getApplication() {
		return application;
	}

	public void setApplication(String application) {
		this.application = application;
	}

	public String getIdenty() {
		return identy;
	}

	public void setIdenty(String identy) {
		this.identy = identy;
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

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public String getAspect() {
		return aspect;
	}

	public void setAspect(String aspect) {
		this.aspect = aspect;
	}

}
