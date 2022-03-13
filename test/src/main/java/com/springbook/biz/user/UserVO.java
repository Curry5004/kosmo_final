package com.springbook.biz.user;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class UserVO {
  	private String user_Id;
	private String name;
	private String password;
	private String birthDay;
	private String gender;
	private String location;
	private String phone_Num;
	private Date join_Date;
	private boolean admin;
	// profile 이미지 업로드용
	private MultipartFile profile_root;
	private String profile_Image;
	private Date modified_Day;
	private boolean user_Available;
	// mbti 이미지 업로드용
	private MultipartFile mbti_root;
	private String mbti_Path;
	private String mbti_Id;
	// mbti 값 받기 용
	private String mbti_Name;
	// admin 회원관리 값 받기 용
	private boolean request;

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPhone_Num() {
		return phone_Num;
	}

	public void setPhone_Num(String phone_Num) {
		this.phone_Num = phone_Num;
	}

	public Date getJoin_Date() {
		return join_Date;
	}

	public void setJoin_Date(Date join_Date) {
		this.join_Date = join_Date;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public String getProfile_Image() {
		return profile_Image;
	}

	public void setProfile_Image(String profile_Image) {
		this.profile_Image = profile_Image;
	}

	public Date getModified_Day() {
		return modified_Day;
	}

	public void setModified_Day(Date modified_Day) {
		this.modified_Day = modified_Day;
	}


	public boolean isUser_Available() {
		return user_Available;
	}

	public void setUser_Available(boolean user_Available) {
		this.user_Available = user_Available;
	}

	public String getMbti_Path() {
		return mbti_Path;
	}

	public void setMbti_Path(String mbti_Path) {
		this.mbti_Path = mbti_Path;
	}

	public String getMbti_Id() {
		return mbti_Id;
	}

	public void setMbti_Id(String mbti_Id) {
		this.mbti_Id = mbti_Id;
	}
	
	

	public MultipartFile getProfile_root() {
		return profile_root;
	}

	public void setProfile_root(MultipartFile profile_root) {
		this.profile_root = profile_root;
	}

	public MultipartFile getMbti_root() {
		return mbti_root;
	}

	public void setMbti_root(MultipartFile mbti_root) {
		this.mbti_root = mbti_root;
	}
	
	public String getMbti_Name() {
		return mbti_Name;
	}

	public void setMbti_Name(String mbti_Name) {
		this.mbti_Name = mbti_Name;
	}

	public boolean getRequest() {
		return request;
	}

	public void setRequest(boolean request) {
		this.request = request;
	}

	@Override
	public String toString() {
		return "UserVO [user_Id=" + user_Id + ", name=" + name + ", password=" + password + ", birthDay=" + birthDay
				+ ", gender=" + gender + ", location=" + location + ", phone_Num=" + phone_Num + ", join_Date="
				+ join_Date + ", admin=" + admin + ", profile_root=" + profile_root + ", profile_Image=" + profile_Image
				+ ", modified_Day=" + modified_Day + ", userAvailable=" + user_Available + ", mbti_root=" + mbti_root
				+ ", mbti_Path=" + mbti_Path + ", mbti_Id=" + mbti_Id + "]";
	}

	
}