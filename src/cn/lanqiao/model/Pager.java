package cn.lanqiao.model;

import java.util.List;

public class Pager<T> {
	// 当前页数据;
	private List<T> datas;
	// 分页相关的参数信息;
	private Integer pageindex; // 当前页页码
	private Integer pagecount;// 总页数;
	private Integer pagesize;// 每页大小；
	private Integer totalRecords;// 总记录数;

	public List<T> getDatas() {
		return datas;
	}

	public void setDatas(List<T> datas) {
		this.datas = datas;
	}

	public Integer getPageindex() {
		return pageindex;
	}

	public void setPageindex(Integer pageindex) {
		this.pageindex = pageindex;
	}

	public Integer getPagecount() {
		return pagecount;
	}

	public void setPagecount(Integer pagecount) {
		this.pagecount = pagecount;
	}

	public Integer getPagesize() {
		return pagesize;
	}

	public void setPagesize(Integer pagesize) {
		this.pagesize = pagesize;
	}

	public Integer getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(Integer totalRecords) {
		this.totalRecords = totalRecords;
	}

}