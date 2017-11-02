package goal.service;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class fieldList {
	public REXP x = null;
	public RConnection r = null;
	public String retStr = "";
	
	public fieldList() {
		try {
			r = new RConnection();
		} catch (RserveException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			r.parseAndEval("source('/home/eduuser/R_script/list_test.R')");
		} catch (REngineException | REXPMismatchException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String[] getList(String category) {
		String result_list[] = new String[1500];
		try {
			x = r.parseAndEval("getList('" + category + "')");
			result_list = x.asStrings();
		} catch (REngineException | REXPMismatchException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		for (int i=0; i<result_list.length; i++) {
//			System.out.println(result_list[i]);
//		}
		return result_list;
	}
}
