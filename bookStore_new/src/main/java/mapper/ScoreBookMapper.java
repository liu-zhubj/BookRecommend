package mapper;

import org.apache.ibatis.annotations.Param;
import pojo.ScoreBook;
import pojo.ScoreBookExample;

import java.util.List;

public interface ScoreBookMapper {
    long countByExample(ScoreBookExample example);

    int deleteByExample(ScoreBookExample example);

    int insert(ScoreBook record);

    int insertSelective(ScoreBook record);

    List<ScoreBook> selectByExample(ScoreBookExample example);

    int updateByExampleSelective(@Param("record") ScoreBook record, @Param("example") ScoreBookExample example);

    int updateByExample(@Param("record") ScoreBook record, @Param("example") ScoreBookExample example);
}