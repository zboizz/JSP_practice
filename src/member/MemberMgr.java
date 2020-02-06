package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class MemberMgr {
		private DBConnectionMgr pool;
		
public MemberMgr() {
	pool = DBConnectionMgr.getInstance();
}

	//�α��� : ����: true, ����: false
	public boolean loginMember(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select pwd from tblmember where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(pwd)) {
					return true;
				}else
					return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	//ID �ߺ�Ȯ�� -true �ߺ�
	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql="select id from tblMember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			flag=rs.next();		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		pool.freeConnection(con, pstmt, rs);
		
		}
		return flag;		
	}	
	
	//�����ȣ �˻�
		//select * from tblZipcod where area3 like '%�������%'
		public Vector<zipCodeBean> zipcodeRead(String area3){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<zipCodeBean> vlist = new Vector<>();
			try {
				con = pool.getConnection();
				sql = "select * from tblZipcode where area3 like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+area3+"%");
				rs = pstmt.executeQuery();
				while(rs.next()) {
					zipCodeBean bean = new zipCodeBean();
					bean.setZipcode(rs.getString(1));
					bean.setArea1(rs.getString(2));
					bean.setArea2(rs.getString(3));
					bean.setArea3(rs.getString(4));
					vlist.addElement(bean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
		}
	
	//ȸ������
	public boolean insertMember(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert tblMember(id,pwd,name,gender,"
					+ "birthday,email,zipcode,address,hobby,job)"
					+ "values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPwd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getBirthday());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getZipcode());
			pstmt.setString(8, bean.getAddress());
			////////////////////////////////////////
			//���ͳ� ���� � - ���ͳ� ���� ���� ��ȭ �
			String hobby[] = bean.getHobby();
			char hb[] = {'0','0','0','0','0'}; //10101
			String lists[] = {"���ͳ�", "����", "����", "��ȭ", "�"};
			for (int i = 0; i < hobby.length; i++) {
				for (int j = 0; j < lists.length; j++) {
					if(hobby[i].equals(lists[j])) {
						hb[j] = '1'; 
						break;
					}//--if
				}//--for2
			}//--for1
			pstmt.setString(9, new String(hb));
			////////////////////////////////////////
			pstmt.setString(10, bean.getJob());
			int cnt = pstmt.executeUpdate();
			if(cnt==1)
				flag= true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	//ȸ�� ���� ��������
		public MemberBean getMember(String id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			MemberBean bean = new MemberBean();
			try {
				con = pool.getConnection();
				sql = "select * from tblMember where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					bean.setId(rs.getString("id"));
					bean.setPwd(rs.getString("pwd"));
					bean.setName(rs.getString("name"));
					bean.setGender(rs.getString("gender"));
					bean.setBirthday(rs.getString("birthday"));
					bean.setEmail(rs.getString("email"));
					bean.setZipcode(rs.getString("zipcode"));
					bean.setAddress(rs.getString("address"));
					////////////////////////////////////////
					String hobby = rs.getString("hobby");
					String hobbys[] = new String[hobby.length()];
					//hobby : 10101 => {"1","0","1","0","1"}
					for (int i = 0; i < hobbys.length; i++) {
						hobbys[i] = hobby.substring(i,i+1);
					}
					bean.setHobby(hobbys);
					////////////////////////////////////////
					bean.setJob(rs.getString("job"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return bean;
		}
		
		//ȸ�� ���� ����...
		public boolean updateMember(MemberBean bean) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				sql = "update tblMember set pwd=?,name=?,gender=?,"
						+ "birthday=?,email=?,zipcode=?,address=?,hobby=?,"
						+ "job=? where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bean.getPwd());
				pstmt.setString(2, bean.getName());
				pstmt.setString(3, bean.getGender());
				pstmt.setString(4, bean.getBirthday());
				pstmt.setString(5, bean.getEmail());
				pstmt.setString(6, bean.getZipcode());
				pstmt.setString(7, bean.getAddress());
				////////////////////////////////////////
				//���ͳ� ���� � - ���ͳ� ���� ���� ��ȭ �
				String hobby[] = bean.getHobby();
				char hb[] = {'0','0','0','0','0'}; //10101
				String lists[] = {"���ͳ�", "����", "����", "��ȭ", "�"};
				for (int i = 0; i < hobby.length; i++) {
					for (int j = 0; j < lists.length; j++) {
						if(hobby[i].equals(lists[j])) {
							hb[j] = '1'; 
							break;
						}//--if
					}//--for2
				}//--for1
				pstmt.setString(8, new String(hb));
				////////////////////////////////////////
				pstmt.setString(9, bean.getJob());
				pstmt.setString(10, bean.getId());
				int cnt = pstmt.executeUpdate();
				if(cnt==1) 
					flag = true;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return flag;
		}			
}