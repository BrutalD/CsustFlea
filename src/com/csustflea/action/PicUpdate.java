package com.csustflea.action;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.csustflea.model.Goods;
import com.csustflea.service.GoodsService;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class PicUpdate extends ActionSupport {
	private GoodsService goodsService;
	private File doc;
	private String docFileName;
	private String docContentType;
	private String dir;
	private String targetFileName;

	public GoodsService getGoodsService() {
		return goodsService;
	}

	@Resource
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

	public File getDoc() {
		return doc;
	}

	public void setDoc(File doc) {
		this.doc = doc;
	}

	public String getDocFileName() {
		return docFileName;
	}

	public void setDocFileName(String docFileName) {
		this.docFileName = docFileName;
	}

	public String getDocContentType() {
		return docContentType;
	}

	public void setDocContentType(String docContentType) {
		this.docContentType = docContentType;
	}

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public String getTargetFileName() {
		return targetFileName;
	}

	public void setTargetFileName(String targetFileName) {
		this.targetFileName = targetFileName;
	}

	private String generateFileName(String fileName) {
		DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String formatDate = format.format(new Date());
		int random = new Random().nextInt(100000);
		System.out.println(fileName);
		int position = fileName.lastIndexOf(".");
		String extension = fileName.substring(position);
		return formatDate + random + extension;
	}

	@Override
	public String execute() {
		String realPath = ServletActionContext.getRequest().getRealPath(
				"/upload");
		String targetDirectory = realPath;
		targetFileName = generateFileName(docFileName);
		File target = new File(targetDirectory, targetFileName);
		try {
			FileUtils.copyFile(doc, target);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Goods goods = new Goods();
		goods.setGdescb("好吃");
		goods.setGname("你好");
		goods.setGpic("../CsustFlea/upload/"+targetFileName);
		goods.setGprice(1);
		goods.setGtype("生活用品");
		goods.setUid(33);
		goodsService.addGoods(goods);
		return "success";
	}
}
