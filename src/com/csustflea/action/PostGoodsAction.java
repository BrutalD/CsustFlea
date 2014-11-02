package com.csustflea.action;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.csustflea.model.Goods;
import com.csustflea.model.User;
import com.csustflea.service.GoodsService;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class PostGoodsAction extends ActionSupport {
	private File doc1;
	private String doc1FileName;
	private String doc1ContentType;
	private File doc2;
	private String doc2FileName;
	private String doc2ContentType;
	private File doc3;
	private String doc3FileName;
	private String doc3ContentType;
	private int flag1;
	private int flag2;
	private int flag3;

	public int getFlag1() {
		return flag1;
	}

	public void setFlag1(int flag1) {
		this.flag1 = flag1;
	}

	public int getFlag2() {
		return flag2;
	}

	public void setFlag2(int flag2) {
		this.flag2 = flag2;
	}

	public int getFlag3() {
		return flag3;
	}

	public void setFlag3(int flag3) {
		this.flag3 = flag3;
	}

	public File getDoc2() {
		return doc2;
	}

	public void setDoc2(File doc2) {
		this.doc2 = doc2;
	}

	public String getDoc2FileName() {
		return doc2FileName;
	}

	public void setDoc2FileName(String doc2FileName) {
		this.doc2FileName = doc2FileName;
	}

	public String getDoc2ContentType() {
		return doc2ContentType;
	}

	public void setDoc2ContentType(String doc2ContentType) {
		this.doc2ContentType = doc2ContentType;
	}

	public File getDoc3() {
		return doc3;
	}

	public void setDoc3(File doc3) {
		this.doc3 = doc3;
	}

	public String getDoc3FileName() {
		return doc3FileName;
	}

	public void setDoc3FileName(String doc3FileName) {
		this.doc3FileName = doc3FileName;
	}

	public String getDoc3ContentType() {
		return doc3ContentType;
	}

	public void setDoc3ContentType(String doc3ContentType) {
		this.doc3ContentType = doc3ContentType;
	}

	private Goods goods;
	private GoodsService goodsservice;

	public File getDoc1() {
		return doc1;
	}

	public void setDoc1(File doc1) {
		this.doc1 = doc1;
	}

	public String getDoc1FileName() {
		return doc1FileName;
	}

	public void setDoc1FileName(String doc1FileName) {
		this.doc1FileName = doc1FileName;
	}

	public String getDoc1ContentType() {
		return doc1ContentType;
	}

	public void setDoc1ContentType(String doc1ContentType) {
		this.doc1ContentType = doc1ContentType;
	}

	public GoodsService getGoodsservice() {
		return goodsservice;
	}

	@Resource
	public void setGoodsservice(GoodsService goodsservice) {
		this.goodsservice = goodsservice;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public String ifo() {
		Date gdate = new Date(System.currentTimeMillis());
		goods.setGdate(gdate);
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("logUserTemp");
		int uid = u.getId();
		goods.setUid(uid);
		this.goodsservice.CpGoodsInfo(goods);
		return "list";
	}

	public String generaterFileName(String filename) {
		DateFormat format = new SimpleDateFormat("yyMMddHHmmss");
		String date = format.format(new Date(System.currentTimeMillis()));
		int random = new Random().nextInt(10000);
		int position = filename.lastIndexOf(".");
		String extention = filename.substring(position);
		String targetfilename = date + random + extention;
		return targetfilename;
	}

	public String pics() throws IOException {
		Goods goodtemp = new Goods();
		String targetfilepos = ServletActionContext.getRequest().getRealPath(
				"/goodspic"); /* 上传的位置，在该项目类 */
		if (flag1 == 1) {
			String targetfilename1 = generaterFileName(doc1FileName);
			File file1 = new File(targetfilepos, targetfilename1);
			FileUtils.copyFile(doc1, file1);
			goodtemp.setGpic("../CsustFlea/goodspic/" + targetfilename1);
		}

		if (flag2 == 1) {
			String targetfilename2 = generaterFileName(doc2FileName);
			File file2 = new File(targetfilepos, targetfilename2);
			FileUtils.copyFile(doc2, file2);
			goodtemp.setGpic2("../CsustFlea/goodspic/" + targetfilename2);
		}

		if (flag3 == 1) {
			String targetfilename3 = generaterFileName(doc3FileName);
			File file3 = new File(targetfilepos, targetfilename3);
			FileUtils.copyFile(doc3, file3);
			goodtemp.setGpic3("../CsustFlea/goodspic/" + targetfilename3);
		}

		this.goodsservice.CpGoodsPic(goodtemp);
		return SUCCESS;
	}
}
