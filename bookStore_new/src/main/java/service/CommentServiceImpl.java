package service;

import mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Comment;
import pojo.CommentExample;
import pojo.User;

import java.util.List;
@Service
public class CommentServiceImpl implements CommentService
{

    @Autowired
    UserService userService;
    @Autowired
    CommentMapper commentMapper;


    @Override
    public List<Comment> listByBookId(Integer book_id) {
        CommentExample commentExample=new CommentExample();
        commentExample.or().andBookidEqualTo(book_id);
        commentExample.setOrderByClause("id desc");
        List<Comment> comments=commentMapper.selectByExample(commentExample);
        setUser(comments);
       /* List<Comment> reviews = commentMapper.selectByExample(commentexample);
        setUser(reviews);*/
        return comments;
    }

    public void setUser(List<Comment> comments) {
        for (Comment comment : comments) {
            setUser(comment);
        }
    }

    private void setUser(Comment comment) {
        int user_id = comment.getUserid();
        User user = userService.get(user_id);
        comment.setUser(user);
    }

    public int getCount(int book_id)
    {
        return listByBookId(book_id).size();
    }

    public int add(Comment comment)
    {
        return commentMapper.insertSelective(comment);
    }

}
