package shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class OrderMgr {

	private DBConnectionMgr pool;
	
	public OrderMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//Order Insert
	public void insertOrder(OrderBean order) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblOrder(id,productNo, quantity, date, state) "
			       +"values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, order.getId());//�ֹ����̵�
			pstmt.setInt(2, order.getProductNo());//��ǰ��ȣ
			pstmt.setInt(3, order.getQuantity());//�ֹ�����
			pstmt.setString(4, UtilMgr.getDay());//�ֹ���¥
			//������(1), ����(2), �Ա�Ȯ��(3), ����غ�(4), �����(5), �Ϸ�(6)
			pstmt.setString(5, "1"); //�ֹ�����
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//Order List
	public Vector<OrderBean> getOrder(String id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<OrderBean> vlist = new Vector<OrderBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblOrder where id=? order by no desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderBean order = new OrderBean();
				order.setNo(rs.getInt("no"));//�ֹ���ȣ
				order.setId(rs.getString("id"));//����
				order.setProductNo(rs.getInt("productNo"));//���ǰ
				order.setQuantity(rs.getInt("quantity"));//�
				order.setDate(rs.getString("date"));//����
				order.setState(rs.getString("state"));//�ֹ�����
				vlist.addElement(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	////admin//////
	
	// Order All List
		public Vector<OrderBean> getOrderList() {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<OrderBean> vlist = new Vector<>();
			try {
				con = pool.getConnection();
				sql = "select * from tblOrder order by no desc";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					OrderBean order = new OrderBean();
					order.setNo(rs.getInt("no"));// �ֹ���ȣ
					order.setId(rs.getString("id"));// �ֹ�id
					order.setProductNo(rs.getInt("productNo"));// �ֹ���ǰ��ȣ
					order.setQuantity(rs.getInt("quantity"));// �ֹ�����
					order.setDate(rs.getString("date"));// �ֹ���¥
					order.setState(rs.getString("state"));// �ֹ�����
					vlist.addElement(order);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
		}

		// Order Detail
		public OrderBean getOrderDetail(int no) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			OrderBean order = new OrderBean();
			try {
				con = pool.getConnection();
				sql = "select * from tblOrder where no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					order.setNo(rs.getInt("no"));// �ֹ���ȣ
					order.setId(rs.getString("id"));// ��id
					order.setQuantity(rs.getInt("quantity"));// �ֹ�����
					order.setDate(rs.getString("date"));// �ֹ���¥
					order.setState(rs.getString("state"));// �ֹ�����
					order.setProductNo(rs.getInt("productNo"));// �ֹ���ǰ
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return order;
		}
	
		// Order Update
		public boolean updateOrder(int no, String state) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				sql = "update tblOrder set state=? where no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, state);
				pstmt.setInt(2, no);
				if (pstmt.executeUpdate() == 1)
					flag = true;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return flag;
		}

		// Order Delete
		public boolean deleteOrder(int no) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				sql = "delete from tblOrder where no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				if (pstmt.executeUpdate() == 1)
					flag = true;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return flag;
		}	
		
}
