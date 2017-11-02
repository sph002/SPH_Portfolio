package goal.service;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class specWordCloud {
	public REXP x = null;
	public RConnection r = null;
	public String retStr = "";
	public specWordCloud(){
	 	try {
			r = new RConnection();
		} catch (RserveException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	try {
			r.parseAndEval("source('/home/eduuser/R_script/preWordCloud2.R')");
		
		} catch (REngineException | REXPMismatchException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error source");
		}
	}
	 public void returnRImg(String company_name) throws REngineException, REXPMismatchException {
		 
			try {
					r.parseAndEval("getWordCloud('"+company_name +"')");
			} catch (RserveException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 		 
	    }
	 public byte[] returnRImg2(String company_name) throws REngineException, REXPMismatchException {

			try {
				  x=r.parseAndEval("try('jpeg'('test.jpg',quality=90))");
					r.parseAndEval("a<-getWordCloud2('"+company_name +"')");
					r.parseAndEval("text(x=a)");
					r.parseAndEval("graphics.off()");
					x=r.parseAndEval("r=readBin('test.jpg','raw',1024*1024);unlink('test.jpg');r");
			} catch (RserveException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 		
	
	        return x.asBytes();//img;
	    }
	 public byte[] returnRImg3(String company_name) throws REngineException, REXPMismatchException {
		 		r.parseAndEval("data<-subset(dataframe, dataframe$company_name=='"+company_name+"')");
//		 		r.parseAndEval("data1<-data[,c(1,2)]");
		 		x=r.parseAndEval("try('jpeg'('test.jpg',quality=90))");
//		 		r.parseAndEval("wordcloud2(data1, minRotation = -pi/6, maxRotation = -pi/6 ,size=1.6, color='random-light',backgroundColor='white',minSize = 5, rotateRatio = 0.5)");
				//r.parseAndEval("df <- con$find( query = '{\""+company_name+"\":\"삼성전자\"}',fields ='{ \"Freq\" : true, \"word\" : true, \"_id\":false}')");
				//r.parseAndEval("dataframe <- as.data.frame(df)");
				
//				System.out.println(r.parseAndEval("print(dataframe)"));
				r.parseAndEval("a<-wordcloud(data$word,data$Freq,max.words = 100, min.freq = 5, random.order = FALSE, rot.per = 0.1, colors = brewer.pal(8, 'Dark2')) "); 
				r.parseAndEval("graphics.off()");
				x=r.parseAndEval("r=readBin('test.jpg','raw',1024*1024);unlink('test.jpg');r");
				System.out.println(x);
				return x.asBytes();
		} 		
		

		 
}
