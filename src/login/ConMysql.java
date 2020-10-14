package login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConMysql{
	private Connection conn = null;
	private Statement stat = null;
	private ResultSet res = null;
	private String sDriver="com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/TestDB?serverTimezone=CST";
	private String user = "newuser"; //資料庫使用者
	private String password = "11111111"; //資料庫密碼
	private String sql = "";

	//連接資料庫
	public void conDb() {
		/*載入驅動*/
		try {
			Class.forName(sDriver);
		} catch (ClassNotFoundException e) {
			System.out.print("驅動器載入失敗");
		}
		
		/*進行連線*/
		try {
			conn = DriverManager.getConnection(url, user, password);
			stat = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print("資料庫連接失敗");
		}
	}
	//根據username取出欄位對應的data
	public String getUserData(String column,String username)
	{
		/*執行指令*/
		sql = "SELECT * FROM user WHERE User_Account ='"+ username +"';";
		try {
			res = stat.executeQuery(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
		/*取出資料*/
		String data = "";
		try {
			while(res.next())
			{
				data = res.getString(column);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}
	
	//根據id取出欄位對應的data
	public String getStockData(String column,String id)
	{
		/*執行指令*/
		sql = "SELECT * FROM stock_lastest WHERE stock_id ='"+ id +"';";
		try {
			res = stat.executeQuery(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
		/*取出資料*/
		String data = "";
		try {
			while(res.next())
			{
				data = res.getString(column);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}
	/*取得最新的文章編號*/
	public int getLastestArticleID()
	{
		/*執行指令*/
		sql = "select arti_id from article order by arti_id desc LIMIT 1;";
		try {
			res = stat.executeQuery(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
		/*取出資料*/
		int data = 0;
		try {
			while(res.next())
			{
				data = res.getInt("arti_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}
	/*取得最舊的文章編號*/
	public int getOldestArticleID()
	{
		/*執行指令*/
		sql = "select arti_id from article order by arti_id asc LIMIT 1;";
		try {
			res = stat.executeQuery(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
		/*取出資料*/
		int data = 0;
		try {
			while(res.next())
			{
				data = res.getInt("arti_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}
	/*取得文章總數*/
	public int getArticleCount()
	{
		/*執行指令*/
		sql = "select count(*) from article;";
		try {
			res = stat.executeQuery(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
		/*取出資料*/
		int data = 0;
		try {
			while(res.next())
			{
				data = res.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}
	/*根據文章編號取得資料*/
	public String getArticleData(String column,int arti_id) {
		/*執行指令*/
		sql = "select * from article where arti_id="+arti_id+";";
		try {
			res = stat.executeQuery(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
		/*取出資料*/
		String data = "";
		try {
			while(res.next())
			{
				data = res.getString(column);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}
	/*取得回覆總數*/
	public int getReplyCount(int arti_id)
	{
		/*執行指令*/
		sql = "select count(*) from article_reply where arti_id='"+arti_id+"';";
		try {
			res = stat.executeQuery(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
		/*取出資料*/
		int data = 0;
		try {
			while(res.next())
			{
				data = res.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}
	/*根據文章編號取得回覆資料*/
	public String[][] getReply(int RCount,int arti_id) {
		/*執行指令*/
		sql = "SELECT * FROM article_reply"
			+" left join user"
			+" on user.User_id=article_reply.user_id"
			+" where article_reply.arti_id='"+arti_id+"';";
		try {
			res = stat.executeQuery(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
		/*取出資料*/
		String[][] result = new String[RCount][5];
		int count=0;
		try {
			while(res.next())
			{
				result[count][0] = res.getString("reply_id");
				result[count][1] = res.getString("reply_txt");
				result[count][2] = res.getString("reply_update");
				result[count][3] = res.getString("reply_img");
				result[count][4] = res.getString("User_Name");
				count++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/*根據文章編號取得使用者資料*/
	public String getUserDataWithAricle(String column,int arti_id) {
		/*執行指令*/
		sql =   "SELECT * from article " + 
				"left join user " + 
				"on article.user_id=user.User_id " + 
				"where article.arti_id='"+arti_id+"';";
		try {
			res = stat.executeQuery(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
		/*取出資料*/
		String data = "";
		try {
			while(res.next())
			{
				data = res.getString(column);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}
	/*根據User_id取得自選股總數*/
	public int getSelfStockCount(int User_id)
	{
		/*執行指令*/
		sql =   "SELECT count(*) from stock_self " + 
				"left join stock_lastest " + 
				"on stock_self.stock_id=stock_lastest.stock_id " + 
				"where stock_self.user_id='"+User_id+"';";
		try {
			res = stat.executeQuery(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
		/*取出資料*/
		int data = 0;
		try {
			while(res.next())
			{
				data = res.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}
	/*根據會員編號取得自選股票資料*/
	public String[][] getSelfStockWtihUser(int SCount,int User_id) {
		/*執行指令*/
		sql =   "SELECT * from stock_self " + 
				"left join stock_lastest " + 
				"on stock_self.stock_id=stock_lastest.stock_id " + 
				"where stock_self.user_id='"+User_id+"';";
		try {
			res = stat.executeQuery(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
		/*取出資料*/
		String[][] result = new String[SCount][10];
		int count=0;
		try {
			while(res.next())
			{
				result[count][0] = res.getString("stock_id");
				result[count][1] = res.getString("stock_name");
				result[count][2] = res.getString("stock_trade");
				result[count][3] = res.getString("stock_trunover");
				result[count][4] = res.getString("stock_open");
				result[count][5] = res.getString("stock_max");
				result[count][6] = res.getString("stock_min");
				result[count][7] = res.getString("stock_close");
				result[count][8] = res.getString("stock_diff");
				result[count][9] = res.getString("stock_transaction");
				count++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	/*根據stock_id取得歷史股總數*/
	public int getHisStockCount(String stock_id)
	{
		/*執行指令*/
		sql = "SELECT count(*) FROM TestDB.stock_history "
			+"where stock_id='"+stock_id+"';";
		try {
			res = stat.executeQuery(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
		/*取出資料*/
		int data = 0;
		try {
			while(res.next())
			{
				data = res.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}
	/*根據股票編號取得歷史股票資料*/
	public String[][] getStockHistory(int SCount,String stock_id) {
		/*執行指令*/
		sql = "SELECT * FROM TestDB.stock_history "
			+"where stock_id='"+stock_id+"'"
			+" order by stock_date DESC limit 10;";
		try {
			res = stat.executeQuery(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
		/*取出資料*/
		String[][] result = new String[SCount][11];
		int count=0;
		try {
			while(res.next())
			{
				result[count][0] = res.getString("stock_id");
				result[count][1] = res.getString("stock_name");
				result[count][2] = res.getString("stock_trade");
				result[count][3] = res.getString("stock_trunover");
				result[count][4] = res.getString("stock_open");
				result[count][5] = res.getString("stock_max");
				result[count][6] = res.getString("stock_min");
				result[count][7] = res.getString("stock_close");
				result[count][8] = res.getString("stock_diff");
				result[count][9] = res.getString("stock_transaction");
				result[count][10] = res.getString("stock_date");
				count++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	/*新增自選股進資料庫*/
	public void addSelfStock(String stock_id,String User_id) {
		/*執行指令*/
		sql =  "insert into stock_self values('"+stock_id+"','"+User_id+"');";
		try {
			stat.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
	}
	/*刪除自選股*/
	public void deleteSelfStock(String stock_id,String User_id) {
		/*執行指令*/
		sql = "DELETE from stock_self Where stock_id='"+stock_id+"' AND user_id='"+User_id+"';";
		try {
			stat.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
	}
	/*新增文章近資料庫*/
	public void addArticle(String title,String content,int user_id) {
		/*執行指令*/
		sql =  "insert into article (arti_title,arti_txt,user_id) " + 
				"values('"+title+"','"+content+"','"+user_id+"');";
		try {
			stat.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
	}
	/*新增照片進資料庫*/
	public void updatePhoto(String filename,int arti_id) {
		/*執行指令*/
		sql =  "update article set arti_img='" + filename 
				+ "' where arti_id='"+arti_id+"';";  
		try {
			stat.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
	}
	public void updateReplyPhoto(String filename,int reply_id) {
		/*執行指令*/
		sql =  "update article_reply set reply_img='" + filename 
				+ "' where reply_id='"+reply_id+"';";  
		try {
			stat.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
	}
	/*更新文章近資料庫*/
	public void updateArticle(String title,String content,int arti_id) {
		/*執行指令*/
		sql =   "update article set arti_title='"+title
				+ "',arti_txt='"+content+"'"
				+ " where arti_id='"+arti_id+"';";
		try {
			stat.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
	}
	
	/*更新使用者資料*/
	public void updateUser(String name,String psd,String mail,int User_id) {
		/*執行指令*/
		sql =   "update user " + 
				"set User_Name='"+name+"',User_Password='"+psd+"',User_Email='"+mail+"'" + 
				"where User_id="+User_id+";";
		try {
			stat.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
	}
	/*新增使用者資料進資料庫*/
	public void insert_signup(String account, String upassword, String name, String uGender, String email,
			String birthday) {
		try {
			stat.execute(
					"insert into user(User_Account,User_password,User_name,User_Gender,User_Email,User_Birthday) values('"
							+ account + "','" + upassword + "','" + name + "','" + uGender + "','" + email + "','"
							+ birthday + "')");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print("sucess");
		}
	}
	/*新增文章觀看人數進資料庫*/
	public void updateViewNum(int viewNum, int arti_id) {
		try {
			stat.execute("update article set arti_viewNum = '"+viewNum+"' where arti_id="+arti_id+";");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.print("sucess");
		}
	}
	/*回覆插入*/
	public void addReply(String reply_txt,int arti_id,int user_id) {
		try {
			stat.execute("insert into article_reply (reply_txt,arti_id,user_id)values('"
					+reply_txt+"','"+arti_id+"','"+user_id+"');");
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
	}
	/*取得最新的回覆編號*/
	public int getLastestReplyID()
	{
		/*執行指令*/
		sql = "select reply_id from article_reply order by reply_id desc LIMIT 1;";
		try {
			res = stat.executeQuery(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
		/*取出資料*/
		int data = 0;
		try {
			while(res.next())
			{
				data = res.getInt("reply_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}
	/*圖片插入測試*/
	public void addImg(String encodetxt) {
		try {
			stat.execute("insert into ttaa (img) values('"+encodetxt+"');");
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
	}
	/*圖片讀取測試*/
	public String getImg(String id) {
		sql = "SELECT * FROM ttaa where id='"+id+"';";
		try {
			res = stat.executeQuery(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
		/*取出資料*/
		String data = "";
		try {
			while(res.next())
			{
				data = res.getString("img");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}
	/*根據股票搜尋智慧提示*/
	public String getStockidInfo(String inq) {
		/*執行指令*/
		sql =	"select stock_id from stock_lastest"
				+" where stock_id like '"+inq+"%' limit 10;";
		try {
			res = stat.executeQuery(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
		/*取出資料*/
		String result = "";
		int count=0;
		try {
			while(res.next())
			{
				result += res.getString("stock_id");
				if(count != 9) {
					result += ",";
					count++;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	/*根據股票搜尋智慧提示*/
	public String getStocknameInfo(String inq) {
		/*執行指令*/
		sql =	"select stock_name from stock_lastest"
				+" where stock_name like '"+inq+"%' limit 10;";
		try {
			res = stat.executeQuery(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
		/*取出資料*/
		String result = "";
		int count=0;
		try {
			while(res.next())
			{
				result += res.getString("stock_id");
				if(count != 9) {
					result += ",";
					count++;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
}