package model.cafe;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.JNDI;

public class CafeDAO {
	
	String SQL_SELECTALL="SELECT * FROM CAFE ORDER BY PRICE ASC";
	String SQL_SELECTONE="SELECT * FROM CAFE WHERE COFF=?";
	String SQL_INSERT="INSERT INTO CAFE VALUES (?,?)";
	String SQL_UPDATE="UPDATE CAFE SET PRICE=? WHERE COFF=?";
	String SQL_DELETE="DELETE FROM CAFE WHERE COFF=?";
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	// SQL_SELECTALL="SELECT * FROM CAFE ORDER BY PRICE ASC"
	public ArrayList<CafeVO> getMenuList(){
		ArrayList<CafeVO> datas=new ArrayList<CafeVO>();
		try {
			conn=JNDI.connect();
			
			pstmt=conn.prepareStatement(SQL_SELECTALL);
			ResultSet rs=pstmt.executeQuery();
			
			while(rs.next()) {
				CafeVO data=new CafeVO();
				data.setCoff(rs.getString("coff"));
				data.setPrice(rs.getInt("price"));
				datas.add(data);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	// SQL_SELECTONE="SELECT * FROM CAFE WHERE COFF=?"
	public CafeVO getMenu(CafeVO vo) {
		CafeVO data=new CafeVO();
		try {
			conn=JNDI.connect();
			
			pstmt=conn.prepareStatement(SQL_SELECTONE);
			pstmt.setString(1, vo.getCoff());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				data=new CafeVO();
				data.setCoff(rs.getString("coff"));
				data.setPrice(rs.getInt("price"));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return data;
	}
	
	// SQL_INSERT="INSERT INTO CAFE VALUES (?,?)"
	public boolean newMenu(CafeVO vo) {
		boolean res=false;
		try {
			conn=JNDI.connect();
			
			pstmt=conn.prepareStatement(SQL_INSERT);
			pstmt.setString(1, vo.getCoff());
			pstmt.setInt(2, vo.getPrice());
			pstmt.executeUpdate();
			res=true;
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	// SQL_UPDATE="UPDATE CAFE SET PRICE=? WHERE COFF=?"
	public boolean chgMenu(CafeVO vo) {
		boolean res=false;
		try {
			conn=JNDI.connect();
			
			pstmt=conn.prepareStatement(SQL_UPDATE);
			pstmt.setInt(1, vo.getPrice());
			pstmt.setString(2, vo.getCoff());
			pstmt.executeUpdate();
			res=true;
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	// SQL_DELETE="DELETE FROM CAFE WHERE COFF=?"
	public boolean dltMenu(CafeVO vo) {
		boolean res=false;
		try {
			conn=JNDI.connect();
			
			pstmt=conn.prepareStatement(SQL_DELETE);
			pstmt.setString(1, vo.getCoff());
			pstmt.executeUpdate();
			res=true;
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
}
