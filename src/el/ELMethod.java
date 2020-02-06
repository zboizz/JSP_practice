package el;

import java.text.DecimalFormat;


//jsp¿¡¼­ <%=ELMethod.comma(100000)%>
public class ELMethod {	
	public static String comma(int num) {
		DecimalFormat df = new DecimalFormat("#,##0");
		return df.format(num);
	}
}
