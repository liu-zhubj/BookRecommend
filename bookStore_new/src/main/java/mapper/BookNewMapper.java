package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import pojo.BookNew;
import pojo.BookNewExample;

public interface BookNewMapper {
    long countByExample(BookNewExample example);

    int deleteByExample(BookNewExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(BookNew record);

    int insertSelective(BookNew record);

    List<BookNew> selectByExample(BookNewExample example);

    BookNew selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") BookNew record, @Param("example") BookNewExample example);

    int updateByExample(@Param("record") BookNew record, @Param("example") BookNewExample example);

    int updateByPrimaryKeySelective(BookNew record);

    int updateByPrimaryKey(BookNew record);
}