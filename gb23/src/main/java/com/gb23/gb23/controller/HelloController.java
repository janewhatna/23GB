package com.gb23.gb23.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;

import com.gb23.gb23.dao.MemberDao;
import com.gb23.gb23.vo.MemberVO;

import Boxoffice.Boxoffice;
import url.url;

@Controller
public class HelloController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Autowired
	private MemberDao dao;
	
	
	@RequestMapping( "/main" )
	public String hello(Model model) {
		//Boxoffice Infomation
		ArrayList<Boxoffice> bKorea, bUsa;
		bKorea = dao.getBoxoffice("KOR");
		bUsa = dao.getBoxoffice("USA");
		model.addAttribute("bKorea", bKorea);
		model.addAttribute("bUsa", bUsa);
		
		return "/WEB-INF/views/main.jsp";  //forwarding
	}
	
	
	
	
	@RequestMapping( "/aaa" )
	public String aaa(Model model) {

		
		return "/WEB-INF/views/mypage.jsp";  //forwarding
	}
	
	
	/////////////////////member-main///////////////////////
	
	@RequestMapping( "/member" )
	public String member(Model model) {
		//Boxoffice Infomation
		ArrayList<Boxoffice> bKorea, bUsa;
		bKorea = dao.getBoxoffice("KOR");
		bUsa = dao.getBoxoffice("USA");
		model.addAttribute("bKorea", bKorea);
		model.addAttribute("bUsa", bUsa);
		return "/WEB-INF/views/member.jsp";  //forwarding
	}
	
	
	
//////////////////////////////////// JOIN /////////////////////////////////////////////////////////
////////////////////////////////////JOIN /////////////////////////////////////////////////////////
@RequestMapping("/joinForm")
public String joinf(){
return "/WEB-INF/views/join.jsp";
}

@RequestMapping("/join") //join.jsp�뿉�꽌 db濡� ���옣�떆�궎怨� main.jsp濡� �씠�룞
public String join( @ModelAttribute MemberVO vo, Model model  ){

/*	int num = dao.MemberNum();*/
/*	vo.setMb_no(num);*/
dao.insert(vo);
model.addAttribute("vo", vo);
System.out.println( vo );
return "/WEB-INF/views/main.jsp";
}	

////////////////////////////////LOG-IN //////////////////////////////
	@RequestMapping("/logInForm")
	public String logInf(){
		return "/WEB-INF/views/logIn.jsp";
	}
	
	@ResponseBody
	@RequestMapping("/login") //logIn.jsp에서 db로 저장시키고 main.jspl로 이동 
	public Object logIn2( @ModelAttribute MemberVO vo, Model model,HttpServletRequest request, HttpServletResponse response 
			,@RequestParam("userid") String userid,@RequestParam("passwd") String passwd)throws ServletException, IOException, SQLException{
		response.setContentType("text/html;charset=utf-8");
		
		vo = dao.logIn(userid, passwd);
		Map<String, Object> map = new HashMap<String, Object>();

		if (vo != null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("loginInfo", vo);
			map.put("no", 1);
		}
		else
		{	map.put("no", 2);	}
		
		return map;
		}
	
	@RequestMapping("/member/{userid}")
	public String member(@PathVariable String userid, Model model){
		MemberVO mvo = new MemberVO();
		mvo = dao.logInS(userid);
		model.addAttribute("vo",mvo);
		System.out.println(mvo);
		
		return "/WEB-INF/views/member.jsp";
	}
	
////////////////////////////////////FINGING  Id&Pwd/////////////////////////////////////////////////////////		

	@RequestMapping("/find")
	public String contact() {
		System.out.println("modal");
		return "/WEB-INF/views/find.jsp";
	}

	@ResponseBody
	@RequestMapping("/idFind")
	public Object IdFind(MemberVO vo, @RequestParam("uname") String uname, @RequestParam("passwd") String passwd, Model model) {
		System.out.println(vo);

		MemberVO mvo = new MemberVO(uname, passwd);
		mvo = dao.Idfind(vo);
		System.out.println("1"+mvo);
		System.out.println("id : " + mvo.getUserid());
		Map<String, String> map = new HashMap<String, String>();

		if (mvo.getUserid() == null) { // id 없음.
			System.out.println("userid");
			map.put("uname", "nothing");
			return map;
		} else { // id있음.
			System.out.println("pid");
			map.put("userid", mvo.getUserid());
			map.put("uname", mvo.getUname());
			return map;
		}

	}

	@ResponseBody
	@RequestMapping("/pwdFind")
	public Object PwdFind( @RequestParam("uname") String uname, 
			@RequestParam("userid") String userid, Model model) {
				
		MemberVO mvo = dao.Pwdfind(uname,userid);
		System.out.println(mvo);
		System.out.println("id : " + mvo.getUserid());
		Map<String, String> map = new HashMap<String, String>();

		if (mvo.getUserid() == null) { // id 없음.
			map.put("uname", "nothing");
			return map;
		} else { // id있음.
			map.put("passwd", mvo.getPasswd());
			map.put("uname", mvo.getUname());
			return map;
		}
	}
	
//////////////////////////MYPAGE/////////////////////////////////////

	@RequestMapping("/mypage")
	public String aaa(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginInfo");
		/* <FINDING PREFFERED GENRE123> */ /* <FINDING PREFFERED GENRE123> */ /*
																				 * <FINDING
																				 * PREFFERED
																				 * GENRE123>
																				 */
		String pg1 = mvo.getPrefergid1();
		String pg2 = mvo.getPrefergid2();
		String pg3 = mvo.getPrefergid3();
		String userid = mvo.getUserid();
		System.out.println(pg1);
		ArrayList<MemberVO> mv1 = dao.findPrefGenre1(pg1);
		ArrayList<MemberVO> mv2 = dao.findPrefGenre2(pg2);
		ArrayList<MemberVO> mv3 = dao.findPrefGenre3(pg3);
		model.addAttribute("mv1", mv1);
		model.addAttribute("mv2", mv2);
		model.addAttribute("mv3", mv3);

		ArrayList<MemberVO> UsMvHis = dao.UserMovHistory(userid);
		model.addAttribute("UsMvHis", UsMvHis);
		
		return "/WEB-INF/views/mypage.jsp"; // forwarding
	}

	
	
	
	//////////////////////////LOG-OUT////////////////////////////////
	
	@RequestMapping("/logout") //logIn.jsp�뿉�꽌 db濡� ���옣�떆�궎怨� main.jspl濡� �씠�룞 
	public void logIn2( @ModelAttribute MemberVO vo, Model model,HttpServletRequest request, HttpServletResponse response 	)throws ServletException, IOException, SQLException{
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession(false);
		// getSession() : 湲곗〈 �꽭�뀡 由ы꽩, �뾾�쑝硫� �깉濡� �깮�꽦
		// getSession(false) : 湲곗〈�꽭�뀡 由ы꽩, �뾾�쑝硫� null諛섑솚 
		if(session!=null&&session.getAttribute("loginInfo")!=null){  
			session.invalidate();  //session invalidate                    
			response.sendRedirect("main");
	}
	}	
	
////////////////////////////////////UPDATE_FORM /////////////////////////////////////////////////////////	
	@RequestMapping("/update_form")
	public String update(@ModelAttribute MemberVO vo, Model model ){
		return "/WEB-INF/views/update.jsp";
	}
////////////////////////////////////update/////////////////////////////////////////////////////////	
	@RequestMapping("/update")
	public String updateInfo(HttpServletRequest request, MemberVO vo){
	System.out.println("update controller");
	dao.updateMypage(vo);
	HttpSession session = request.getSession();
	session.setAttribute("loginInfo", vo);
	return "/WEB-INF/views/member.jsp";
	}
	

//////////////////////////////////// SEARCHING RESULT /////////////////////////////////////////////////////////	
	@RequestMapping("/search_result")
	public String sResult(@RequestParam("selector") String selector,
								@RequestParam("content") String content, Model model){
		ArrayList<MemberVO> list;
		
		try{
			if(selector.equals("title")){
				list = dao.getInfo(content);
				model.addAttribute("list",list);
				System.out.println("here");
				return"/WEB-INF/views/search_result.jsp";
			}else if(selector.equals("genre")){
				list = dao.getInfo2(content);
				model.addAttribute("list",list);
				return"/WEB-INF/views/search_result.jsp";
			}else{
				list = dao.getInfo3(content);
				model.addAttribute("list",list);
				return "/WEB-INF/views/search_result.jsp";
			}
		}catch(Exception e){
			System.out.println("null");
			e.printStackTrace();
		}
		return "/WEB-INF/views/search_result.jsp";
	}
	
	////////////////////////////////////RATING RESULT /////////////////////////////////////////////////////////		
	@ResponseBody
	@RequestMapping("/rating_result")
	public int rResult(@RequestParam("n") int no, @RequestParam("r") int rating, MemberVO vo, HttpServletRequest request){
		HttpSession session = request.getSession();
		vo = (MemberVO)session.getAttribute("loginInfo");

		int result = dao.checkratingUserMovie(vo, no, rating);
		
		if(result == 0)
		{
			dao.ratingUserMovie(vo, no, rating); 
			dao.ratingUserActor(vo, no, rating); 
			dao.ratingUserDirector(vo, no, rating); 
			dao.ratingUserGenre(vo, no, rating); 
			dao.ratingMovie(no, rating); 
		}
		
		return result;
	}
	
////////////////////////////////////URL FOR OST&ORIGINAL /////////////////////////////////////////////////////////		
	@RequestMapping("/url")
	public String option(@RequestParam("name")String title){
		
		System.out.println(title);
		url u = new url();
		String url = u.StoQ_YES24(title);
		
		return url;
	}
	
	
	
	////////////////////////////////////BOXOFFICE CLICK/////////////////////////////////////////////////////////		
	@RequestMapping("/boxoffice_click/{boxTitle}")
	public String boxoffice(@PathVariable String boxTitle, Model model){
		ArrayList<MemberVO> list;
		list = dao.getInfo(boxTitle);
		model.addAttribute("list",list);
		return"/WEB-INF/views/detail_view.jsp";
	}	

	/////////////////////////////硫붿씤�쑝濡� ///////////////////////////////////////////////
	
	@RequestMapping( "/gomain" )
	public String gomain( ) {
		return "/WEB-INF/views/main.jsp";  //forwarding
	}
	
	/////////////////////////////硫ㅻ쾭硫붿씤�쑝濡�///////////////////////////
	@RequestMapping( "/go_mem_main" )
	public String go_mem_main( ) {
		return "/WEB-INF/views/member.jsp";  //forwarding
	}
	
	//////////////////////////////////�긽�꽭寃��깋李�///////////////////////////
	
	@RequestMapping( "/detail_search" )
	public String dtail_search( ) {
		return "/WEB-INF/views/detail_search.jsp";  //forwarding
	}
	
		
	////////////////////////////detail search/////////////////////////////////////////////
		
	
	@RequestMapping("/detail_search2")
	public String dSearch(@RequestParam("genre") String genre,
								@RequestParam("director") String director, 
									@RequestParam("actors") String actors, Model model){
		ArrayList<MemberVO> list;
		
		try{
			list = dao.getInfo_detail(genre,director,actors);
			model.addAttribute("list",list);
			System.out.println("here");
			return"/WEB-INF/views/mem_search_result.jsp";
	
		}catch(Exception e){
			System.out.println("null");
			e.printStackTrace();
		}
		return "/WEB-INF/views/mem_search_result.jsp";
	}	


////////////////////////////mem_search_result///////////////////////////////////////////



@RequestMapping("/mem_search_result")
public String mem_search_result(@RequestParam("userid") String userid,
						@RequestParam("selector") String selector, 
							@RequestParam("content") String content, Model model){
ArrayList<MemberVO> list;

try{
	list = dao.getInfo_mem_search_result(userid,content);
	model.addAttribute("list",list);
	System.out.println("here");
	return"/WEB-INF/views/mem_search_result.jsp";

}catch(Exception e){
	System.out.println("null");
	e.printStackTrace();
}
return "/WEB-INF/views/mem_search_result.jsp";
}	


////////////////////////////////////DETAIL_VIEW/////////////////////////////////////////////////////////		
@RequestMapping("/detail_view/{mv_no}")
public String detail_view(@PathVariable int mv_no, Model model,HttpServletRequest request, HttpServletResponse response){	
	System.out.println("0");
	System.out.println(mv_no);
	
	ArrayList<MemberVO> listM;
	ArrayList<MemberVO> listD;
	ArrayList<MemberVO> listA;
	ArrayList<MemberVO> listN;	
	
	listM = dao.getInfoMv(mv_no); //movie(movid, title, subTitle, summary, score, genre, imgurl, releaseDate, runningTime)
	listD = dao.getInfoDr(mv_no); //Director
	listA = dao.getInfoAc(mv_no); //Actor
	listN = dao.getInfoNt(mv_no); //Nation
	System.out.println("1");
	System.out.println(listM.get(0).getTitle());
	System.out.println(listD.get(0).getdKname());
	System.out.println(listA.get(0).getaKname());
	
    model.addAttribute("listM",listM);
    model.addAttribute("listD",listD);
    model.addAttribute("listA",listA);
    model.addAttribute("listN",listN);
	return"/WEB-INF/views/detail_view.jsp";
}

////////////////////////movie_Register_view////////////////////////////////
@RequestMapping( "/movie_register_view" )
public String movie_register_view( ) {
	return "/WEB-INF/views/movie_register.jsp";  
	
	/*영화ID<input type="text" name="movID"><br />
	제목<input type="text" name="title"><br />
	부제목,제작년도  <input type="text" name="subTitle"><br />
	줄거리    <input type="text" name="summary"><br />
	전체평점    <input type="text" name="score"><br />
	이미지URL<input type="text" name="imgURL"><br />
	개봉일 <input type="text" name="releaseDate"><br />
	상영시간<input type="text" name="runningTime"><br />
	감독ID<input type="text" name="dID"><br />
	배우ID<input type="text" name="aID"><br />
	주연/조연<input type="text" name="part"><br /> <!-- 체크박스 -->
	극중역할<input type="text" name="role"><br />
	장르ID<input type="text" name="gID"><br />
	국가ID<input type="text" name="nID"><br />
	              */
}

////////////////////////////movie_Register/////////////////////////////////

@RequestMapping( "/movie_register" )
public String movie_Register(@RequestParam("movID") int movID,
		@RequestParam("title") String title, 
			@RequestParam("subTitle") String subTitle, 
				@RequestParam("summary") String summary,
				@RequestParam("score") int score,
				@RequestParam("imgURL") String imgURL,
				@RequestParam("releaseDate") String releaseDate,
				@RequestParam("runningTime") int runningTime,
				@RequestParam("dID") int dID,
				@RequestParam("aID") int aID,
				@RequestParam("part") String part,
				@RequestParam("role") String role,
				@RequestParam("gID") int gID,
				@RequestParam("nID") int nID,
				Model model){



		
		dao.movie_register(movID,title,subTitle,summary,score,imgURL);
		dao.movie_register2(movID, releaseDate, runningTime);
		dao.movie_register3(movID,gID);
		dao.movie_register4(movID, dID);
		dao.movie_register5(movID, nID);
		dao.movie_register6(movID, aID,part,role);
		model.addAttribute("movID",movID);
		System.out.println("movie_Regist ok");
		return"/WEB-INF/views/main.jsp";
	
}	
///////////////////////////////////////////////////////////////////////////////////////	
@RequestMapping("/Idcheck")
public void Idcheck(@RequestParam("userID") String userID, HttpServletResponse res)
throws Exception {
	System.out.println(userID+"11");
String uid = dao.idcheck(userID);
PrintWriter out = res.getWriter();

if(uid == null){
out.print("false");
}else{
out.print("true");
}

out.close();
}

////////////////////////////////////delete/////////////////////////////////////////////////////////	
@RequestMapping("/delete")
public String delete(@ModelAttribute MemberVO vo, HttpServletRequest request, Model model){
//int num = dao.MemberNum();
HttpSession session = request.getSession();
vo = (MemberVO)session.getAttribute("loginInfo");

dao.delete(vo);
//model.addAttribute("vo", vo);
//System.out.println( vo );
return "/WEB-INF/views/main.jsp";
}
////////////////////////////////////PWDHINT /////////////////////////////////////////////////////////
@RequestMapping("/pwdhint")
public String pwdhint(HttpServletRequest request, MemberVO vo, Model model){
String pwd = dao.passhint(vo);
model.addAttribute("pwd", pwd);
return "/WEB-INF/views/pwdfind_result.jsp";
}
}
