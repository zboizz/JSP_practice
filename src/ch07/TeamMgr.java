package ch07;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

//JSP DB������ �ʿ��� �޼ҵ带 ����� Ŭ����
public class TeamMgr {

	//Ǯ�����: Connection ��ü�� �̸� 10���� ����� ���´�.
	private DBConnectionMgr pool;
	
	public TeamMgr() {
	//DBConnectionMgr�� �̱��� ������ ������ Ŭ����
	//�̱��� ������ ��ü�� �Ѱ��� ���� �� �ֵ��� ������ Ŭ�����̴�.
		pool = DBConnectionMgr.getInstance();
	
	}
	//����
	//1. ������ �� �Ǿ����� Ȯ���ϱ� ���Ͽ� boolean�� Ȱ��
	//������ �Ǿ��ٸ� true, �ȵǾ��ٸ� false
	
	//2. public boolean postTeam(String name, String city .....) {}
	//��� ���ٸ� �������� ��������� bean�� Ȱ���ϸ� �Ʒ��� ���� �ϳ��� ������ ǥ�� ���� 
		
	public boolean postTeam(TeamBean bean) {
		//3. Ȱ��Ǵ� ��Ű���� ��� sql
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		//4. flag: ���α׷����� ����� ������ ������ ������� ������ �ִٴ� ��, ���ٸ� ������� ���ٴ� ��

		
		//5. try/catch����(���ܹ߻�)
		//
		try {
			//7. DBConnectionMgr���� Connection�� ������
			con=pool.getConnection();
			//8. ���� DB���̺�� ������ �Ǿ���. �����ܰ�� �������� ������ ��.
			//select vs insert,delete, update 
			sql = "insert tblTeam(name, city, age, team) values (?, ?, ?, ?)";
			//sql = "insert tblTeam(name,city,age,team) values(""+name+""+...)";
			//preparestatement�� �ƴ� statement�� �ҽ�
			pstmt = con.prepareStatement(sql);
			
			//9. ?�� �������� ���� ����
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getCity());
			pstmt.setInt(3, bean.getAge());
			pstmt.setString(4, bean.getTeam());
			
			//10. �ϼ��� sql ���� : cnt�� �����̸� 1, �����ϸ� 0
			int cnt = pstmt.executeUpdate(); //insert, update, delete
			if(cnt==1) flag = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//6. Connection �ݳ��ϰ�, pstmt�� close�ؾ��Ѵ�. (�� �����ϱ�)
			pool.freeConnection(con, pstmt);
		}		
	return flag;	
	}
	

//--------------------------------------------------------------------------------
	//����Ʈ: ���ڵ� ������ ��� ��ü�� �����̴�. 
	//�׸��� ������ ��� ��� ��ü�� vector�̴�.
	
	public Vector<TeamBean> listTeam() {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		//select�϶� ���̺� ��Ű��(����), ���ڵ� ����
		ResultSet rs = null;
		String sql = null;
		Vector<TeamBean> vlist = new Vector<TeamBean>();
		
		try {
			con = pool.getConnection();
			sql = "select * from tblTeam";			
			pstmt = con.prepareStatement(sql);
			//���� sql������ ?�� ���⶧���� �ٷ� �����Ѵ�.
			rs = pstmt.executeQuery(); //select ����
				
			while(rs.next()) { //rs�� ��Ŀ���� ���̺��� ù ��
				int num = rs.getInt("num");
				String name = rs.getString("name");
				String city = rs.getString("city");
				int age = rs.getInt("age");
				String team = rs.getString("team");
				//���̺��� ������ ������ ��� ����
				TeamBean bean = new TeamBean();
				bean.setNum(num);
				bean.setName(name);
				bean.setCity(city);
				bean.setAge(age);
				bean.setTeam(team);
				//��� Vector�� ����
				vlist.addElement(bean);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//con�� �ݳ�, pstmt�� rs�� close
		pool.freeConnection(con, pstmt, rs);	
		}return vlist;
	}
	
	
	
	
//----------------------------------------------------------------	
	//���ڵ� �Ѱ� ��������
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
			//num���� pk���̱⶧���� �ϳ��� ���� ���ϵ� ���̴�.
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
	
	
	//����:update tblTeam set name=?, city=?, age=?, team=?, where num=?
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
				//���� -> ����� ���ڵ� ����
				if(cnt==1) flag = true;
				//1�� ������ true, true���̸� ������ ����
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return flag;
		}	
	//����: delete from tblTeam where num=?
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
			//������� �ִ� �޼ҵ嵵 �ݵ�� ��ȯ�� �ʿ�� ����.
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
	
	//select�϶� ���̺� ��Ű��(����), ���ڵ� ����
	ResultSet rs = null;
	String sql = null;
	Vector<TeamBean> tlist = new Vector<TeamBean>();	
	try {
		con = pool.getConnection();
		sql = "select distinct team from tblTeam";			
		pstmt = con.prepareStatement(sql);
		//���� sql������ ?�� ���⶧���� �ٷ� �����Ѵ�.
		rs = pstmt.executeQuery(); //select ����			
		while(rs.next()) { //rs�� ��Ŀ���� ���̺��� ù ��
			String team = rs.getString("team");
			//���̺��� ������ ������ ��� ����
			TeamBean bean = new TeamBean();
			bean.setTeam(team);
			//��� Vector�� ����
			tlist.addElement(bean);
		}			
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		//con�� �ݳ�, pstmt�� rs�� close
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
		rs.beforeFirst(); // rs cursor ù�� ������ �ٽ� �̵�
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













