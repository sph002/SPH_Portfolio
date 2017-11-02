package goal.service;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class specMajor {
	public REXP x = null;
	public RConnection r = null;
	public String retStr = "";

	public specMajor() {
		try {
			r = new RConnection();
			r.eval("source('/home/eduuser/R_script/exer7.R')");
		} catch (RserveException e) {
			e.printStackTrace();
		}
	}

	public Double getPercent(String company_name,int order) {
		double avg = 0;
		try {
			avg = 	r.eval("getPercent('" + company_name + "',"+order+")").asDouble();
			avg = Double.parseDouble(String.format("%.2f", avg));
		} catch (RserveException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (REXPMismatchException e) {
			e.printStackTrace();
		}
		return avg;
	}
	public String getMajor(String company_name,int order) {
		String avg =null;
		try {
			avg = 	r.eval("getMajor('"+ company_name +"',"+order+")").asString();
		} catch (RserveException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (REXPMismatchException e) {
			e.printStackTrace();
		}
		return avg;
	}
			
}
