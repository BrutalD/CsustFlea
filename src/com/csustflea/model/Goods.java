package com.csustflea.model;




import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t_goods")
public class Goods {
	private int id;
	private String gname;
	private String gdescb;
	private double gprice;
	private String gpic;
	private String gpic2;
	private String gpic3;
	private String gtype;
	private int uid;
	private String comment;
	private Date gdate;
	
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

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getGdescb() {
		return gdescb;
	}

	public void setGdescb(String gdescb) {
		this.gdescb = gdescb;
	}

	public double getGprice() {
		return gprice;
	}

	public void setGprice(double gprice) {
		this.gprice = gprice;
	}

	public String getGpic() {
		return gpic;
	}

	public void setGpic(String gpic) {
		this.gpic = gpic;
	}

	public String getGtype() {
		return gtype;
	}

	public void setGtype(String gtype) {
		this.gtype = gtype;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getGpic2() {
		return gpic2;
	}

	public void setGpic2(String gpic2) {
		this.gpic2 = gpic2;
	}

	public String getGpic3() {
		return gpic3;
	}

	public void setGpic3(String gpic3) {
		this.gpic3 = gpic3;
	}
	

}
