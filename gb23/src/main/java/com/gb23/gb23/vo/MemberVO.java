package com.gb23.gb23.vo;


public class MemberVO {
	private int mb_no;
	private String name;
	private String id;
	private String pwd;
	private String genre1;
	private String genre2;
	private String genre3;
	
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getGenre1() {
		return genre1;
	}

	public void setGenre1(String genre1) {
		this.genre1 = genre1;
	}

	public String getGenre2() {
		return genre2;
	}

	public void setGenre2(String genre2) {
		this.genre2 = genre2;
	}

	public String getGenre3() {
		return genre3;
	}

	public void setGenre3(String genre3) {
		this.genre3 = genre3;
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
	
	public MemberVO(String id, String pwd){
		super();
		this.id = id;
		this.pwd = pwd;
	}
	
	public MemberVO(String name, String id, String pwd){
		super();
		this.name = name;
		this.id = id;
		this.pwd = pwd;
	}

	public MemberVO(int mb_no, String name, String id, String pwd){
		super();
		this.mb_no= mb_no;
		this.name = name;
		this.id = id;
		this.pwd = pwd;
	}
	
	public MemberVO(String id, String pwd, String genre1, String genre2, String genre3){
		super();
		this.id = id;
		this.pwd = pwd;
		this.genre1 = genre1;
		this.genre2 = genre2;
		this.genre3 = genre3;
	}
	public MemberVO(String id, String pwd, int mb_no,String genre1, String genre2, String genre3){
		super();
		this.id = id;
		this.pwd = pwd;
		this.mb_no = mb_no;
		this.genre1 = genre1;
		this.genre2 = genre2;
		this.genre3 = genre3;
	}
	
	
	public MemberVO(String id, String name, String pwd, String genre1, String genre2, String genre3){
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.genre1 = genre1;
		this.genre2 = genre2;
		this.genre3 = genre3;
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
		return "MemberVO [mb_no=" + mb_no + ", name=" + name + ", id=" + id + ", pwd=" + pwd + ", genre1=" + genre1
				+ ", genre2=" + genre2 + ", genre3=" + genre3 + ", mv_no=" + mv_no + ", title=" + title + ", genre="
				+ genre + ", director=" + director + ", actors=" + actors + ", image=" + image + ", rating=" + rating
				+ "presum=" + presum + "]";
	}

	
}
