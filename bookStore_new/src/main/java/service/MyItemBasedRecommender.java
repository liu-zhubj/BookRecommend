package service;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;

import java.io.IOException;
import java.util.List;

public interface MyItemBasedRecommender {
     List<RecommendedItem> myItemBasedRecommender(long userID, int size);
    long[] myItem(long ItemID)throws TasteException, IOException;
}
