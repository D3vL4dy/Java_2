package cumtrip.vo;

public class MemberVO {
private String 	mem_email   ;
private String 	mem_pass    ;
private String 	mem_name    ;
private String 	mem_addr    ;
private String 	mem_tel     ;
private String 	mem_since   ;
private String 	mem_status  ;
private String 	mem_photo   ;

//좋아요
private String mre_title;
private String mre_date;
private int mr_like;
private String mre_no;


//리뷰

private String sre_no    ;
private String sre_title ;
private String sre_date  ;
private int sre_point ;



public String getMem_email() {
	return mem_email;
}
public void setMem_email(String mem_email) {
	this.mem_email = mem_email;
}
public String getMem_pass() {
	return mem_pass;
}
public void setMem_pass(String mem_pass) {
	this.mem_pass = mem_pass;
}
public String getMem_name() {
	return mem_name;
}
public void setMem_name(String mem_name) {
	this.mem_name = mem_name;
}
public String getMem_addr() {
	return mem_addr;
}
public void setMem_addr(String mem_addr) {
	this.mem_addr = mem_addr;
}
public String getMem_tel() {
	return mem_tel;
}
public void setMem_tel(String mem_tel) {
	this.mem_tel = mem_tel;
}
public String getMem_since() {
	return mem_since;
}
public void setMem_since(String mem_since) {
	this.mem_since = mem_since;
}
public String getMem_status() {
	return mem_status;
}
public void setMem_status(String mem_status) {
	this.mem_status = mem_status;
}
public String getMem_photo() {
	return mem_photo;
}
public void setMem_photo(String mem_photo) {
	this.mem_photo = mem_photo;
}
public String getMre_title() {
	return mre_title;
}
public void setMre_title(String mre_title) {
	this.mre_title = mre_title;
}
public String getMre_date() {
	return mre_date;
}
public void setMre_date(String mre_date) {
	this.mre_date = mre_date;
}
public int getMr_like() {
	return mr_like;
}
public void setMr_like(int mr_like) {
	this.mr_like = mr_like;
}
public String getMre_no() {
	return mre_no;
}
public void setMre_no(String mre_no) {
	this.mre_no = mre_no;
}
public String getSre_no() {
	return sre_no;
}
public void setSre_no(String sre_no) {
	this.sre_no = sre_no;
}
public String getSre_title() {
	return sre_title;
}
public void setSre_title(String sre_title) {
	this.sre_title = sre_title;
}
public String getSre_date() {
	return sre_date;
}
public void setSre_date(String sre_date) {
	this.sre_date = sre_date;
}
public int getSre_point() {
	return sre_point;
}
public void setSre_point(int sre_point) {
	this.sre_point = sre_point;
}



	


	
}
