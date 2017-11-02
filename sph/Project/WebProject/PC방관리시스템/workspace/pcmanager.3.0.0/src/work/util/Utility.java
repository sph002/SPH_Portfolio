package work.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

public class Utility {
	/*
	1.	암호 등의 보안문자정보 출력시 2자리만 보여주고 
	남은 문자는 *(기호)로 대체 출력위한 메서드

	메서드명 : convertSecureString
	아규먼트 : String
	반환타입 : String

	참고 : String, StringBuffer, StringBuilder
	*/
	public static String convertSecureString(String data) {
		StringBuilder tmp = new StringBuilder(data.substring(0, 2));
		for (int index = 2; index < data.length(); index++) {
			tmp.append("*");
		}
		return tmp.toString();
	}
	
	public static String convertSecureString(String data, int length) {
		StringBuilder tmp = new StringBuilder(data.substring(0, length));
		for (int index = length; index < data.length(); index++) {
			tmp.append("*");
		}
		return tmp.toString();
	}

	public static String convertSecureString(String data, int beginIndex, int length) {
		StringBuilder tmp = new StringBuilder(data.substring(0, beginIndex));
		StringBuilder tmp2 = new StringBuilder(data.substring(beginIndex + length));
		
		//System.out.println("tmp: " + tmp);
		//System.out.println("tmp2: " + tmp2);
		
		for (int index = beginIndex-1; index < length; index++) {
			tmp.append("*");
		}
		tmp.append(tmp2);
		return tmp.toString();
	}
	
	public static String convertSecureReverseString(String data, int length) {
		int beginIndex = data.length() - length;
		StringBuilder tmp2 = new StringBuilder(data.substring(beginIndex));
		StringBuilder tmp = new StringBuilder();
		for (int index = 0; index < beginIndex; index++) {
			tmp.append("*");
		}
		tmp.append(tmp2);
		return tmp.toString();
	}
	
	/*
	2. 암호 분실시 임시암호 등 임의의 보안문자열 반환 메서드
	-- 임시 보안문자열 길이는 기본은 4자리
	-- 아규먼트로 길이 입력한 길이만큼
	-- 메서드 중복 정의

	메서드명 : getSecureString
	아규먼트 : int
	반환타입 : String

	참고 : 
	String, StringBuffer, StringBuilder, 
	Math#random(), java.util.Random, java.lang.System.currentTimeMillis()
	*/
	public static String getSecureString(int length) {
		Random random = new Random((long)(System.nanoTime() + Math.random()));
		StringBuilder tmp = new StringBuilder();
		for (int index = 0; index < length; index++) {
			tmp.append(random.nextInt(10));
		}
		return tmp.toString();
	}
	
	public static String getSecureString() {
		return getSecureString(4);
	}

	/*
	3. 현재 날짜를 기본형식의 문자열로 반환하는 메서드
	-- 기본형식 : 년도4자리/월2자리/일2자리
	-- 날짜의 형식을 아규먼트로 전달받아 해당형식의 문자열 반환
	-- 중복정의

	메서드명 : getCurrentDay
	아규먼트 : String
	반환타입 : String

	참고 : 
	String, StringBuffer, StringBuilder, 
	java.util.Date, java.text.SimpleDateFormat
	*/
	public static String getCurrentDay(Date date, String pattern) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
		return dateFormat.format(date);
	}
	
	public static String getCurrentDay(String pattern) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
		return dateFormat.format(new Date());
	}
	
	public static String getCurrentDay() {
		return getCurrentDay("yyyy/MM/dd");
	}

	public static String getCurrentDay(String pattern, Locale locale) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(pattern, locale);
		return dateFormat.format(new Date());
	}
	
	public static String plusMin(int min,Date date){
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyyMMddHHmmss"); 
		 Calendar cal = Calendar.getInstance();
		 cal.setTime(date);
		 cal.add(Calendar.MINUTE, min);
		 String result = sdformat.format(cal.getTime());
		 return result;
	}
	
	public static String currentDate(Date date){
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyyMMddHHmmss");
		String result = sdformat.format(date);
		
		return result;
	}
	
	/**
	 * 테스트 시작 메서드
	 * @param args
	 */
	public static void main(String[] args) {
		String[] datas = {"bluesky", "happyday98", "admin1004"};
		String secureData = null;
		for (String data : datas) {
			secureData = convertSecureString(data);
			System.out.println(data + " : " + secureData);
		}
		System.out.println();
		
		int length = 2;
		for (String data : datas) {
			secureData = convertSecureString(data, length);
			System.out.println(data + " : " + secureData);
			length += 2;
		}
		System.out.println();
		
		for (String data : datas) {
			secureData = convertSecureString(data, 1, 3);
			System.out.println(data + " : " + secureData);
		}
		System.out.println();
		
		String[] mobiles = {"010-1234-1111", "010-1111-1112", "016-123-1113", "017-111-1114"};
		for (String data : mobiles) {
			secureData = convertSecureReverseString(data, 4);
			System.out.println(data + " : " + secureData);
		}
		System.out.println();
		
		for (int index = 4; index <= 8; index++) {
			System.out.println(getSecureString(index));
		}
		System.out.println();
		
		String[] dateFormat = {"yyyy.MM.dd", "yy-MM-dd", "hh.mm [a]"};
		System.out.println(getCurrentDay());
		for (String data : dateFormat) {
			System.out.println(getCurrentDay(data));
		}
		
		System.out.println(getCurrentDay("hh:mm:ss [a], EEEE", Locale.US));
		System.out.println(getCurrentDay("hh:mm:ss [a], EEE", Locale.US));
	}
}
