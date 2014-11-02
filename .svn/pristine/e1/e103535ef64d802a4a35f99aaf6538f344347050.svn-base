package com.csustflea.model;

import org.springframework.stereotype.Component;

@Component
public class PageModel {
	private int page = 1;  /* 当前多少页 */

	private int pageSize =16;   /* 一个页面4个商品 */

	private long countAll;    /* 多少个商品*/

	private int pageCount;   /* 一共多少页 */

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		if (pageSize > 0) {
			this.pageSize = pageSize;
		}
	}

	public long getCountAll() {
		return countAll;
	}

	public void setCountAll(long countAll) {
		this.countAll = countAll;
	}

	public int getPageCount() {
		return pageCount = (int) ((countAll % pageSize == 0) ? (countAll / pageSize)
				: (countAll / pageSize + 1));
	}

}
