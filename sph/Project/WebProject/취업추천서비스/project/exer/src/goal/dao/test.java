package goal.dao;


import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;

import goal.service.Rserve_C;

import goal.service.fieldList;
public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		String testArray[] = new String[1500];
		Rserve_C k =new Rserve_C();
		
		try {
			System.out.println(k.returnRClass());
		} catch (REngineException | REXPMismatchException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
