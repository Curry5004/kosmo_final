package com.springbook.biz.user;

import java.util.Date;

public class UserVO {
   private String user_Id;
   private String name;
   private String password;
   private String birthDay;
   private String gender;
   private String location;
   private int phone_Num;
   private Date join_Date;
   private boolean admin;
   private String profile_Image;
   private Date modified_Day;
   private boolean userAvailable;
   private String mbti_Path;
   private String mbti_Id;
public String getUser_Id() {
   return user_Id;
}
public void setUserId(String userId) {
   this.user_Id = userId;
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
public int getPhone_Num() {
   return phone_Num;
}
public void setPhone_Num(int phone_Num) {
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
public boolean isUserAvailable() {
   return userAvailable;
}
public void setUserAvailable(boolean userAvailable) {
   this.userAvailable = userAvailable;
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
@Override
public String toString() {
   return "UserVO [userId=" + user_Id + ", name=" + name + ", password=" + password + ", birthDay=" + birthDay
         + ", gender=" + gender + ", location=" + location + ", phone_Num=" + phone_Num + ", join_Date=" + join_Date
         + ", admin=" + admin + ", profile_Image=" + profile_Image + ", modified_Day=" + modified_Day
         + ", userAvailable=" + userAvailable + ", mbti_Path=" + mbti_Path + ", mbti_Id=" + mbti_Id + "]";
   }
}