package service;
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import com.thoughtworks.xstream.mapper.Mapper;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.model.jdbc.MySQLJDBCDataModel;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.UncenteredCosineSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class MyItemBasedRecommenderImpl implements MyItemBasedRecommender{
	@Autowired
	ScoreService scoreService;

	public List<RecommendedItem> myItemBasedRecommender(long userID, int size){
		List<RecommendedItem> recommendations = null;
		try {
			File  modelFile = new File("C:\\Users\\lenovo\\Desktop\\my love\\bookStore_new\\ratings1.csv");
			//System.out.println(modelFile);
			/*Class.forName("com.mysql.jdbc.Driver");
			MysqlDataSource dataSource = new MysqlDataSource();
			dataSource.setServerName("localhost");//本地为localhost
			dataSource.setUser("root");
			dataSource.setPassword("root");
			dataSource.setDatabaseName("bookstorm");//数据库名
			DataModel dataModel=new MySQLJDBCDataModel(dataSource,"score_book","user_id","book_id",
					"score","time");*/
			DataModel model = new FileDataModel(modelFile);//构造数据模型
			ItemSimilarity similarity = new PearsonCorrelationSimilarity(model);//计算内容相似度
			//ItemSimilarity similarity = new UncenteredCosineSimilarity(model);//计算内容相似度
			Recommender recommender = new GenericItemBasedRecommender(model, similarity);//构造推荐引擎
			recommendations = recommender.recommend(userID, size);//得到推荐结果
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return recommendations;
	}

	public long[] myItem(long ItemID) throws TasteException, IOException {

		List<RecommendedItem> recommendations = null;
		File  modelFile = new File("C:\\Users\\lenovo\\Desktop\\my love\\bookStore_new\\ratings1.csv");
		//System.out.println(modelFile);
		DataModel model = new FileDataModel(modelFile);//构造数据模型
		/*try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		MysqlDataSource dataSource = new MysqlDataSource();
		dataSource.setServerName("localhost");//本地为localhost
		dataSource.setUser("root");
		dataSource.setPassword("root");
		dataSource.setDatabaseName("bookstorm");//数据库名
		DataModel dataModel=new MySQLJDBCDataModel(dataSource,"score_book","user_id",
				"book_id","score","time");*/
		ItemSimilarity similarity = new PearsonCorrelationSimilarity(model);//计算内容相似度
			long[] date=similarity.allSimilarItemIDs(ItemID);

				return date;
	}

	/*
	* public long[] myItem(long ItemID) throws TasteException, IOException {
		int i=scoreService.getNumByBookId((int) ItemID);
		List<RecommendedItem> recommendations = null;
		File modelFile = new File("D:\\ratings1.csv");
		//System.out.println(modelFile);
		DataModel model = new FileDataModel(modelFile);//构造数据模型
		ItemSimilarity similarity = new PearsonCorrelationSimilarity(model);//计算内容相似度

		if(i==1) {
			long[] date = similarity.allSimilarItemIDs(ItemID);
			return date;
		}
		else{
			long[] date = null;
			return date;
		}
	* */

}
