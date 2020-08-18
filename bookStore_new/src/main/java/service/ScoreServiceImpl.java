package service;

import mapper.BookNewMapper;
import mapper.ScoreBookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.*;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class ScoreServiceImpl implements  ScoreService{
    @Autowired
    ScoreBookMapper scoreBookMapper;

    @Autowired
    BookNewMapper bookNewMapper;


    /*根据分数获得该分数打分人数正对所有图书*/
    @Override
    public long getPeopleByScore(int score) {
        ScoreBookExample scoreBookExample=new ScoreBookExample();
        scoreBookExample.or().andScoreEqualTo(score);
        long cout=scoreBookMapper.countByExample(scoreBookExample);
        return cout;

    }
/*获得打分数组针对所有图书*/
    @Override
    public long[] getNum() {
        ScoreBookExample scoreBookExample=new ScoreBookExample();
        long couts[]=new long[5];
        for(int i=1;i<6;i++){
            scoreBookExample.or().andScoreEqualTo(i);
            long cout=scoreBookMapper.countByExample(scoreBookExample);
            couts[i-1]=cout;
        }
        return couts;



    }


    /*根据图书id，获取该图书打分情况*/
    @Override
    public long[] getNumByBook(Integer book_id) {
        ScoreBookExample scoreBookExample=new ScoreBookExample();
        long couts[]=new long[5];
        for(int i=1;i<6;i++){
            scoreBookExample.or().andBookIdEqualTo(book_id).andScoreEqualTo(i);
            long cout=scoreBookMapper.countByExample(scoreBookExample);
            couts[i-1]=cout;
        }
        return couts;
    }


    @Override
   public  Integer getListBook(String categoryName){
        BookNewExample bookNewExample=new BookNewExample();
        String s="%"+categoryName+"%";
        bookNewExample.or().andLabelLike(s);
        List<BookNew> bookNewList=bookNewMapper.selectByExample(bookNewExample);
        List<BookNew> bookNewList1=new ArrayList<>();
        for(BookNew bookNew:bookNewList){
            int i1= getNumByBookId(bookNew.getId());
            if(i1==1){
                bookNewList1.add(bookNew);
            }
        }

        return bookNewList.size();
    }

    @Override
    /*按照价格升序*/
    public List<BookNew> getListBook(String categoryName,int i,int limitNum) {
        BookNewExample bookNewExample=new BookNewExample();
        String s="%"+categoryName+"%";
        bookNewExample.or().andLabelLike(s);
        bookNewExample.setLimit(20);
        bookNewExample.setOffset(limitNum);
        if(i==1){
            bookNewExample.setOrderByClause("price ASC");
        }
        else if(i==2){
            bookNewExample.setOrderByClause("score DESC");
        }
        else if(i==3){
            bookNewExample.setOrderByClause("pages ASC");
        }
        else if(i==4){
            bookNewExample.setOrderByClause("number_of_people DESC");
        }
        else if(i==5){
            bookNewExample.setOrderByClause("date DESC");
        }
        else if(i==6){
            bookNewExample.setOrderByClause("saleNumber DESC");

        }

        List<BookNew> bookNewList=bookNewMapper.selectByExample(bookNewExample);
        List<BookNew> bookNewList1=new ArrayList<>();
        for(BookNew bookNew:bookNewList){
           int i1= getNumByBookId(bookNew.getId());
           if(i1==1){
               bookNewList1.add(bookNew);
           }
        }
        System.out.println(bookNewList1.size());

        return bookNewList;
    }

    @Override
    public List<ScoreBook> listByBook(Integer bookid){
        System.out.println("番薯多喝水色斑的缴纳圣诞节啊8***************************************************");
        ScoreBookExample scoreBookExample=new ScoreBookExample();
        scoreBookExample.or().andBookIdEqualTo(bookid);
        scoreBookExample.setOrderByClause("score DESC");
        System.out.println("番薯多喝水色斑的缴纳圣诞节啊8***************************************************");

        return scoreBookMapper.selectByExample(scoreBookExample);


    }
    @Override
    public List<ScoreBook> listByUser(Integer user_id){
        ScoreBookExample scoreBookExample=new ScoreBookExample();
        scoreBookExample.or().andBookIdEqualTo(user_id);
        scoreBookExample.setOrderByClause("score DESC");
        return scoreBookMapper.selectByExample(scoreBookExample);


    }
    @Override
    public int getNumByBookId(Integer book_id){
        ScoreBookExample scoreBookExample=new ScoreBookExample();
        scoreBookExample.or().andBookIdEqualTo(book_id);
        List<ScoreBook> scoreBookList=scoreBookMapper.selectByExample(scoreBookExample);
        System.out.println("GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG我是scoreBook----------------------"+scoreBookList.size());
        if(scoreBookList==null||scoreBookList.size()==0){
            return 0;
        }
        else
            return 1;
    }
    public  Integer addScore(Integer userId,Integer nookId,Integer score){
        ScoreBook scoreBook=new ScoreBook();
        scoreBook.setBookId(nookId);
        scoreBook.setUserId(userId);
        scoreBook.setScore(score);
        System.out.println("添加评分向数据库"+scoreBook.getScore()+"--"+scoreBook.getBookId()+"--"+scoreBook.getUserId());
        int i=scoreBookMapper.insertSelective(scoreBook);
        return i;
    }
    @Override
    public void ddui(Integer userId,Integer bookId,Integer score) throws IOException {
        File csv = new File("C:\\Users\\lenovo\\Desktop\\my love\\bookStore_new\\ratings1.csv"); // CSV数据文件
        System.out.println("CSV文件是否存在"+csv.exists()+"------"+csv.getName()+"------"+csv.getPath());

        BufferedWriter bw = new BufferedWriter(new FileWriter(csv,true)); // 附加
        // 添加新的数据行
        bw.write(userId + "," + bookId+ "," + score);
        bw.newLine();
        bw.close();
    }
}
