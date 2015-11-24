package url;
import java.io.UnsupportedEncodingException;

public class url {
	
	public url(){}
	
	public String StoQ_YES24(String str) 
	{
		if (str == null || str.length() == 0)
			return null;
	
		String url_yes24 = "http://www.yes24.com/searchcorner/Search?keywordAd=&keyword=&domain=ALL&qdomain=&query=";
		StringBuffer sb = new StringBuffer();
		byte[] b;
		try {
			b = str.getBytes("EUC-KR");
			for (byte c : b) {

				if (48 <= c && c <= 57) {

					sb.append(Integer.toString(c - 48));

				} else if (c == 32) {

					sb.append('+');
				} else {

					sb.append('%');
					sb.append(Integer.toHexString(0xff & c).toUpperCase());
				}
			}

		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
		}

		return url_yes24 + sb.toString();

	}

}
