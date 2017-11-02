package goal.dao;

import goal.dto.Spec;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import com.google.gson.Gson;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.WriteConcern;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;

public class MongoCon {
	MongoClient mongoClient = null;
	String dbName ;
	String collName ;
	DBCollection coll;
	static DB db;

	public MongoCon(String dbName ,	String collName ){
		this.dbName =dbName;
		this.collName = collName;
		try{
	        mongoClient = new MongoClient("localhost",27017);
	        System.out.println("접속 성공");
	        WriteConcern w = new WriteConcern(1,2000);//쓰게 락 갯수, 연결 시간 2000 //쓰레드 쓰게되면 2개 동시에 쓸 경우도 생기니까
	        mongoClient.setWriteConcern(w);
	        db = mongoClient.getDB(dbName);
	        coll = db.getCollection(collName);
		}catch(Exception e){
			System.out.println("error : 연결x");
		}
	}
	
	public void getAllSpec(){
		 DBCursor cursor = coll.find();
		 
		 while(cursor.hasNext()){
             //커서의 이름중에 _id인 컬럼 값만 출력
             System.out.println(cursor.next().get("company_name"));    
         }
	}
	public void isExist(String company_name){
		BasicDBObject searchQuery = new BasicDBObject();
		searchQuery.put("company_name",company_name);
		DBCursor cursor = coll.find(searchQuery);
		while(cursor.hasNext()){
			  DBObject obj =cursor.next();
			  String tmp = (String) obj.get("company_name");
			  System.out.println(tmp);
		}
	}
	public ArrayList<Spec> getSpec(String companyName){
		ArrayList<Spec> list = new ArrayList<Spec>();
		BasicDBObject searchQuery = new BasicDBObject();
	  searchQuery.put("company_name",companyName);
	  DBCursor cursor = coll.find(searchQuery);
	  while(cursor.hasNext()){
		  DBObject obj =cursor.next();
		  Spec spec =(new Gson()).fromJson(obj.toString(),Spec.class);
		  list.add(spec);
	  }
	  	System.out.println(list);
	  return list;
	}
	
	static void saveImageIntoMongoDB(){
	  try{
				String dbFileName = "wordcloud";
		   File imageFile = new File("/home/eduuser/R_script/image/현대자동차.png");
		   GridFS gfsPhoto = new GridFS(db, "photo");
		   GridFSInputFile gfsFile = gfsPhoto.createFile(imageFile);
		   gfsFile.setFilename(dbFileName);
		   gfsFile.save();
		   System.out.println("이미지저장성공");
	   }catch (IOException e) {
		   System.out.println("error : 몽고이미지연결 error");
	   }
	}
	static void getSingleImageExample() {
	   
	    try {
			
			 String newFileName = "wordcloud";
			 GridFS gfsPhoto = new GridFS(db, "photo");
			 GridFSDBFile imageForOutput = gfsPhoto.findOne(newFileName);
			 imageForOutput.writeTo("/home/eduuser/exer.png");
			 System.out.println(imageForOutput +"성공");
	   } catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("error사진저장");
		}
	    
	}
	
	
	
    
}
