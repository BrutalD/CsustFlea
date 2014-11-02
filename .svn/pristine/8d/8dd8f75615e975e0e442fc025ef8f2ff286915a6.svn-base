package com.csustflea.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="t_pgoods")
public class PGoods {
	private int id;
	private String pdescb;
	private int uid;
	private String pic;
	private String pgname;
	private String comment;
	private Date pgtime;
    private String pgprice;
    private String paddress;
    private String pphonenumber;
	
	public String getPaddress() {
		return paddress;
	}
	public void setPaddress(String paddress) {
		this.paddress = paddress;
	}
	public String getPphonenumber() {
		return pphonenumber;
	}
	public void setPphonenumber(String pphonenumber) {
		this.pphonenumber = pphonenumber;
	}
	public String getPgprice() {
		return pgprice;
	}
	public void setPgprice(String pgprice) {
		this.pgprice = pgprice;
	}
	
    @Id
    @GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPdescb() {
		return pdescb;
	}

	public void setPdescb(String pdescb) {
		this.pdescb = pdescb;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getPgname() {
		return pgname;
	}

	public void setPgname(String pgname) {
		this.pgname = pgname;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getPgtime() {
		return pgtime;
	}

	public void setPgtime(Date pgtime) {
		this.pgtime = pgtime;
	}

}
