package reanswer.data.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReanswerDao implements ReanswerInter {
	
	@Autowired
	private SqlSession session;

	@Override
	public void insertReanswer(ReanswerDto dto) {
		// TODO Auto-generated method stub
		
		session.insert("insertOfAnswer", dto);
	}
	
	//��ȸ ...contentcontroller���� �߰��������!
	@Override
	public List<ReanswerDto> getAnswerList(int num) {
		// TODO Auto-generated method stub
		return session.selectList("getNumDatasOfReanswer", num);
	}

	@Override
	public int getCheckPassAnswer(int idx, String pass) {
		// TODO Auto-generated method stub
		 HashMap<String, Object> map=new HashMap<String, Object>(); //String�� int �� �� �־ object�� �ޱ�
		 map.put("idx", idx);
		 map.put("pass", pass);
		 
		 return session.selectOne("checkDeleteAnswerPass", map);
		 
	}

	@Override
	public void deleteAnswer(int idx) {
		// TODO Auto-generated method stub
		
		session.delete("deleteAnswer", idx);
		
	}
	
	

}
