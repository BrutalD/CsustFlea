package com.csustflea.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name="t_goodsandcomment")
public class GoodsAndComment {
	private int id;
	private int uid;  /*评论商品用户的id*/
	private int gid;   /*商品的id*/
	private String guname;   /*商品的发布者的名字*/
	private String gucomment;  /*商品发布者的回答*/
	private String ucomment;  /*客户端评论*/
	private String uname;    /*客户的用户名*/
	private String gname;   /*商品的名字*/
	private double gprice;   
	private String gtype;
	private Date gdate;
	private int countflag;   /*这个是为了实现我的市场页面点击后数字清零的效果*/
	private int ijoinedflag; /*这里是指的我参与的flag*/
	
	public int getIjoinedflag() {
		return ijoinedflag;
	}
	public void setIjoinedflag(int ijoinedflag) {
		this.ijoinedflag = ijoinedflag;
	}
	public int getCountflag() {
		return countflag;
	}
	public void setCountflag(int countflag) {
		this.countflag = countflag;
	}
	public double getGprice() {
		return gprice;
	}
	public void setGprice(double gprice) {
		this.gprice = gprice;
	}
	public String getGtype() {
		return gtype;
	}
	public void setGtype(String gtype) {
		this.gtype = gtype;
	}
	public Date getGdate() {
		return gdate;
	}
	public void setGdate(Date gdate) {
		this.gdate = gdate;
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
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public String getGuname() {
		return guname;
	}
	public void setGuname(String guname) {
		this.guname = guname;
	}
	public String getGucomment() {
		return gucomment;
	}
	public void setGucomment(String gucomment) {
		this.gucomment = gucomment;
	}
	public String getUcomment() {
		return ucomment;
	}
	public void setUcomment(String ucomment) {
		this.ucomment = ucomment;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	

}
