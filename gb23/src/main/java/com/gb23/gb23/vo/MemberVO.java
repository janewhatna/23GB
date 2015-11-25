package com.gb23.gb23.vo;


public class MemberVO {
	private int mb_no;
	private String uname;
	private String userid;
	private String passwd;
	private int pqid;
	private String passwdans;
	public int getPqid() {
		return pqid;
	}

	public void setPqid(int pqid) {
		this.pqid = pqid;
	}

	public String getPasswdans() {
		return passwdans;
	}

	public void setPasswdans(String passwdans) {
		this.passwdans = passwdans;
	}

	
	
	//////////새로운 조인///////////////
	private String userID;

	private int pqID;
	private String passwdAns;
	private String preferGID1;
	private String preferGID2;
	private String preferGID3;
	
	
	
	public MemberVO(String userID, String passwd, int pqID, String passwdAns, String preferGID1, String preferGID2,
			String preferGID3) {
		super();
		this.userID = userID;
		this.passwd = passwd;
		this.pqID = pqID;
		this.passwdAns = passwdAns;
		this.preferGID1 = preferGID1;
		this.preferGID2 = preferGID2;
		this.preferGID3 = preferGID3;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public int getPqID() {
		return pqID;
	}

	public void setPqID(int pqID) {
		this.pqID = pqID;
	}

	public String getPasswdAns() {
		return passwdAns;
	}

	public void setPasswdAns(String passwdAns) {
		this.passwdAns = passwdAns;
	}

	public String getPreferGID1() {
		return preferGID1;
	}

	public void setPreferGID1(String preferGID1) {
		this.preferGID1 = preferGID1;
	}

	public String getPreferGID2() {
		return preferGID2;
	}

	public void setPreferGID2(String preferGID2) {
		this.preferGID2 = preferGID2;
	}

	public String getPreferGID3() {
		return preferGID3;
	}

	public void setPreferGID3(String preferGID3) {
		this.preferGID3 = preferGID3;
	}

	/////////////////////////////////////////
	
	private String prefergid1;
	private String prefergid2;
	private String prefergid3;
	
	private int mv_no;
	private String title;
	private String genre;
	private String director;
	private String actors;
	
	private int movID;
	private String subTitle;
	private String summary;
	private int score;
	private String imgURL;
	private String presum;
	
	public int getMovID() {
		return movID;
	}

	public void setMovID(int movID) {
		this.movID = movID;
	}

	public String getSubTitle() {
		return subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getImgURL() {
		return imgURL;
	}

	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}

	public int getMb_no() {
		return mb_no;
	}

	public void setMb_no(int mb_no) {
			this.mb_no = mb_no;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getPrefergid1() {
		return prefergid1;
	}

	public void setPrefergid1(String prefergid1) {
		this.prefergid1 = prefergid1;
	}

	public String getPrefergid2() {
		return prefergid2;
	}

	public void setPrefergid2(String prefergid2) {
		this.prefergid2 = prefergid2;
	}

	public String getPrefergid3() {
		return prefergid3;
	}

	public void setPrefergid3(String prefergid3) {
		this.prefergid3 = prefergid3;
	}

	public int getMv_no() {
		return mv_no;
	}

	public void setMv_no(int mv_no) {
		this.mv_no = mv_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActors() {
		return actors;
	}

	public void setActors(String actors) {
		this.actors = actors;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPresum() {
		return presum;
	}

	public void setPresum(String presum) {
		this.presum = presum;
	}


	private String image;
	private int rating;
	

	public MemberVO(){
		super();		
	}
	
	public MemberVO(String userid, String passwd){
		super();
		this.userid = userid;
		this.passwd = passwd;
	}
	
	public MemberVO(String uname, String userid, String passwd){
		super();
		this.uname = uname;
		this.userid = userid;
		this.passwd = passwd;
	}
	
	public MemberVO(String userid, String passwd, String prefergid1, String prefergid2, String prefergid3){
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.prefergid1 = prefergid1;
		this.prefergid2 = prefergid2;
		this.prefergid3 = prefergid3;
	}
	public MemberVO(String userid, String passwd, int mb_no,String prefergid1, String prefergid2, String prefergid3){
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.mb_no = mb_no;
		this.prefergid1 = prefergid1;
		this.prefergid2 = prefergid2;
		this.prefergid3 = prefergid3;
	}
	
	
	public MemberVO(String userid, String uname, String passwd, String prefergid1, String prefergid2, String prefergid3){
		super();
		this.userid = userid;
		this.uname = uname;
		this.passwd = passwd;
		this.prefergid1 = prefergid1;
		this.prefergid2 = prefergid2;
		this.prefergid3 = prefergid3;
	}
	
	public MemberVO(String userid, String passwd, int pqid, String passwdans, String prefergid1, String prefergid2, String prefergid3, String uname){
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.pqid=pqid;
		this.passwdans=passwdans;
		this.prefergid1 = prefergid1;
		this.prefergid2 = prefergid2;
		this.prefergid3 = prefergid3;
		this.uname = uname;
	}
	
	
	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public MemberVO(String title){
		super();
		this.title = title;
	}
	
	public MemberVO(String title, int rating){
		super();
		this.title = title;
		this.rating = rating;
	}

	public MemberVO(String title, String genre, String director, String actors){
		super();
		this.title = title;
		this.genre = genre;
		this.director = director;
		this.actors = actors;
	}
	
	public MemberVO(int mv_no, String title, String genre, String director, String actors){
		super();
		this.mv_no =  mv_no;
		this.title = title;
		this.genre = genre;
		this.director = director;
		this.actors = actors;
	}
	
	
	
	public MemberVO(int mv_no, String title, String genre, String director, String actors, String image){
		super();
		this.mv_no = mv_no;
		this.title = title;
		this.genre = genre;
		this.director = director;
		this.actors = actors;
		this.image= image;
	}

	public MemberVO(String title, String genre, String director, String actors, int rating){
		super();
		this.title = title;
		this.genre = genre;
		this.director = director;
		this.actors = actors;
		this.rating = rating;
	}

	
	public MemberVO(int mv_no, String title, String genre, String director, String actors, String image, int rating){
		super();
		this.mv_no = mv_no;
		this.title = title;
		this.genre = genre;
		this.director = director;
		this.actors = actors;
		this.image= image;
		this.rating = rating;
	}
	
	
	
	public MemberVO(int movID, String title, String subTitle, String summary, int score, String imgURL){
		super();
		this.movID = movID;
		this.title = title;
		this.subTitle = subTitle;
		this.summary = summary;
		this.score = score;
		this.imgURL = imgURL;
	}
	public MemberVO(int movID, String title, String subTitle, int score, String imgURL, String presum){
		super();
		this.movID = movID;
		this.title = title;
		this.subTitle = subTitle;
		this.score = score;
		this.imgURL = imgURL;
		this.presum = presum;
	}

	@Override
	public String toString() {
		return "MemberVO [mb_no=" + mb_no + ", uname=" + uname + ", userid=" + userid + ", passwd=" + passwd + ", pqid="
				+ pqid + ", passwdans=" + passwdans + ", prefergid1=" + prefergid1 + ", prefergid2=" + prefergid2
				+ ", prefergid3=" + prefergid3 + ", mv_no=" + mv_no + ", title=" + title + ", genre=" + genre
				+ ", director=" + director + ", actors=" + actors + ", movID=" + movID + ", subTitle=" + subTitle
				+ ", summary=" + summary + ", score=" + score + ", imgURL=" + imgURL + ", presum=" + presum + ", image="
				+ image + ", rating=" + rating + "]";
	}
}
