package mail;

import java.util.Random;

public class MailSend {
	
	//정상적인 id와 email을 입력받으면 메일을 보내고 true 리턴
	public boolean sendPwd(String id, String email) {
		boolean flag = false;
		MemberMgr mgr = new MemberMgr();
		String pwd = mgr.findPwd(id, email);		
		
		int r = new Random().nextInt(1000)+0;
		Random rnd = new Random();
		String rr = String.valueOf((char) ((int) (rnd.nextInt(26)) + 65));
		
		StringBuffer temp = new StringBuffer();		
		for (int i = 0; i < 10; i++) {
		    int rIndex = rnd.nextInt(3);
		    switch (rIndex) {
		    case 0:
		        // a-z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
		        break;
		    case 1:
		        // A-Z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
		        break;
		    case 2:
		        // 0-9
		        temp.append((rnd.nextInt(10)));
		        break;
		    }
		}
		String str = temp.toString();
		
		
		if(pwd!=null&&!pwd.equals("")) {
			String content = id + " / " + pwd;
			String content2 = rr+rr+r+rr+rr+rr;
			String content3 = str;		
			//GmailSend.send("000.com에서 id와 비밀번호를 전송합니다.",content , email);
			System.out.println(str);
			mgr.sendinjeng(str,id);
			flag = true;
		}
		
		return flag;
	}
}
