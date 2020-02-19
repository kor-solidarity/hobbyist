package com.dh.hobbyist.suggest.model.vo;

public class Category implements java.io.Serializable{
	private int categoryCode;
	private int nodeDepth;
	private String nodePath;
	private String nodeName;
	private int parentCode;
	private int childExist;
	
	public Category() {}

	public Category(int categoryCode, int nodeDepth, String nodePath, String nodeName, int parentCode, int childExist) {
		super();
		this.categoryCode = categoryCode;
		this.nodeDepth = nodeDepth;
		this.nodePath = nodePath;
		this.nodeName = nodeName;
		this.parentCode = parentCode;
		this.childExist = childExist;
	}

	public int getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}

	public int getNodeDepth() {
		return nodeDepth;
	}

	public void setNodeDepth(int nodeDepth) {
		this.nodeDepth = nodeDepth;
	}

	public String getNodePath() {
		return nodePath;
	}

	public void setNodePath(String nodePath) {
		this.nodePath = nodePath;
	}

	public String getNodeName() {
		return nodeName;
	}

	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}

	public int getParentCode() {
		return parentCode;
	}

	public void setParentCode(int parentCode) {
		this.parentCode = parentCode;
	}

	public int getChildExist() {
		return childExist;
	}

	public void setChildExist(int childExist) {
		this.childExist = childExist;
	}

	@Override
	public String toString() {
		return "Category [categoryCode=" + categoryCode + ", nodeDepth=" + nodeDepth + ", nodePath=" + nodePath
				+ ", nodeName=" + nodeName + ", parentCode=" + parentCode + ", childExist=" + childExist + "]";
	}
	
	
}
