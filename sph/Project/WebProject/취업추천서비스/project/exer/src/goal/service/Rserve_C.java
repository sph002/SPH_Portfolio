package goal.service;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class Rserve_C {

    public REXP x = null;
    public RConnection r = null;
    public String retStr = "";

    public String returnRClass() throws RserveException, REXPMismatchException{

            r = new RConnection();
            r.eval("1+2");
            
        return retStr;
    }
    public Rserve_C(){
    	try {
			r = new RConnection();
		} catch (RserveException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	try {
			r.parseAndEval("source('/home/eduuser/R_script/img_library.R')");
		} catch (REngineException | REXPMismatchException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
 public byte[] returnRImg(String company_name, String category) throws REngineException, REXPMismatchException {
	 
	 r.parseAndEval("data<-subset(dataframe, dataframe$company_name=='"+company_name+"')");
	 
	 if (category.equals("grade")) {
		 r.parseAndEval("wordcount <- table(data$grade)");
	 } else if (category.equals("toeic")) {
		 r.parseAndEval("wordcount <- table(data$toeic)");
	 } else if (category.equals("opic")) {
		 r.parseAndEval("wordcount <- table(data$opic)");
	 } else if (category.equals("tos")) {
		 r.parseAndEval("wordcount <- table(data$tos)");
	 }
	 x=r.parseAndEval("try('jpeg'('test.jpg',quality=90))");
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
	 x=r.parseAndEval("r=readBin('test.jpg','raw',1024*1024);unlink('test.jpg');r");




/*        String device = "jpeg";
        x = r.parseAndEval("try("+device+"('test.jpg',quality=90))");
        //System.out.println(x);
        // ok, so the device should be fine - let's plot - replace this by any plotting code you desire ...

        r.parseAndEval("x <- mtcars$mpg ");
        r.parseAndEval("h<-hist(x, breaks=10, col=\"red\", xlab=\"Miles Per Gallon\", main=\"Histogram with Normal Curve\")");
        r.parseAndEval("xfit<-seq(min(x),max(x),length=40)");
        r.parseAndEval("yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))");
        r.parseAndEval("yfit <- yfit*diff(h$mids[1:2])*length(x)");
        r.parseAndEval("lines(xfit, yfit, col=\"blue\", lwd=2)");

        //graphics off
        r.parseAndEval("graphics.off()");

        // There is no I/O API in REngine because it's actually more efficient to use R for this
        // we limit the file size to 1MB which should be sufficient and we delete the file as well
        x = r.parseAndEval("r=readBin('test.jpg','raw',1024*1024); unlink('test.jpg'); r");
*/
        return x.asBytes();//img;
    }
 public void returnWordCloudImg(String company_name) throws REngineException, REXPMismatchException{
	 r.parseAndEval(".libPaths('/home/eduuser/R_script/lib')");
	 r.parseAndEval("library('mongolite')");
	 r.parseAndEval("library(KoNLP)");
	 r.parseAndEval("library(tm)");
	 r.parseAndEval("library(jsonlite)");
	 r.parseAndEval("library(data.table)");
	 r.parseAndEval("library(wordcloud2)");
	 r.parseAndEval("library(rvest)");
	 r.parseAndEval("library(RColorBrewer)");
	 r.parseAndEval("library(stringr)");
	 r.parseAndEval("library(webshot)");
	 r.parseAndEval("library(htmlwidgets)");
	 
	 
	 r.parseAndEval("setwd('/home/eduuser/R_script')");
	 r.parseAndEval("con <- mongolite::mongo(db='goalin',collection='selfIntro',url = 'mongodb://localhost',verbose = TRUE)");
	 r.parseAndEval("df <- con$find(query = '{}')");
	 r.parseAndEval("dataframe <- as.data.frame(df)");
	 r.parseAndEval("company_name_list <-unique(dataframe$company_name)");
	 r.parseAndEval("contents <- subset(dataframe,select='contents',subset=(company_name=='"+company_name+"'))");
	 r.parseAndEval("data2<-as.vector(contents[,1])");
	 r.parseAndEval("txt2<-sapply(data2,extractNoun, USE.NAMES=F)");
	 r.parseAndEval("txt3<-unlist(txt2)");
	 r.parseAndEval("txt3 <- Filter(function(x){nchar(x)>2},txt3)");
	 //r.parseAndEval("txt3 <- gsub('\\d','',txt3)");
	 r.parseAndEval("txt4 <- as.data.table(txt3)");
	 r.parseAndEval("wordcount <- table(txt4)");
	 r.parseAndEval("my_graph=wordcloud2(wordcount, minRotation = -pi/6, maxRotation = -pi/6 ,size=1.6, color='random-light',backgroundColor='black',minSize = 5, rotateRatio = 0.5)");
	 r.parseAndEval("saveWidget(my_graph,'tmp.html',selfcontained = F)");
	 r.parseAndEval("webshot('tmp.html','/home/eduuser/R_script/tmp3.png', delay =5, vwidth = 300, vheight=300)");
	 System.out.println("success");
	 
 }
}
