package ctag;

import javax.servlet.jsp.tagext.TagData;
import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;

//Helper 클래스 : 스크립트 변수에 관한 정보를 제공하는 클래스,TagExtraInfo 상속

public class ConnectionTagTEI extends TagExtraInfo{

	@Override
	public VariableInfo[] getVariableInfo(TagData data) {
		VariableInfo vInfo = new VariableInfo(
				data.getAttributeString("id"),"ctag.DBConnection", true, 
				VariableInfo.AT_BEGIN);//시작 태그이후부터 JSP 사용 
		VariableInfo[] vInfoArray = {vInfo};
		return vInfoArray;
	}
}







