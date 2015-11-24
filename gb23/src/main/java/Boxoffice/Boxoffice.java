package Boxoffice;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Boxoffice 
{
	static HttpServletRequest request;
	static String[] link_kor;
	static String[] title_kor;
	static String[] link_usa;
	static String[] title_usa;
	static String nation = "kor";
	
	public Boxoffice(HttpServletRequest request) {
		super();
		this.request = request;
		putTitle("kor");
		putTitle("usa");
	}
	
	public static String[] getTitle(String nation)					//타이틀 배열 전체 가져옴
    {	
		
		if(nation.equals("kor"))
		{	return title_kor; 	}
		
		else
		{	return title_usa;	}  
	}
	
	public static String getTitle(int num, String nation)			//타이틀의 num번째 요소 가져옴
    {	
		if(nation.equals("kor"))
		{	return title_kor[num]; 	}
		
		else
		{	return title_usa[num];	}    
    }
	
	//순위 타이틀 설정
    static void putTitle(String nation)
    {
    	String str = "/txt/" + nation + ".txt";
    	String path = request.getRealPath(str);
    	List<String> array = getText(path);
		
    	//리스트를 배열로 변환시켜서 나라에 맞춰 넣음
		if(nation.equals("kor"))
		{	title_kor = array.toArray(new String[array.size()]);	}
		
		else
		{	title_usa = array.toArray(new String[array.size()]);	}
    }
    //text파일의 내용을 가져옴
    static List<String> getText(String textFileName)//파일이 있는경로를 담을 변수
    {	
        String contentFromTxt = ""; 	//파일의 내용을 담을 변수
        try 
        {   contentFromTxt = readContentFrom(textFileName);	}//txt 파일에서 얻어온 내용을 넣어줌.
        catch (FileNotFoundException e) //파일이 존재 하지 않을 때
        {	e.printStackTrace(); System.out.println("존재하지않음-----------------");	}
        catch (IOException e) 			//파일을 읽을 수 없을때
        { 	e.printStackTrace();	}

        List<String> title = spiltTxt(contentFromTxt, "Title");	//text에서 가져온 내용중 title만 가져옴
        return title;
    }
    
    //text파일을 문자열로 반환
    static String readContentFrom(String textFileName) throws IOException 
    {
        BufferedReader bufferedTextFileReader = new BufferedReader(new FileReader(textFileName));
        StringBuilder contentReceiver = new StringBuilder();
        char[] buf = new char[1024];  

        while (bufferedTextFileReader.read(buf) > 0) 
        {	contentReceiver.append(buf);	} 
       
        return contentReceiver.toString();
    }

    //지정된 패턴 안에 있는 정보만 뽑아옴
    static List<String> spiltTxt(String str, String word)
    {
    	String token = "\\{b" + word + "\\}[^\\{\\/b" + word + "\\}]*\'([^\']+)\'\\{\\/b" + word + "\\}";
    	Pattern pattern = Pattern.compile(token);
    	Matcher matcher = pattern.matcher(str);
    	List<String> arr = new ArrayList<String>();
    	
    	while(matcher.find())//패턴을 제외한 값만 가져옴
    	{	arr.add(matcher.group(1));	}
    	return arr;
    }
}
