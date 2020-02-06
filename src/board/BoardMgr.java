package board;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import upload.DBConnectionMgr;

public class BoardMgr {

	private DBConnectionMgr pool;
	public static final String SAVEFOLDER = "C:/Jsp/myapp/WebContent/board/fileupload/";
	public static final String ENCTYPE = "EUC-KR";
	public static int MAXSIZE = 10 * 1024 * 1024;

	public BoardMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	// Board Insert: ���� ���ε�, ContentType, ref�� ������� ��ġ��
	public void insertBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			/////// ���Ͼ��ε�//////////////////////////
			File dir = new File(SAVEFOLDER);
			// ������ ���ٸ� ���Ӱ� ������
			if (!dir.exists()) {
				// mkdir: ���� ������ ������ ���� �Ұ�
				// mkdirs: ���� ������ ��� ���� ����
				dir.mkdirs();
			}
			MultipartRequest multi = new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCTYPE,
					new DefaultFileRenamePolicy());
			String filename = null;
			int filesize = 0;
			// ����ڰ� ������ ���ε� �� ���
			if(multi.getFilesystemName("filename")!=null) {
				filename = multi.getFilesystemName("filename");
				filesize = (int)multi.getFile("filename").length();
			}
			//// �Խù� contentType: text, html/////
			String content = multi.getParameter("content");//�Խù� ����
			if(multi.getParameter("contentType").equals("TEXT")) {
				content = UtilMgr.replace(content, "<", "&lt;");
			}
				// content type�� text�� �����Ѵٸ�
				// <�� "&lt;"�� �����Ͽ� ���������� ��µǵ��� �Ѵ�.
				// html�� �����Ѵٸ� html������ �ҽ��� �޾Ƶ鿩�� �Խñۿ� ��Ÿ���Ե�
			
			///////////////////////////////////////
			con = pool.getConnection();
			///// ref��/////////////////////////////
			sql = "select max(num) from tblBoard";// ���� ���� num��
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int ref = 0;
			if (rs.next())
				ref = rs.getInt(1) + 1; // ���� ���� num���� 1�� ����
			pstmt.close();
			///////////////////////////////////////
			sql = "insert tblBoard(name,content,subject,ref,pos,depth,";
			sql += "regdate,pass,count,ip,filename,filesize)";
			sql += "values(?, ?, ?, ?, 0, 0, now(), ?, 0, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("name"));
			pstmt.setString(2, content);
			pstmt.setString(3, multi.getParameter("subject"));
			pstmt.setInt(4, ref);
			pstmt.setString(5, multi.getParameter("pass"));
			pstmt.setString(6, multi.getParameter("ip"));
			pstmt.setString(7, filename);
			pstmt.setInt(8, filesize);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	// Board Total Count(�� �Խù� ����)
	public int getTotalCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if (keyWord.trim().equals("") || keyWord == null) {
				// �˻��� �ƴѰ��
				sql = "select count(*) from tblBoard";
				pstmt = con.prepareStatement(sql);
			} else {
				// �˻��� ���

				sql = "select count(*) from tblBoard where " + keyField;
				sql += " like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery();
			if (rs.next())
				totalCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}

	// Board List(�˻�����)
	// getBoardList �޼ҵ忡 ���ϵǴ� ������ �ִ�, �ּ� ������? (10, 1)
	// limit 0, 10 -> 1001~992
	// limit 10,10 -> 991~982
	public Vector<BoardBean> getBoardList(String keyField, String keyWord, int start, int cnt) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BoardBean> vlist = new Vector<BoardBean>();
		try {
			con = pool.getConnection();
			if (keyWord.trim().equals("") || keyWord == null) {
				// �˻��� �ƴ� ���
				sql = "select * from tblBoard order by ref desc, pos"
						+ " limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);// �Խù� ���۹�ȣ
				pstmt.setInt(2, cnt); // ������ �Խù� ����
			} else {
				// �˻��� ���
				sql = "select * from tblBoard where "+ keyField 
						+" like  ? order by ref desc, pos limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+keyWord+"%");
				pstmt.setInt(2, start);//�Խù� ���۹�ȣ
				pstmt.setInt(3, cnt);//������ �Խù� ����
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				// regdate DB���� DATEŸ�������� ��� Ÿ���� getString ����
				bean.setRegdate(rs.getString("regdate"));
				bean.setCount(rs.getInt("count"));
				bean.setFilename(rs.getString("filename"));
				vlist.addElement(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	// Bpard get(�Ѱ��� �Խù���): 13�� �÷� ��� ����
	public BoardBean getBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean();
		try {			
			con = pool.getConnection();
			sql = "select * from tblBoard where num=?";
			pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setContent(rs.getString("content"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setPass(rs.getString("pass"));
				bean.setIp(rs.getString("ip"));
				bean.setCount(rs.getInt("count"));
				bean.setFilename(rs.getString("filename"));
				bean.setFilesize(rs.getInt("filesize"));	
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}		
	
	// count up(��ȸ�� ����)
	public void upCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblBoard set count = count +1 where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	// Board Delete(���ε� ���� ����)
	public void deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select filename from tblBoard where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()&&rs.getString(1)!=null) {
				if(!rs.getString(1).equals("")) {
					File f = new File(SAVEFOLDER+rs.getString(1));
					if(f.exists()) {
						//���ϻ������
						UtilMgr.delete(SAVEFOLDER+rs.getString(1));
					}
				}
			}
			pstmt.close();
			sql = "delete from tblBoard where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	//num  subject   pos ref depth
	// 1     a        0   1
	// 2     b        0   2
	// 3     c        0   3
	// 4     re:b     1   2
	// 5     re:re:b  2   2
	
	//�۰� �ۻ��̸� ������ �� ������ ����� ������ �Ѵ�.
	//pos�� ������� ��ġ���̱⶧���� 4������ pos���� 1
	//4������ 2������ ����̱⶧���� ref���� 2
	
	//Board Update(name, subject, content 3���� ����)
	public void updateBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblBoard set name=?, subject=?, content=? "
					+ "where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getContent());
			pstmt.setInt(4, bean.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	//Board Update2(���ϼ���)
	public void updateBoard2(MultipartRequest multi) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
				//���� ���ε� ���� or ���� ���ε� ���� x
			if(multi.getFilesystemName("filename")!=null) {
				//������ ������ �ִٸ� ����
				int num = Integer.parseInt(multi.getParameter("num"));
				BoardBean bean = getBoard(num);
				String filename = bean.getFilename();
				
				if(filename!=null&&!filename.equals("")) {
					File f = new File(SAVEFOLDER+filename);
					if(f.exists()) {
						//���ϻ���
						UtilMgr.delete(SAVEFOLDER+filename);
					}//--if2
				}//--if1
				filename=multi.getFilesystemName("filename");
				int filesize=(int)multi.getFile("filename").length();
				sql = "update tblBoard set name=?, subject=?, content=?, "
						+ "filename=? where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("name"));
				pstmt.setString(2, multi.getParameter("subject"));
				pstmt.setString(3, multi.getParameter("content"));
				pstmt.setString(4, filename);
				pstmt.setInt(5, filesize);
				pstmt.setInt(6, num);
			}else {
				sql="update tblBoard set name=?, subject=?, content=? "
						+"where num = ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("name"));
				pstmt.setString(2, multi.getParameter("subject"));
				pstmt.setString(3, multi.getParameter("content"));
				pstmt.setInt(4, Integer.parseInt(multi.getParameter("num")));
			}			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}		
	}
	
	
	//Board Reply :�亯�� ����
	public void replyBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblBoard(name,content,subject,ref,pos,depth,regdate,"
					+ "pass,count,ip)values(?, ?, ?, ?, ?, ?, now(), ?, 0, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getContent());
			pstmt.setString(3, bean.getSubject());
			////////////////////////////////////
			pstmt.setInt(4, bean.getRef());//���۰� ������ ref
			pstmt.setInt(5, bean.getPos()+1);//������ pos���� 1�� ����
			pstmt.setInt(6, bean.getDepth()+1);//������ depth���� 1�� ����
			////////////////////////////////////
			pstmt.setString(7, bean.getPass());
			pstmt.setString(8, bean.getIp());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
		
	
	//Board Reply Up: �亯 ��ġ�� ����(����)
	public void replyUpBoard(int ref, int pos) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblBoard set pos = pos +1 "
				 +"where ref=? and pos >?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, pos);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	// Post 1000: �Խù� 1000���� ��
	// ����¡ �� �� �׽�Ʈ�� ���� �Խù� ���� �޼ҵ�
	public void post1000() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblBoard(name,content,subject,ref,pos,depth,regdate,pass,count,ip,filename,filesize)";
			sql += "values('aaa', 'bbb', 'ccc', 0, 0, 0, now(), '1111',0, '127.0.0.1', null, 0);";
			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < 1000; i++) {
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// main
	public static void main(String[] args) {
		BoardMgr mgr = new BoardMgr();
		mgr.post1000();
		System.out.println("����~~");
	}
}
