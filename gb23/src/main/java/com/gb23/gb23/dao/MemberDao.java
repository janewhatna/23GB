package com.gb23.gb23.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gb23.gb23.vo.MemberVO;

import Boxoffice.Boxoffice;

@Repository
public class MemberDao {
	public ResultSet rs = null;

	private static MemberDao instance = new MemberDao();

	private MemberDao() {
	}

	public static MemberDao getInstance() {
		return instance;
	}

	public int MemberNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "select s_num.nextval from dual";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("not working");
			System.out.println(e.getMessage());
		} finally {
			try {
				closeAll(pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return num;
	}

	public void insert(MemberVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "insert into movie_user (userid,passwd,pqid,passwdans,prefergid1,prefergid2,prefergid3)"
					+ "values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getPasswd());
			pstmt.setInt(3, vo.getPqID());
			pstmt.setString(4, vo.getPasswdAns());
			pstmt.setString(5, vo.getPreferGID1());
			pstmt.setString(6, vo.getPreferGID2());
			pstmt.setString(7, vo.getPreferGID3());
			int result = pstmt.executeUpdate();

			System.out.println("insert result:" + result);
			System.out.println(vo + "ddd");

		} catch (Exception e) {
			System.out.println("not working");
			System.out.println(e.getMessage());
		} finally {
			try {
				closeAll(pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void rating(MemberVO vo) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "update movie set rating=? where mv_no=?";
			pstmt = con.prepareStatement(sql);
			System.out.println(vo.getRating());
			System.out.println(vo.getTitle());
			pstmt.setInt(1, vo.getRating());
			pstmt.setInt(2, vo.getMv_no());

			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("It didn't work");
			System.out.println(e.getMessage());
		} finally {
			try {
				closeAll(pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	//////////////////////////////// GET-LOGIN//////////////////////////////////////////////

	public MemberVO logInS(String userid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO vo = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "select userid, passwd, pqid, prefergid1, prefergid2, prefergid3 from movie_user where userid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();//
			System.out.println("1");
			if (rs.next()) {
				vo = new MemberVO(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
						rs.getString(6));
			}
		} catch (Exception e) {
			System.out.println("2");
			e.printStackTrace();
		} finally {
			try {
				System.out.println("3");
				closeAll(rs, pstmt, con);
			} catch (Exception e) {
				System.out.println("4");
				e.printStackTrace();
			}
		}
		System.out.println("5");
		return vo;
	}

	public MemberVO logIn(String userid, String passwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO vo = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "select userid, passwd, pqid, passwdans, prefergid1, prefergid2, prefergid3, uname from movie_user where userid=? and passwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();//

			if (rs.next()) {
				System.out.println("11");
				vo = new MemberVO(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),rs.getString(6),rs.getString(7), rs.getString(8));
			}
		} catch (Exception e) {
			System.out.println("2");
			e.printStackTrace();
		} finally {
			try {
				System.out.println("3");
				closeAll(rs, pstmt, con);
			} catch (Exception e) {
				System.out.println("4");
				e.printStackTrace();
			}
		}
		System.out.println("5");
		System.out.println(vo);
		return vo;
	}

	///////////////////// pwdFind//////////////////////////////////////////////
	public MemberVO Pwdfind(String uname, String userid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO vo = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "select uname, userid , passwd from  movie_user where uname=? and userid=?";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			System.out.println(uname + userid);
			pstmt.setString(1, uname);
			pstmt.setString(2, userid);
			rs = pstmt.executeQuery(); // query占쏙옙 占쏙옙占쏙옙
			System.out.println("1");
			while (rs.next()) {
				System.out.println("2");
				vo = new MemberVO(rs.getString(1), rs.getString(2), rs.getString(3));
			}
		} catch (Exception e) {
			System.out.println("3");
			e.printStackTrace();
		} finally {
			try {
				System.out.println("4");
				closeAll(rs, pstmt, con);
			} catch (Exception e) {
				System.out.println("5");
				e.printStackTrace();
			}
		}
		System.out.println("6");
		return vo;
	}
	///////////////////// IdFind//////////////////////////////////////////////
	public MemberVO Idfind(MemberVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "select * from movie_user where uname=? and passwd=?";
			System.out.println(vo.getUname() + vo.getPasswd());
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getUname());
			pstmt.setString(2, vo.getPasswd());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo = new MemberVO(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8));
				System.out.println("1");
			}
		} catch (Exception e) {
			System.out.println("2");
			e.printStackTrace();
		} finally {
			try {
				System.out.println("3");
				closeAll(rs, pstmt, con);
			} catch (Exception e) {
				System.out.println("4");
				e.printStackTrace();
			}
		}
		System.out.println("2" + vo);

		return vo;
	}

	public void closeAll(PreparedStatement pstmt, Connection con) {
		try {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) {
		try {
			if (rs != null)
				rs.close();
			closeAll(pstmt, con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public ArrayList<MemberVO> getInfo(String content) {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "select title, movID, genre, subTitle, score, imgURL, presum from movie where REPLACE(title, ' ', '') like REPLACE('%"+content+"%', ' ', '')";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); // query占쏙옙 占쏙옙占쏙옙

			while (rs.next()) {
				list.add(new MemberVO(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getString(4),rs.getInt(5), rs.getString(6), rs.getString(7)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				closeAll(rs, pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public ArrayList<MemberVO> getInfo2(String content) {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "select title, movID, genre, subTitle, score, imgURL, presum from movie where MOVID in (select  movid from genre where gid in (select gid from genre_info where REPLACE(genre, ' ', '') like REPLACE('%"+content+"%', ' ', '')))";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); // query占쏙옙 占쏙옙占쏙옙

			while (rs.next()) {
				list.add(new MemberVO(rs.getString(1), rs.getInt(2),rs.getString(3), rs.getString(4),rs.getInt(5), rs.getString(6), rs.getString(7)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				closeAll(rs, pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public ArrayList<MemberVO> getInfo3(String content) {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "select title, movID, genre, subTitle, score, imgURL, presum from movie where MOVID in (select  movid from actor where aid in (select aid from actor_info where REPLACE(akname, ' ', '') like REPLACE('%"+content+"%', ' ', '')))";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); // query占쏙옙 占쏙옙占쏙옙

			while (rs.next()) {
				list.add(new MemberVO(rs.getString(1),rs.getInt(2), rs.getString(3), rs.getString(4),rs.getInt(5), rs.getString(6), rs.getString(7)));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				closeAll(rs, pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	///////////////////// detail_search////////////////////////////////
	public ArrayList<MemberVO> getInfo_detail(String genre, String director, String actors) {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "select * from movie where genre like '%" + genre + "%' and director like '%" + director
					+ "%' and actors like '%" + actors + "%'";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); // query�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕

			while (rs.next()) {
				list.add(new MemberVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				closeAll(rs, pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	///////////////////////////////////// mem_search_result////////////////////////

	public ArrayList<MemberVO> getInfo_mem_search_result(String userid, String content) {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = " select movie.* from (select mid, gid, p1, p2, p3 from (select ROW_NUMBER() over (PARTITION BY genre.MOVID order by genre.MOVID) as Myrow, genre.MOVID as mid, genre.gid as gid, g.prefergid1 as p1, g.prefergid2 as p2, g.prefergid3 as p3 from  genre, (select * from movie_user where movie_user.userid='"
					+ userid
					+ "') g) where Myrow = 1 order by DECODE(gid, p1, 1, p2, 2, p3, 3)), movie where mid in movie.movid and  replace(title, ' ', '') like replace('%"
					+ content + "%', ' ', '')";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); // query�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕

			while (rs.next()) {
				list.add(new MemberVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
						rs.getString(6)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				closeAll(rs, pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	///////////////////////////////// detail_view////////////////////////////////////

	public ArrayList<MemberVO> getInfo_detail_view(String content) {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "select * from movie where title like '%" + content + "%'";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); // query�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕

			while (rs.next()) {
				list.add(new MemberVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				closeAll(rs, pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

/////////////////////////////////detail_view(TABLE MOVIE)////////////////////////////////////////
	public ArrayList<MemberVO> getInfoMv(int movid) {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "select movid, title, subTitle, summary, score, genre, imgurl, releaseDate, runningTime from movie where movid = "
					+ movid + "";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(new MemberVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				closeAll(rs, pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

/////////////////////////////////detail_view(TABLE DIRECTOR)////////////////////////////////////////
	public ArrayList<MemberVO> getInfoDr(int movid) {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "select di.did, di.dKname, di.dEname from(select dID from movie, director where movie.movID=director.movID AND movie.movID="
					+ movid + ")dr, director_info di where dr.dID=di.dID ";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(new MemberVO(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				closeAll(rs, pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

/////////////////////////////////detail_view(TABLE ACTOR)////////////////////////////////////////
	public ArrayList<MemberVO> getInfoAc(int movid) {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "select ai.aKname, ai.aEname, ai.aID from(select aID from movie, actor where movie.movID=actor.movID AND movie.movID="
					+ movid + ")ar, actor_info ai where ar.aID=ai.aID ";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(new MemberVO(rs.getString(1), rs.getString(2), rs.getInt(3)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				closeAll(rs, pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

/////////////////////////////////detail_view(TABLE NATION)////////////////////////////////////////
	public ArrayList<MemberVO> getInfoNt(int movid) {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "select ni.nID, ni.nName from(select nID from movie, nation where movie.movid=nation.movid and movie.movid="
					+ movid + ")nr, nation_info ni where nr.nid = ni.nid ";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(new MemberVO(rs.getInt(1), rs.getString(2)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				closeAll(rs, pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}


	///////////////////// 占쎌겫占쎌넅占쎈쾻嚥∽옙///////////////////////////
	public void movie_register(int movID, String title, String subTitle, String summary, int score, String imgURL) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "insert into movie2(movID,title,subTitle,summary,score,imgURL) " + "values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, movID);
			pstmt.setString(2, title);
			pstmt.setString(3, subTitle);
			pstmt.setString(4, summary);
			pstmt.setInt(5, score);
			pstmt.setString(6, imgURL);

			int result = pstmt.executeUpdate();

			System.out.println("insert result:" + result);
			System.out.println(movID + title);

		} catch (Exception e) {
			System.out.println("not working");
			System.out.println(e.getMessage());
		} finally {
			try {
				closeAll(pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	public void movie_register2(int movID, String releaseDate, int runningTime) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "insert into movie_info(movID,releaseDate,runningTime,ostURL,detailURL,owURL,scoreCnt,viewCount) "
					+ "values(?,?,?,'','','','0','0')";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, movID);
			pstmt.setString(2, releaseDate);
			pstmt.setInt(3, runningTime);

			int result = pstmt.executeUpdate();

			System.out.println("insert result:" + result);
			System.out.println(movID + releaseDate);

		} catch (Exception e) {
			System.out.println("not working");
			System.out.println(e.getMessage());
		} finally {
			try {
				closeAll(pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void movie_register3(int movID, int gID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "insert into genre(movID,gID) " + "values(?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, movID);
			pstmt.setInt(2, gID);

			int result = pstmt.executeUpdate();

			System.out.println("insert result:" + result);
			System.out.println(movID);

		} catch (Exception e) {
			System.out.println("not working");
			System.out.println(e.getMessage());
		} finally {
			try {
				closeAll(pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void movie_register4(int movID, int dID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "insert into director(movID,dID) " + "values(?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, movID);
			pstmt.setInt(2, dID);

			int result = pstmt.executeUpdate();

			System.out.println("insert result:" + result);
			System.out.println(movID);

		} catch (Exception e) {
			System.out.println("not working");
			System.out.println(e.getMessage());
		} finally {
			try {
				closeAll(pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void movie_register5(int movID, int nID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "insert into nation(movID,nID) " + "values(?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, movID);
			pstmt.setInt(2, nID);

			int result = pstmt.executeUpdate();

			System.out.println("insert result:" + result);
			System.out.println(movID);

		} catch (Exception e) {
			System.out.println("not working");
			System.out.println(e.getMessage());
		} finally {
			try {
				closeAll(pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void movie_register6(int movID, int aID, String part, String role) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "insert into actor(movID,aID,part,role) " + "values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, movID);
			pstmt.setInt(2, aID);
			pstmt.setString(3, part);
			pstmt.setString(4, role);

			int result = pstmt.executeUpdate();

			System.out.println("insert result:" + result);
			System.out.println(movID);

		} catch (Exception e) {
			System.out.println("not working");
			System.out.println(e.getMessage());
		} finally {
			try {
				closeAll(pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	////////////////////////////////////////////////////////////////////////////////////
	public String idcheck(String userID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String uid = null;
		String sql = "select userID from movie_user where userID=?";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println("3");
				uid = rs.getString(1);
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			closeAll(rs, pstmt, con);
		}
		System.out.println(uid);
		return uid;
	}

	////////////////////////////////////// BOXOFFICE//////////////////////////////////////////////
	public ArrayList<Boxoffice> getBoxoffice(String nation) {
		ArrayList<Boxoffice> list = new ArrayList<Boxoffice>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select btitle, imgurl, bID from BOXOFFICE_" + nation + " order by bID";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(new Boxoffice(rs.getString(1), rs.getString(2), rs.getInt(3)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				closeAll(rs, pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	public void updateMypage(MemberVO vo) {
		System.out.println("--------------"+vo.getUserid());
		System.out.println(vo.getPreferGID1());
		System.out.println(vo.getPreferGID2());
		System.out.println(vo.getPreferGID3());
		System.out.println(vo.getPasswd());
		System.out.println(vo.getPqid());
		System.out.println(vo.getPasswdans()+"--------------");
		   Connection con = null;
		   PreparedStatement pstmt = null;
		   ResultSet rs = null;
		   String id = null;
		   String sql = "update movie_user set passwd=?, pqid=?, passwdans=?, preferGID1=?, preferGID2=?, preferGID3=? where userid=?";
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
		        con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, vo.getPasswd());
				pstmt.setInt(2, vo.getPqid());
				pstmt.setString(3, vo.getPasswdans());
				pstmt.setString(4, vo.getPreferGID1());
				pstmt.setString(5, vo.getPreferGID2());
				pstmt.setString(6, vo.getPreferGID3());
				pstmt.setString(7, vo.getUserid());
				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println(e);
			} finally {
				closeAll(rs, pstmt, con);
			}
}
	public String delete(MemberVO vo){
		   Connection con = null;
		   PreparedStatement pstmt = null;
		   String id = null;
		   
		   try {
			   Class.forName("oracle.jdbc.driver.OracleDriver");
		        con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
		         String sql = "delete from movie_user where userid=?";
		         System.out.println(sql);
		         pstmt = con.prepareStatement(sql);
					pstmt.setString(1, vo.getUserid());
					pstmt.executeUpdate();
		   } catch (Exception e) {
				System.out.println(e);
			}
		return id;
	
	   }
	public String passhint(MemberVO vo)  {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String pwd = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
	        con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "select passwd from member where userid=? and passwdans=? and uname=? and pqid=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getPasswdans());
			pstmt.setString(3, vo.getUname());
			pstmt.setInt(4, vo.getPqid());
			rs = pstmt.executeQuery();
			while(rs.next()){
				pwd = rs.getString("passwd");
				
			}
			
			} catch (Exception e) {
			System.out.println("not working");
			System.out.println(e.getMessage());
		} finally {
			try {
				closeAll(pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return pwd;
	}
}