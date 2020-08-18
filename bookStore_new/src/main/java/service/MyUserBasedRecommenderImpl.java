package service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.mahout.cf.taste.eval.RecommenderBuilder;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.CachingRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.UncenteredCosineSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.ScoreBook;

import java.io.File;
import java.util.*;

@Service
public class MyUserBasedRecommenderImpl implements MyUserBasedRecommender1 {
	@Autowired
	ScoreService scoreService;
	public List<RecommendedItem> userBasedRecommender(long userID,int size) {
		// step:1 构建模型 2 计算相似度 3 查找k紧邻 4 构造推荐引擎
		List<RecommendedItem> recommendations = null;
		try {

				/*	Class.forName("com.mysql.jdbc.Driver");
			MysqlDataSource dataSource = new MysqlDataSource();
			dataSource.setServerName("localhost");//本地为localhost
			dataSource.setUser("root");
			dataSource.setPassword("root");
			dataSource.setDatabaseName("bookstorm");//数据库名
			DataModel dataModel=new MySQLJDBCDataModel(dataSource,"score_book","user_id","book_id","score","time");

*/         File  modelFile = new File("C:\\Users\\lenovo\\Desktop\\my love\\bookStore_new\\ratings1.csv");
			//System.out.println(modelFile);
			DataModel model = new FileDataModel(modelFile);//构造数据模型

			//UserSimilarity similarity1=new UncenteredCosineSimilarity(model);
			UserSimilarity similarity = new PearsonCorrelationSimilarity(model);//用PearsonCorrelation 算法计算用户相似度
			UserNeighborhood neighborhood = new NearestNUserNeighborhood(3, similarity, model);//计算用户的“邻居”，这里将与该用户最近距离为 3 的用户设置为该用户的“邻居”。
			Recommender recommender = new CachingRecommender(new GenericUserBasedRecommender(model, neighborhood, similarity));//采用 CachingRecommender 为 RecommendationItem 进行缓存
			recommendations = recommender.recommend(userID, size);//得到推荐的结果，size是推荐结果的数目
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return recommendations;
	}



	public List<Integer> buyByUser(Integer userID,Integer bookId) {
		List<Integer> bookIdBypass=new ArrayList<>();
		try {
			List<ScoreBook> scoreBookList=scoreService.listByBook(bookId);
				System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&购买过该商品的用户个数"+scoreBookList.size());
			int cout=0;
			//for(Map.Entry<Integer,Double> mapping:list){//挑选出最相似的五个用户
			for(ScoreBook scoreBook:scoreBookList){//挑选出最相似的五个用户
				/*cout++;
				if(cout>=5){
					break;
				}*/

				List<ScoreBook> scoreBookListByUser=scoreService.listByUser(scoreBook.getUserId());
				System.out.println("&&&&&&&&&&根据挑选出的用户在挑选书籍"+scoreBook.getUserId()+" "+scoreBookListByUser.size());
				int cout1=0;
					for (ScoreBook scoreBook1: scoreBookListByUser) {//挑选出每个用户买过的五本评分最高的书
						/*cout1++;
						if (cout1 >= 5) {
							break;
						}*/
						if(scoreBook1.getBookId()==bookId){
							continue;
						}

							bookIdBypass.add(scoreBook1.getBookId());

					}
				}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println("&&&&&&&&&&输出bookidpass集合………………………………………………………………………………");
		for(Integer o:bookIdBypass){
			System.out.println(o+"  ");

		}
		HashSet set = new HashSet(bookIdBypass);
       // 清空list集合
		bookIdBypass.clear();
// 将去重后的元素重新添加到list中
		bookIdBypass.addAll(set);
		System.out.println("&&&&&&&&&&最终书籍数量"+bookIdBypass.size());
		return bookIdBypass;
	}


}