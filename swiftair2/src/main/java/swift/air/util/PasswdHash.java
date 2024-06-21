package swift.air.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import swift.air.dto.Member;


public class PasswdHash {
	public static String encrypt(String memberPswd) {
		
		String encryptPasswd="";
		try {
			
			MessageDigest messageDigest=MessageDigest.getInstance("SHA-256");
			
			messageDigest.update(memberPswd.getBytes());
			
			byte[] digest=messageDigest.digest();
			
			for(int i=0;i<digest.length;i++) {
				
				encryptPasswd+=Integer.toHexString(digest[i] & 0xff);
			} 
		} catch (NoSuchAlgorithmException e) {
			System.out.println("[����]�߸��� ��ȣȭ �˰����� ��� �Ͽ����ϴ�.");
		} 
		return encryptPasswd;
	}

}



