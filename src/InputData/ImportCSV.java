package InputData;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
public class ImportCSV {
	public static void main(String[] arg) {
		inputCSV();//執行
	}
	public static void inputCSV() {
		//連資料庫
		Connection dbCon = null;
	    Statement stmt = null;
	    String[] item=new String[10];
	    String sDriver="com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/TestDB?serverTimezone=CST";
		String user = "root"; //資料庫使用者
		String password = "12345678"; //資料庫密碼
		/*參數*/
		String path= "/Users/Aspretica/Desktop/";//路徑
		String filename= "ss.txt";//檔案名稱
		String encode = "big5";//讀取檔案使用的編碼
	   
	    try {   //載入JDBC driver 
	    	Class.forName(sDriver);//載入引擎
	    }
	    catch(Exception e){
	    	System.out.print("<h1>無法載入驅動程式</h1>");
	        return;
	    }
	    try   //建立資料連結和Statement物件
	    {
	        dbCon = DriverManager.getConnection(url,user,password);//連接資料庫
	        stmt = dbCon.createStatement(); //啟動sql資料表
	    }
	    catch(SQLException e)
	    {
	        System.out.println("與資料來源連結錯誤");
	        return;
	    }
	    try   
	    {       
	        File f = new File(path+filename);      
	        if(f.isFile()&&f.exists())  
	        {       
	            BufferedReader reader=new BufferedReader(new InputStreamReader(new FileInputStream(f),encode));       
	            String line;       
	            while ((line = reader.readLine()) != null)   
    			{        
    				item = line.split("\\t");//因為預設是tab分開所以用split切開存入字串陣列
					/** 讀取 **/
					try 
					{
						/*lastest*/
//						stmt.execute("insert into stock_lastest(stock_id,stock_name,stock_trade,"
//														+ "stock_trunover,stock_open,stock_max,"
//														+ "stock_min,stock_close,stock_diff,"
//														+ "stock_transaction) "
//														+ "values('"+item[0]+"','"+item[1]+"','"+item[2]
//														+"','"+item[3]+"','"+item[4]+"','"+item[5]
//														+"','"+item[6]+"','"+item[7]+"','"+item[8]+"','"+item[9]+"')");
						/*historty*/
						stmt.execute("insert into stock_history(stock_id,stock_name,stock_trade,"
								+ "stock_trunover,stock_open,stock_max,"
								+ "stock_min,stock_close,stock_diff,"
								+ "stock_transaction,stock_date) "
								+ "values('"+item[0]+"','"+item[1]+"','"+item[2]
								+"','"+item[3]+"','"+item[4]+"','"+item[5]
								+"','"+item[6]+"','"+item[7]+"','"+item[8]+"','"+item[9]+"','2020-09-25')");
					}catch(Exception e) {}
    			}
	            reader.close();
	        }     
	    } catch (Exception e){}
	    try{	        
	    	stmt.close(); 
	        dbCon.close(); 
	    }
	    catch( SQLException e ){}
	    System.out.print("sucess");
	}
}
