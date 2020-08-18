package service;

import mapper.BookNewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.BookNew;
import pojo.BookNewExample;
import pojo.Category;
import pojo.CategoryClass;

import java.util.ArrayList;
import java.util.List;

@Service
public class BookNewServiceImpl implements BookNewService{

    @Autowired
    BookNewMapper bookNewMapper;
    @Autowired
    CategoryClassService categoryClassService;
    @Autowired
   CategoryService categoryService;
    @Autowired
    CommentService commentService;
    @Autowired
    ScoreService scoreService;
    @Override
    public int add(BookNew bookNew) {
        return bookNewMapper.insertSelective(bookNew);

    }

       @Override
    public void setCommentCount(BookNew booknew) {
        int num=booknew.getNumberOfPeople();
        booknew.setNumberOfPeople(num+1);
        /*int commentCount = commentService.getCount(booknew.getId());
        booknew.setNumberOfPeople(commentCount);*/
    }

    @Override
    public int delete(Integer id) {
        return bookNewMapper.deleteByPrimaryKey(id);

    }

    @Override
    public void update(BookNew bookNew) {
        bookNewMapper.updateByPrimaryKey(bookNew);

    }

    @Override
    public BookNew get(Integer id) {
        return bookNewMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<BookNew> list(Integer category_id) {
        CategoryClass c=categoryClassService.get(category_id);
        BookNewExample booknewExample=new BookNewExample();
        String s="%"+c.getCategoryClassname()+"%";
        booknewExample.or().andLabelLike(s);
        List<BookNew> books=bookNewMapper.selectByExample(booknewExample);

        return books;
    }

    /*@Override*/
   /* public void setCommentCount(BookNew bookNew) {
        int commentCount = commentService.getCount(bookNew.getId());
        bookNew.setCommentCout(commentCount);

    }*/

    @Override
    public void fill(List<Category> categories) {
        for (Category category : categories) {
            fill(category);
        }

    }

    @Override
    public void fill(Category category) {
        List<BookNew> books = list(category.getId());
        category.setBookNews(books);

    }

    @Override
    public void fillByRow(List<Category> categories) {

        int BookNumberOfEachRow = 8;
        for (Category category : categories) {
            List<BookNew> products = category.getBookNews();
            List<List<BookNew>> productByRow = new ArrayList<>();
            for (int i = 0; i < products.size(); i += BookNumberOfEachRow) {
                int size = i + BookNumberOfEachRow;
                size = size > products.size() ? products.size() : size;
                List<BookNew> productsOfEachRow = products.subList(i, size);
                productByRow.add(productsOfEachRow);
            }
            category.setBookNewByRow(productByRow);
        }

    }

    @Override
    public List<BookNew> search(String keyword,int offset) {
        BookNewExample example = new  BookNewExample();

        example.or().andBooknameLike("%" + keyword + "%");
        example.or().andIsbnLike("%" + keyword + "%");
        example.or().andAuthorLike("%" + keyword + "%");
        example.or().andLabelLike("%" + keyword + "%");
        example.or().andAuthorIntroductionLike("%" + keyword + "%");
        example.or().andBookinfoLike("%" + keyword + "%");
        example.setLimit(20);
        example.setOffset(offset);
        example.setOrderByClause("id desc");
        return bookNewMapper.selectByExample(example);
    }
    @Override
    public List<BookNew> search(String keyword) {
        BookNewExample example = new  BookNewExample();

        example.or().andBooknameLike("%" + keyword + "%");
        example.or().andIsbnLike("%" + keyword + "%");
        example.or().andAuthorLike("%" + keyword + "%");
        example.or().andLabelLike("%" + keyword + "%");
        example.or().andAuthorIntroductionLike("%" + keyword + "%");
        example.or().andBookinfoLike("%" + keyword + "%");
        example.setOrderByClause("id desc");
        return bookNewMapper.selectByExample(example);
    }

    @Override
    public List<BookNew> listBookNew() {
        BookNewExample bookNewExample=new BookNewExample();
        bookNewExample.setOrderByClause("date DESC");
        List<BookNew> list=bookNewMapper.selectByExample(bookNewExample);
        System.out.println(list.size()+list.get(0).getBookname()+"book03333333333得到的李斯特333333333333333");
        List<BookNew> bookNewList=new ArrayList<>();
        int i=0;

        for(BookNew bookNew:list){
            if(i>9){
                break;
            }
            int id=bookNew.getId();
            System.out.println("GGGGGGGGGGGGGGGGGGGGGGGGGGGGGg来到了新书推荐——————————"+id+":"+scoreService.getNumByBookId(id));
            if(scoreService.getNumByBookId(id)==1) {
                bookNewList.add(bookNew);
                i++;
            }

        }
        System.out.println(bookNewList.size()+ bookNewList.get(0).getBookname()+"book03333333333得到的李斯特33322222222222222222222222222222");
        return bookNewList;
    }

    @Override
    public  List<BookNew> listBookNewSale(){
        BookNewExample bookNewExample=new BookNewExample();
        bookNewExample.setOrderByClause("number_of_people DESC");
        List<BookNew> list=bookNewMapper.selectByExample(bookNewExample);
        List<BookNew> bookNewList=new ArrayList<>();
        int i=0;
        for(int j=0;j<list.size();j++){
            if(i>9){
                break;
            }
            int id=list.get(j).getId();
            if(scoreService.getNumByBookId(id)==1) {
                bookNewList.add(list.get(j));
                i++;
            }

        }
        return bookNewList;
    }
    @Override
    public List<BookNew> list1(Integer category_id) {
        Category c1=categoryService.get(category_id);
        BookNewExample booknewExample=new BookNewExample();
        String s="%"+c1.getName()+"%";
        booknewExample.or().andLabelLike(s);
        List<BookNew> books=bookNewMapper.selectByExample(booknewExample);

        return books;
    }
    @Override
    public List<BookNew> listBookNew(String s){
        BookNewExample booknewExample=new BookNewExample();
        String s1="%"+s+"%";
        booknewExample.or().andLabelLike(s1);
        List<BookNew> books=bookNewMapper.selectByExample(booknewExample);
        return books;
    }
    @Override
    public List<BookNew> listBookNewAll(){
        BookNewExample booknewExample=new BookNewExample();
        return bookNewMapper.selectByExample(booknewExample);
    }
}
