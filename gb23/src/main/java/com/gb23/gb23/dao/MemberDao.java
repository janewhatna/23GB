package com.gb23.gb23.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.gb23.gb23.vo.MemberVO;


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
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:janedb", "system", "Qwer1234");
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
			}		}
		return num;
	}

	public void insert(MemberVO vo)  {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:janedb", "system", "Qwer1234");
			String sql = "insert into member(mb_no,id,pwd,name,genre1,genre2,genre3) " + "values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, vo.getMb_no());
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getPwd());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getGenre1());
			pstmt.setString(6, vo.getGenre2());
			pstmt.setString(7, vo.getGenre3());
			int result = pstmt.executeUpdate();
			
			System.out.println("insert result:" +result) ;
			System.out.println(vo);
			
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

	public void rating(MemberVO vo){

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:janedb", "system", "Qwer1234");
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

	public MemberVO logIn(String id, String pwd){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO vo = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "select userid,prefergid1, prefergid2, prefergid3 from movie_user where userid=? and passwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);	
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();//
			System.out.println("1");
			if (rs.next()) {
				vo = new MemberVO(id, pwd, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
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

	public void closeAll(PreparedStatement pstmt, Connection con) {
		try{
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con){
		try{
			if (rs != null)
				rs.close();
			closeAll(pstmt, con);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public ArrayList<MemberVO> getInfo(String content){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "select * from movie where title like '%"+content+"%'";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); // query�� ����

			while (rs.next()) {
				list.add(new MemberVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
						rs.getString(6)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{
			closeAll(rs, pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public ArrayList<MemberVO> getInfo2(String content){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "select * from movie where MOVID in (select  movid from genre where gid in (select gid from genre_info where gName like '%"+content+"%'))";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); // query�� ����

			while (rs.next()) {
				list.add(new MemberVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
						rs.getString(6)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{
			closeAll(rs, pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public ArrayList<MemberVO> getInfo3(String content){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.99:1521:janedb", "system", "Qwer1234");
			String sql = "select * from movie where MOVID in (select  movid from actor where aid in (select aid from actor_info where akname like '%"+content+"%'))";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); // query�� ����

			while (rs.next()) {
				list.add(new MemberVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
						rs.getString(6)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{
			closeAll(rs, pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	/////////////////////detail_search////////////////////////////////
	public ArrayList<MemberVO> getInfo_detail(String genre, String director, String actors){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:janedb", "system", "Qwer1234");
			String sql = "select * from movie where genre like '%"+
			genre+"%' and director like '%"+director+"%' and actors like '%"+actors+"%'";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); // query�� ����

			while (rs.next()) {
				list.add(new MemberVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{
				closeAll(rs, pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
/////////////////////////////////////mem_search_result////////////////////////
	
	public ArrayList<MemberVO> getInfo_mem_search_result(int mb_no, String content){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:janedb", "system", "Qwer1234");
			String sql ="select movie.* from movie, (select * from  genre, (select * from member where member.mb_no="+mb_no+
						") order by DECODE(genre.GENRE, GENRE1, 1, GENRE2, 2, GENRE3, 3)) g where  movie.mv_no = g.mv_no and movie.title like '%"+content+"%'";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); // query�� ����

			while (rs.next()) {
				list.add(new MemberVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{
				closeAll(rs, pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
/////////////////////////////////detail_view////////////////////////////////////

	public ArrayList<MemberVO> getInfo_detail_view(String content){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:janedb", "system", "Qwer1234");
			String sql = "select * from movie where title like '%" + content + "%'";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); // query�� ����

			while (rs.next()) {
				list.add(new MemberVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{
				closeAll(rs, pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
/////////////////////////////////detail_view////////////////////////////////////////
	   public ArrayList<MemberVO> getInfo4(int mv_no){
		      ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		      Connection con = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;

		      try {
		         Class.forName("oracle.jdbc.driver.OracleDriver");
		         con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:janedb", "system", "Qwer1234");
		         String sql = "select * from movie where mv_no = '" + mv_no + "'";
		         System.out.println(sql);
		         pstmt = con.prepareStatement(sql);
		         rs = pstmt.executeQuery(); // query�� ����

		         while (rs.next()) {
		            list.add(new MemberVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
		                  rs.getString(6), rs.getInt(7)));
		         }
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         try{
		         closeAll(rs, pstmt, con);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		      }
		      return list;
		   }
	   
	   /////////////////////영화등록///////////////////////////
	   public void movie_register(int movID, String title, String subTitle, String summary, int score, String imgURL)  {
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:janedb", "system", "Qwer1234");
				String sql = "insert into movie2(movID,title,subTitle,summary,score,imgURL) " + "values(?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);

				pstmt.setInt(1, movID);
				pstmt.setString(2, title);
				pstmt.setString(3, subTitle);
				pstmt.setString(4, summary);
				pstmt.setInt(5, score);
				pstmt.setString(6, imgURL);
			
				int result = pstmt.executeUpdate();
				
				System.out.println("insert result:" +result) ;
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

	   
	   
	   public void movie_register2(int movID, String releaseDate, int runningTime)  {
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:janedb", "system", "Qwer1234");
				String sql = "insert into movie_info(movID,releaseDate,runningTime,ostURL,detailURL,owURL,scoreCnt,viewCount) " +
							"values(?,?,?,'','','','0','0')";
				pstmt = con.prepareStatement(sql);
                      
				pstmt.setInt(1, movID);
				pstmt.setString(2, releaseDate );
				pstmt.setInt(3, runningTime);
			
				int result = pstmt.executeUpdate();
				
				System.out.println("insert result:" +result) ;
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
	   
	   
	   public void movie_register3(int movID,  int gID)  {
				Connection con = null;
				PreparedStatement pstmt = null;
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:janedb", "system", "Qwer1234");
					String sql = "insert into genre(movID,gID) " +
								"values(?,?)";
					pstmt = con.prepareStatement(sql);
	                      
					pstmt.setInt(1, movID);
					pstmt.setInt(2	, gID );
				
				
					int result = pstmt.executeUpdate();
					
					System.out.println("insert result:" +result) ;
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
	   
	   
	   public void movie_register4(int movID,  int dID)  {
				Connection con = null;
				PreparedStatement pstmt = null;
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:janedb", "system", "Qwer1234");
					String sql = "insert into director(movID,dID) " +
								"values(?,?)";
					pstmt = con.prepareStatement(sql);
	                      
					pstmt.setInt(1, movID);
					pstmt.setInt(2	, dID );
				
				
					int result = pstmt.executeUpdate();
					
					System.out.println("insert result:" +result) ;
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
	   
	   
	   public void movie_register5(int movID, int nID)  {
				Connection con = null;
				PreparedStatement pstmt = null;
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:janedb", "system", "Qwer1234");
					String sql = "insert into nation(movID,nID) " +
								"values(?,?)";
					pstmt = con.prepareStatement(sql);
	                      
					pstmt.setInt(1, movID);
					pstmt.setInt(2, nID );
			
				
					int result = pstmt.executeUpdate();
					
					System.out.println("insert result:" +result) ;
					System.out.println(movID );
					
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
	   
	   
	   
	   public void movie_register6(int movID, int aID, String part, String role)  {
				Connection con = null;
				PreparedStatement pstmt = null;
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:janedb", "system", "Qwer1234");
					String sql = "insert into actor(movID,aID,part,role) " +
								"values(?,?,?,?)";
					pstmt = con.prepareStatement(sql);
	                      
					pstmt.setInt(1, movID);
					pstmt.setInt(2, aID );
					pstmt.setString(3, part );
					pstmt.setString(4, role );
			
				
					int result = pstmt.executeUpdate();
					
					System.out.println("insert result:" +result) ;
					System.out.println(movID );
					
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

}