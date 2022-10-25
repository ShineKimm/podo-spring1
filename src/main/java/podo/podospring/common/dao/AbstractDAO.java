package podo.podospring.common.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

public class AbstractDAO {

	@Inject
	private SqlSession sqlSession;
     
    public int insert(String queryId, Object params){
        return sqlSession.insert(queryId, params);
    }
     
    public int update(String queryId, Object params){
        return sqlSession.update(queryId, params);
    }
     
    public int delete(String queryId, Object params){
        return sqlSession.delete(queryId, params);
    }
     
    public Object selectOne(String queryId){
        return sqlSession.selectOne(queryId);
    }
     
    public Object selectOne(String queryId, Object params){
        return sqlSession.selectOne(queryId, params);
    }
     
    @SuppressWarnings("rawtypes")
    public List selectList(String queryId){
        return sqlSession.selectList(queryId);
    }
     
    @SuppressWarnings("rawtypes")
    public List selectList(String queryId, Object params){
        return sqlSession.selectList(queryId,params);
    }
    
    public int selectCnt(String queryId, Object params){
        return sqlSession.selectOne(queryId, params);
    }
    
    public int selectCnt(String queryId){
        return sqlSession.selectOne(queryId);
    }
}


