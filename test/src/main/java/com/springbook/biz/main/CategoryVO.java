package com.springbook.biz.main;

public class CategoryVO {

	private String category_name;
	private String category_value;
	private String category_img_path;

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	@Override
	public String toString() {
		return "CategoryVO [category_name=" + category_name + ", category_value=" + category_value
				+ ", category_img_path=" + category_img_path + "]";
	}

	public String getCategory_value() {
		return category_value;
	}

	public void setCategory_value(String category_value) {
		this.category_value = category_value;
	}

	public String getCategory_img_path() {
		return category_img_path;
	}

	public void setCategory_img_path(String category_img_path) {
		this.category_img_path = category_img_path;
	}

}
