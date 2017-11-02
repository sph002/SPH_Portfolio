package goal.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class ServiceR {
	public REXP x = null;
	public RConnection r = null;
	public String retStr = "";

	public ServiceR() {
		try {
			r = new RConnection();
		} catch (RserveException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			r.parseAndEval("source('/home/eduuser/R_script/R_source.R')");
			
		} catch (REngineException | REXPMismatchException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// fieldList 함수
	public String[] getList(String category) {
		String result_list[] = new String[1500];
		try {
			x = r.parseAndEval("getList('" + category + "')");
			result_list = x.asStrings();
		} catch (REngineException | REXPMismatchException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result_list;
	}

	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	// Rserve_C 함수
	public byte[] returnRImg(String company_name, String category)
			throws REngineException, REXPMismatchException {

		r.parseAndEval("data<-subset(df, df$company_name=='" + company_name
				+ "')");

		if (category.equals("grade")) {
			r.parseAndEval("wordcount <- table(data$grade)");
		} else if (category.equals("toeic")) {
			r.parseAndEval("wordcount <- table(data$toeic)");
		} else if (category.equals("opic")) {
			r.parseAndEval("wordcount <- table(data$opic)");
		} else if (category.equals("tos")) {
			r.parseAndEval("wordcount <- table(data$tos)");
		}
		x = r.parseAndEval("try('jpeg'('test.jpg',quality=90))");
		if (category.equals("grade")) {
			r.parseAndEval("bp <- barplot(wordcount, main='학점 점수 분포', col=rainbow(10), ylab='명 수')");
		} else if (category.equals("toeic")) {
			r.parseAndEval("bp <- barplot(wordcount, main='토익 점수 분포', col=rainbow(10), ylab='명 수')");
		} else if (category.equals("opic")) {
			r.parseAndEval("bp <- barplot(wordcount, main='오픽 점수 분포', col=rainbow(10), ylab='명 수')");
		} else if (category.equals("tos")) {
			r.parseAndEval("bp <- barplot(wordcount, main='토스 점수 분포', col=rainbow(10), ylab='명 수')");
		}
		r.parseAndEval("text(x=bp, y=wordcount*0.95, labels=paste(wordcount,'명'),col='black', cex=0.7)");
		r.parseAndEval("graphics.off()");
		x = r.parseAndEval("r=readBin('test.jpg','raw',1024*1024);unlink('test.jpg');r");
		return x.asBytes();// img;
	}

	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	// specMajor 함수

	public Double getPercent(String company_name, int order) {
		double avg = 0;
		try {
			avg = r.eval("getPercent('" + company_name + "'," + order + ")")
					.asDouble();
			avg = Double.parseDouble(String.format("%.2f", avg));
		} catch (RserveException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (REXPMismatchException e) {
			e.printStackTrace();
		}
		return avg;
	}

	public String getMajor(String company_name, int order) {
		String avg = null;
		try {
			avg = r.eval("getMajor('" + company_name + "'," + order + ")")
					.asString();
		} catch (RserveException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (REXPMismatchException e) {
			e.printStackTrace();
		}
		return avg;
	}

	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	// specService 함수

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

	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	// specWordCloud 함수

	public byte[] returnRImg3(String company_name) throws REngineException,
			REXPMismatchException {
		r.parseAndEval("data<-subset(dataframe, dataframe$company_name=='"
				+ company_name + "')");
		// r.parseAndEval("data1<-data[,c(1,2)]");
		x = r.parseAndEval("try('jpeg'('test.jpg',quality=90))");
		// r.parseAndEval("wordcloud2(data1, minRotation = -pi/6, maxRotation = -pi/6 ,size=1.6, color='random-light',backgroundColor='white',minSize = 5, rotateRatio = 0.5)");
		// r.parseAndEval("df <- con$find( query = '{\""+company_name+"\":\"삼성전자\"}',fields ='{ \"Freq\" : true, \"word\" : true, \"_id\":false}')");
		// r.parseAndEval("dataframe <- as.data.frame(df)");

		// System.out.println(r.parseAndEval("print(dataframe)"));
		r.parseAndEval("a<-wordcloud(data$word,data$Freq,max.words = 100, min.freq = 5, random.order = FALSE, rot.per = 0.1, colors = brewer.pal(8, 'Dark2')) ");
		r.parseAndEval("graphics.off()");
		x = r.parseAndEval("r=readBin('test.jpg','raw',1024*1024);unlink('test.jpg');r");
		
		return x.asBytes();
	}
	
	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

		// getGradeGraph 함수
	
	public byte[] getGradeGraph(String company_name)
			throws REngineException, REXPMismatchException {
		
		r.parseAndEval("data<-subset(df, df$company_name=='" + company_name
				+ "')");
		r.parseAndEval("data$grade<-as.numeric(data$grade)");
		 x=r.parseAndEval("try('jpeg'('test.jpg',quality=90))");
		r.parseAndEval("test<-ggplot(data, aes(x = grade)) +");
		r.parseAndEval("geom_histogram(aes(y = ..count..), binwidth = 0.25,colour = 'black', fill = 'gray')+");
		r.parseAndEval("scale_x_continuous(name = '학점', breaks = seq(3, 4.5, 0.5),limits=c(3,4.5)) +");
		r.parseAndEval("scale_y_continuous(name = 'Count') +");
		r.parseAndEval("ggtitle('학점') +");
		r.parseAndEval(" theme(axis.line = element_line(size=1, colour = 'black'),");
		r.parseAndEval(" panel.grid.major = element_blank(),");
		r.parseAndEval(" panel.grid.minor = element_blank(),panel.border = element_blank(),panel.background = element_blank(),");
		r.parseAndEval("plot.title=element_text(size = 30, family='xkcd-Regular'),");
		r.parseAndEval("text=element_text(size = 30, family='xkcd-Regular'),");
		r.parseAndEval("axis.text.x=element_text(colour='black', size = 20),");
		r.parseAndEval("axis.text.y=element_text(colour='black', size = 20))");
		r.parseAndEval("ggsave(filename='test.jpg',device='jpeg')");
	
		
		
		r.parseAndEval("graphics.off()");
		x = r.parseAndEval("r=readBin('test.jpg','raw',1024*1024);unlink('test.jpg');r");
		return x.asBytes();	
		}

//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	//public  RList getReclist(String major, String univ_name,double grade,int toeic,String opic,int tos,
		//	int license,int abr_train, int vol,int intern) throws REngineException {
	public  String[][] getReclist(String major, String univ_name, double grade,int toeic,String opic,int tos,
				int license, int abr_train, int vol,int intern) throws REngineException {
		RList tmp = null;
		String[][] list = new String[4][13];
		//RList tmp = null;
		try {
			//r.parseAndEval("print(class("+toeic+"))");
			
			 r.parseAndEval("a<-recomSpec('"+major+"','"+univ_name+"',"+grade+","+toeic+", '"+opic+"', "+tos+" ,"+license+" , "+abr_train+" , "+vol+" ,"+intern+")");
			 
			 for(int row = 1; row < 4; row ++){
				 for(int col = 1 ; col<13; col++){
					 list[row][col] = r.parseAndEval("a["+row+",+"+col+"]").asString();
				 }
			 } 			 			 
			 //			int cols = tmp.size();
//			int rows = tmp.at(0).length();
//			String[][] s = new String[cols][];
//			//return tmp;
//			for(int i = 0; i < cols;i++){
//				s[i] = tmp.at(i).asStrings();
//				System.out.println(s[i]);
			 return list;

		} catch (RserveException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (REXPMismatchException e) {
			e.printStackTrace();
		}
		return null;
	}
//	@Overriding
//	public String toString(){
//		return
//		
//	}

//	public static void main(String[] args) throws REngineException{
//		ServiceR sr = new ServiceR();
//		String[][] list =sr.getReclist("산업공학과","부산대학교",3.5,820,"IM",6,2,1,1,1);
//		for(int row = 1; row < 4; row ++){
//			 for(int col = 1 ; col<13; col++){
//				 System.out.println(list[row][col]);
//			 }
//		 } 			 
//		
//	}
	
	

}
