package ctag;

import javax.servlet.jsp.tagext.TagData;
import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;

//Helper Ŭ���� : ��ũ��Ʈ ������ ���� ������ �����ϴ� Ŭ����,TagExtraInfo ���

public class ConnectionTagTEI extends TagExtraInfo{

	@Override
	public VariableInfo[] getVariableInfo(TagData data) {
		VariableInfo vInfo = new VariableInfo(
				data.getAttributeString("id"),"ctag.DBConnection", true, 
				VariableInfo.AT_BEGIN);//���� �±����ĺ��� JSP ��� 
		VariableInfo[] vInfoArray = {vInfo};
		return vInfoArray;
	}
}







