import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.eval.IRStatistics;
import org.apache.mahout.cf.taste.eval.RecommenderBuilder;
import org.apache.mahout.cf.taste.eval.RecommenderEvaluator;
import org.apache.mahout.cf.taste.eval.RecommenderIRStatsEvaluator;
import org.apache.mahout.cf.taste.impl.eval.AverageAbsoluteDifferenceRecommenderEvaluator;
import org.apache.mahout.cf.taste.impl.eval.GenericRecommenderIRStatsEvaluator;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.CachingRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.UncenteredCosineSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;

import java.io.File;
import java.io.IOException;


public class testItemrCF {
    public static void main(String[] args) throws IOException, TasteException {
       // 准备数据
        File file = new File("C:\\Users\\lenovo\\Desktop\\my love\\bookStore_new\\ratings1.csv");
        // 将数据加载到内存中
        DataModel dataModel = new FileDataModel(file);//构造数据模型
        // 推荐评估, 使用平均差值
        RecommenderEvaluator evaluator = new AverageAbsoluteDifferenceRecommenderEvaluator();
         RecommenderIRStatsEvaluator statsEvaluator = new GenericRecommenderIRStatsEvaluator();
        RecommenderBuilder builder = new RecommenderBuilder() {
            public Recommender buildRecommender(DataModel dataModel) throws TasteException {
                ItemSimilarity similarity = new UncenteredCosineSimilarity(dataModel);//计算内容相似度
                return  new GenericItemBasedRecommender(dataModel, similarity);//构造推荐引擎
            }
        };
        // 用 70% 的数据用作训练, 剩下的 30% 用来测试
        double score = evaluator.evaluate(builder, null, dataModel, 0.9, 1.0);

        // 最后得出的评估值越小, 说明推荐结果越好
        System.out.println("itemCF评估值:"+score);
        IRStatistics stats = statsEvaluator.evaluate(builder, null, dataModel, null, 4, GenericRecommenderIRStatsEvaluator.CHOOSE_THRESHOLD, 1.0);
        System.out.println("itemCF准确率："+stats.getPrecision());
        System.out.println("itemCF召回率："+stats.getRecall());

    }
        }

