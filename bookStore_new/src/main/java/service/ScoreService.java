package service;

import pojo.BookNew;
import pojo.ScoreBook;

import java.io.IOException;
import java.util.List;

public interface ScoreService {

    long getPeopleByScore(int score);
    long[] getNum();
    Integer addScore(Integer userId,Integer nookId,Integer score);
    long[] getNumByBook(Integer book_id);
    int getNumByBookId(Integer book_id);
    List<ScoreBook> listByBook(Integer bookid);
    List<ScoreBook> listByUser(Integer user_id);
   /* long[] getNumByCatory(Integer catory_id);*/
   /*List<BookNew> getListBookByPrice(String categoryName);
   List<BookNew> getListBookByScore(String categoryName);
   List<BookNew> getListBookByPage(String categoryName);
   List<BookNew> getListBookByComment(String categoryName);
   List<BookNew> getListBookByDate(String categoryName);
   List<BookNew> getListBookBysaleNum(String categoryName);*/
   List<BookNew> getListBook(String categoryName,int i,int limitNum);
   Integer getListBook(String categoryName);
   void ddui(Integer userId,Integer bookId,Integer score) throws IOException;


}
