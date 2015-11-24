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

import url.url;

@Controller
public class HelloController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Autowired
	private MemberDao dao;
	
	
	@RequestMapping( "/main" )
	public String hello( ) {
		return "/WEB-INF/views/main.jsp";  //forwarding
	}
	
	
	/////////////////////member-main///////////////////////
	
	@RequestMapping( "/member" )
	public String member( ) {
		return "/WEB-INF/views/member.jsp";  //forwarding
	}
	
	
	
//////////////////////////////////// JOIN /////////////////////////////////////////////////////////
	@RequestMapping("/joinForm")
	public String joinf(){
		return "/WEB-INF/views/join.jsp";
	}

	@RequestMapping("/join") //join.jsp�뿉�꽌 db濡� ���옣�떆�궎怨� main.jsp濡� �씠�룞
	public String join( @ModelAttribute MemberVO vo, Model model  ){
		
		int num = dao.MemberNum();
		vo.setMb_no(num);
		dao.insert(vo);
		model.addAttribute("vo", vo);
		System.out.println( vo );
		return "/WEB-INF/views/main.jsp";
	}	
	
@RequestMapping("/aaa")
public String aaa(){
return "/WEB-INF/views/AAA.jsp";
}	

////////////////////////////////LOG-IN //////////////////////////////
	@RequestMapping("/logInForm")
	public String logInf(){
		return "/WEB-INF/views/logIn.jsp";
	}
	
	@RequestMapping("/login") //logIn.jsp�뿉�꽌 db濡� ���옣�떆�궎怨� main.jspl濡� �씠�룞 
	public String logIn2( @ModelAttribute MemberVO vo, Model model,HttpServletRequest request, HttpServletResponse response 
							,@RequestParam("id") String id,@RequestParam("pwd") String password)throws ServletException, IOException, SQLException{
		response.setContentType("text/html;charset=utf-8");
	
	vo = dao.logIn(id, password);
	String path = "login_fail.jsp";
	if (vo != null) {
		HttpSession session = request.getSession();//session maintains
		session.setAttribute("loginInfo", vo);
		return "/WEB-INF/views/member.jsp";
	}
	// request�몴占� 占쎈쐷 占쎌�筌욑옙占쎈릭占쎈뮉筌잛럩�뵠 占쎄퐣甕곌쑴�걹占쎈퓠 占쎌�占쎌뒠占쎈릭占쎈뼄.
	response.sendRedirect(path);
	return  path;
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
	
////////////////////////////////////UPDATE /////////////////////////////////////////////////////////	
	@RequestMapping("/update_form")
	public String update(){
		return "/WEB-INF/views/update.jsp";
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
	public  Object rResult(@RequestParam("n") int no, 
								@RequestParam("r") int rating ){
	
		System.out.println( no + ":" + rating );
		MemberVO mvo = new MemberVO();
		mvo.setMv_no(no);
		mvo.setRating(rating);
		dao.rating(mvo); 
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "result", "ok" );
		map.put( "rating", rating );
		map.put("no:", no);
		return map;
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
public String mem_search_result(@RequestParam("mb_no") int mb_no,
						@RequestParam("selector") String selector, 
							@RequestParam("content") String content, Model model){
ArrayList<MemberVO> list;

try{
	list = dao.getInfo_mem_search_result(mb_no,content);
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
public String detail_view(@PathVariable int mv_no, Model model){	
	System.out.println(mv_no);
	ArrayList<MemberVO> list;
	list = dao.getInfo4(mv_no);
    model.addAttribute("list",list);
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

}
