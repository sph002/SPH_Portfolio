package goal.dto;

public class Spec {

    // id will be used for primary key in MongoDB
    // We could use ObjectId, but I am keeping it
    // independent of MongoDB API classes
    
    private String company_name;
    private String field;
    private String univ_name;
    private String major;
    private float grade;
    private int toeic;
    private String opic;
    private String tos;
    private int license;
    private int intern;
    private int abs_train;
    private int vol;
    public Spec(){
    	
    	}
    public Spec(String company_name, String field,
            String univ_name, String major, float grade, int toeic,
            String opic, String tos, int license, int intern,
            int abs_train, int vol) {
        super();
       
        this.company_name = company_name;
        this.field = field;
        this.univ_name = univ_name;
        this.major = major;
        this.grade = grade;
        this.toeic = toeic;
        this.opic = opic;
        this.tos = tos;
        this.license = license;
        this.intern = intern;
        this.abs_train = abs_train;
        this.vol = vol;
    }

  

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getUniv_name() {
        return univ_name;
    }

    public void setUniv_name(String univ_name) {
        this.univ_name = univ_name;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public float getGrade() {
        return grade;
    }

    public void setGrade(float grade) {
        this.grade = grade;
    }

    public int getToeic() {
        return toeic;
    }

    public void setToeic(int toeic) {
        this.toeic = toeic;
    }

    public String getOpic() {
        return opic;
    }

    public void setOpic(String opic) {
        this.opic = opic;
    }

    public String getTos() {
        return tos;
    }

    public void setTos(String tos) {
        this.tos = tos;
    }

    public int getLicense() {
        return license;
    }

    public void setLicense(int license) {
        this.license = license;
    }

    public int getIntern() {
        return intern;
    }

    public void setIntern(int intern) {
        this.intern = intern;
    }

    public int getAbs_train() {
        return abs_train;
    }

    public void setAbs_train(int abs_train) {
        this.abs_train = abs_train;
    }

    public int getVol() {
        return vol;
    }

    public void setVol(int vol) {
        this.vol = vol;
    }
	@Override
	public String toString() {
		return company_name + ", " + field + ", " + univ_name
				+ ", " + major + ", " + grade + ", " + toeic + ", " + opic
				+ ", " + tos + ", " + license + ", " + intern + ", "
				+ abs_train + ", " + vol + "]";
	}
    
    

}