package podo.podospring.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import podo.podospring.dao.Member;

@Mapper
public interface UserMapper {

    List<Member> findAll();


}
