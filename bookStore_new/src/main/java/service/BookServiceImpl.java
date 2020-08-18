package service;

import mapper.BookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Book;
import pojo.BookExample;
import pojo.Category;

import java.util.ArrayList;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    BookMapper bookMapper;

    @Autowired
   CommentService commentService;
    @Override
    public void add(Book book) {
        bookMapper.insertSelective(book);
    }

    @Override
    public void delete(Integer id) {
      bookMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Book book) {
        bookMapper.updateByPrimaryKey(book);
    }

    @Override
    public Book get(Integer id) {
       return  bookMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Book> list(Integer category_id) {
        BookExample bookExample=new BookExample();
        bookExample.or().andClassIdEqualTo(category_id);
        List<Book> books=bookMapper.selectByExample(bookExample);

        return books;
    }

    @Override
    public void fill(List<Category> categories) {
        for (Category category : categories) {
            fill(category);
        }
    }

    @Override
    public void fill(Category category) {
        List<Book> books = list(category.getId());
        category.setBooks(books);
    }

    @Override
    public void fillByRow(List<Category> categories) {
        int BookNumberOfEachRow = 8;
        for (Category category : categories) {
            List<Book> products = category.getBooks();
            List<List<Book>> productByRow = new ArrayList<>();
            for (int i = 0; i < products.size(); i += BookNumberOfEachRow) {
                int size = i + BookNumberOfEachRow;
                size = size > products.size() ? products.size() : size;
                List<Book> productsOfEachRow = products.subList(i, size);
                productByRow.add(productsOfEachRow);
            }
            category.setBookByRow(productByRow);
        }
    }

    @Override
    public void setCommentCount(Book book) {
        int commentCount = commentService.getCount(book.getId());
        book.setCommentCout(commentCount);
    }

    @Override
    public List<Book> search(String keyword) {
        BookExample example = new  BookExample();

        example.or().andBooknameLike("%" + keyword + "%");
        example.setOrderByClause("id desc");
        return bookMapper.selectByExample(example);
    }
}