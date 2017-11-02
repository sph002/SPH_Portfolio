package work.model.dto;

/** 회원 클래스 */
public class Member {
	
	/** 회원아이디 */
	private String memberId;
	
	/** 비밀번호 */
	private String memberPw;
	
	/** 회원이름 */
	private String memberName;
	
	/** 성별 */
	private String gender;
	
	/** 생년월일 */
	private String birthDate;
	
	/** 이메일 */
	private String email;
	
	/** 연락처 */
	private String mobile;
	
	/** 주소 */
	private String address;
	
	/** 가입일 */
	private String entryDate;
	
	/** 등급 */
	private String grade;
	
	/** 마일리지 */
	private int mileage;

	

	public Member() {
		super();
	}

	

	public Member(String memberId, String memberPw, String memberName) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
	}

	
	


	public Member(String memberId, String memberPw, String memberName, String email, String mobile) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.email = email;
		this.mobile = mobile;
	}



	public Member(String memberId, String memberPw, String memberName, String gender, String birthDate, String email,
			String mobile, String address, String entryDate, String grade, int mileage) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.gender = gender;
		this.birthDate = birthDate;
		this.email = email;
		this.mobile = mobile;
		this.address = address;
		this.entryDate = entryDate;
		this.grade = grade;
		this.mileage = mileage;
	}


	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}



	@Override
	public String toString() {
		return memberId + ", " + memberPw + ", " + memberName + ", " + gender + ", " + birthDate + ", " + email + ", "
				+ mobile + ", " + address + ", " + entryDate + ", " + grade + ", " + mileage;
	}

	
}
