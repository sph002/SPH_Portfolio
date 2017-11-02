package goal.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class specService {

	public REXP x = null;
	public RConnection r = null;
	public String retStr = "";

	public specService() {
		try {
			r = new RConnection();
			r.eval("source('/home/eduuser/R_script/exer6.R')");
		} catch (RserveException e) {
			e.printStackTrace();
		}
	}

	

	public double getInternAvg(String company_name) {
		double avg = 0;
		try {
			avg = r.eval("getInternAvg('" + company_name + "')").asDouble();
			avg = Double.parseDouble(String.format("%.2f", avg));

		} catch (RserveException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (REXPMismatchException e) {
			e.printStackTrace();
		}
		return avg;
	}

	public double getVolAvg(String company_name) {
		double avg = 0;
		try {
			avg = r.eval("getVolAvg('" + company_name + "')").asDouble();
			avg = Double.parseDouble(String.format("%.2f", avg));

		} catch (RserveException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (REXPMismatchException e) {
			e.printStackTrace();
		}
		return avg;
	}

	public double getLicenseAvg(String company_name) {
		double avg = 0;
		try {
			avg = r.eval("getLicenseAvg('" + company_name + "')").asDouble();
			avg = Double.parseDouble(String.format("%.2f", avg));

		} catch (RserveException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (REXPMismatchException e) {
			e.printStackTrace();
		}
		return avg;
	}

	public double getAbrTrainAvg(String company_name) {
		double avg = 0;
		try {
			avg = r.eval("getAbrTrainAvg('" + company_name + "')").asDouble();
			avg = Double.parseDouble(String.format("%.2f", avg));

		} catch (RserveException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (REXPMismatchException e) {
			e.printStackTrace();
		}
		return avg;
	}

	public static String execute(String command) {
		StringBuilder sb = new StringBuilder();
		String[] commands = new String[] { "/bin/sh", "-c", command };
		try {
			Process proc = new ProcessBuilder(commands).start();
			BufferedReader stdInput = new BufferedReader(new InputStreamReader(
					proc.getInputStream()));

			BufferedReader stdError = new BufferedReader(new InputStreamReader(
					proc.getErrorStream()));

			String s = null;
			while ((s = stdInput.readLine()) != null) {
				sb.append(s);
				sb.append("\n");
			}

			while ((s = stdError.readLine()) != null) {
				sb.append(s);
				sb.append("\n");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
}
