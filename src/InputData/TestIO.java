package InputData;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
/*測試檔案讀取編碼是否正確*/
public class TestIO {

	public static void main(String[] args) {
		String path="/Users/Aspretica/Desktop/";
		String filename="ss.txt";
		String encode = "big5";
		try   
	    {       
	        File f = new File(path+filename);      
	        if(f.isFile()&&f.exists())  
	        {       
	            BufferedReader reader=new BufferedReader(new InputStreamReader(new FileInputStream(f),encode));       
	            String line;       
	            while ((line = reader.readLine()) != null)   
	            {        
	                System.out.println(line);
	            }         
	            reader.close();
	        }     
	    } catch (Exception e){}     
	}

}
