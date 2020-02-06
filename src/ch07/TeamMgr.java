package ch07;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

//JSP DB연동에 필요한 메소드를 만드는 클래스
public class TeamMgr {

	//풀링기법: Connection 객체를 미리 10개를 만들어 놓는다.
	private DBConnectionMgr pool;
	
	public TeamMgr() {
	//DBConnectionMgr은 싱글톤 패턴을 구현한 클래스
	//싱글통 패턴은 객체를 한개만 만들 수 있도록 구현한 클래스이다.
		pool = DBConnectionMgr.getInstance();
	
	}
	//저장
	//1. 저장이 잘 되었는지 확인하기 위하여 boolean을 활용
	//저장이 되었다면 true, 안되었다면 false
	
	//2. public boolean postTeam(String name, String city .....) {}
	//빈즈가 없다면 여러개를 써야하지만 bean를 활용하면 아래와 같은 하나의 문구로 표현 가능 
		
	public boolean postTeam(TeamBean bean) {
		//3. 활용되는 패키지는 모두 sql
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		//4. flag: 프로그램에서 깃발을 가지고 있으면 제어권을 가지고 있다는 말, 없다면 제어권이 없다는 말

		
		//5. try/catch삽입(예외발생)
		//
		try {
			//7. DBConnectionMgr에서 Connection을 빌려옴
			con=pool.getConnection();
			//8. 현재 DB테이블과 연결이 되었다. 다음단계는 쿼리문을 날리는 것.
			//select vs insert,delete, update 
			sql = "insert tblTeam(name, city, age, team) values (?, ?, ?, ?)";
			//sql = "insert tblTeam(name,city,age,team) values(""+name+""+...)";
			//preparestatement가 아닌 statement로 할시
			pstmt = con.prepareStatement(sql);
			
			//9. ?에 실질적인 값을 세팅
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getCity());
			pstmt.setInt(3, bean.getAge());
			pstmt.setString(4, bean.getTeam());
			
			//10. 완성된 sql 실행 : cnt는 성공이면 1, 실패하면 0
			int cnt = pstmt.executeUpdate(); //insert, update, delete
			if(cnt==1) flag = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//6. Connection 반납하고, pstmt는 close해야한다. (다 썼으니까)
			pool.freeConnection(con, pstmt);
		}		
	return flag;	
	}
	

//--------------------------------------------------------------------------------
	//리스트: 레코드 한줄을 담는 객체는 빈즈이다. 
	//그리고 여러개 빈즈를 담는 객체가 vector이다.
	
	public Vector<TeamBean> listTeam() {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		//select일때 테이블 스키마(구조), 레코드 단위
		ResultSet rs = null;
		String sql = null;
		Vector<TeamBean> vlist = new Vector<TeamBean>();
		
		try {
			con = pool.getConnection();
			sql = "select * from tblTeam";			
			pstmt = con.prepareStatement(sql);
			//현재 sql문에는 ?가 없기때문에 바로 실행한다.
			rs = pstmt.executeQuery(); //select 실행
				
			while(rs.next()) { //rs의 포커스는 테이블의 첫 행
				int num = rs.getInt("num");
				String name = rs.getString("name");
				String city = rs.getString("city");
				int age = rs.getInt("age");
				String team = rs.getString("team");
				//테이블에서 가져온 값들을 빈즈에 저장
				TeamBean bean = new TeamBean();
				bean.setNum(num);
				bean.setName(name);
				bean.setCity(city);
				bean.setAge(age);
				bean.setTeam(team);
				//빈즈를 Vector에 저장
				vlist.addElement(bean);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//con은 반납, pstmt와 rs는 close
		pool.freeConnection(con, pstmt, rs);	
		}return vlist;
	}
	
	
	
	
//----------------------------------------------------------------	
	//레코드 한개 가져오기
	public TeamBean readTeam(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		TeamBean bean = new TeamBean();
		try {
			con = pool.getConnection();
			sql = "select * from tblTeam where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//num값이 pk값이기때문에 하나의 값만 리턴될 것이다.
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCity(rs.getString(3));
				bean.setAge(rs.getInt(4));
				bean.setTeam(rs.getString(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}return bean;
	}	
	
	
	//수정:update tblTeam set name=?, city=?, age=?, team=?, where num=?
	public boolean updateTeam(TeamBean bean) {		
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				sql = "update tblTeam set name=?,city=?," + 
						"age=?,team=? where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bean.getName());
				pstmt.setString(2, bean.getCity());
				pstmt.setInt(3, bean.getAge());
				pstmt.setString(4, bean.getTeam());
				pstmt.setInt(5, bean.getNum());
				int cnt = pstmt.executeUpdate();
				//실행 -> 적용된 레코드 개수
				if(cnt==1) flag = true;
				//1이 나오면 true, true값이면 저장이 정상
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return flag;
		}	
	//삭제: delete from tblTeam where num=?
	public void deleteTeam(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from tblTeam where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate(); 
			//결과값이 있는 메소드도 반드시 반환할 필요는 없다.
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}	

//------------------------------------------
public Vector<TeamBean> printTeam() {
	Connection con = null;
	PreparedStatement pstmt = null;
	
	//select일때 테이블 스키마(구조), 레코드 단위
	ResultSet rs = null;
	String sql = null;
	Vector<TeamBean> tlist = new Vector<TeamBean>();	
	try {
		con = pool.getConnection();
		sql = "select distinct team from tblTeam";			
		pstmt = con.prepareStatement(sql);
		//현재 sql문에는 ?가 없기때문에 바로 실행한다.
		rs = pstmt.executeQuery(); //select 실행			
		while(rs.next()) { //rs의 포커스는 테이블의 첫 행
			String team = rs.getString("team");
			//테이블에서 가져온 값들을 빈즈에 저장
			TeamBean bean = new TeamBean();
			bean.setTeam(team);
			//빈즈를 Vector에 저장
			tlist.addElement(bean);
		}			
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		//con은 반납, pstmt와 rs는 close
	pool.freeConnection(con, pstmt, rs);	
	}return tlist;
}

//teamNameList
	public String[] readTeamName() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String[] list = null;
		try {
			con = pool.getConnection();
			sql = "select count(distinct team) from tblTeam";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				list = new String[rs.getInt(1)];
			rs.close();
			pstmt.close();
			sql = "select distinct team from tblTeam";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			for(int i=0;rs.next();i++) {
				list[i] = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}

public String[] readTeamName2() {
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = null;
	ResultSet rs = null;
	int i = 0;
	String[] teamN = null;
	try {
		con = pool.getConnection();
		sql = "SELECT DISTINCT team FROM tblteam";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			i++;
		}
		teamN = new String[i];
		i = 0;
		rs.beforeFirst(); // rs cursor 첫행 앞으로 다시 이동
		while (rs.next()) {
			teamN[i] = rs.getString(1);
			i++;
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		pool.freeConnection(con, pstmt, rs);
	}
	return teamN;
}


}













