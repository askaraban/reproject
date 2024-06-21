package swift.air.util;

import org.apache.commons.lang.RandomStringUtils;

public class RandomPasswd {
	public static String randomPasswd(int length) {
		 if (length < 6 || length > 20) {
	            throw new IllegalArgumentException("��й�ȣ ���̴� 6~20�ڸ����� �մϴ�.");
	        }
	        
	        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%";
	        return RandomStringUtils.random(length, characters);
	    }
	}