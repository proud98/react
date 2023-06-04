package spring.db.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarMemberDao {
	
	@Autowired
	private SqlSession session;
	
	//�� ����
	public int getTotalCount() {
		
		return session.selectOne("totalCountMember");
	}
	
	//��ȸ
	public List<CarMemberDto> getAllDatas(){
		
		return session.selectList("selectOfMember");
	}
	
	//insert
	public void insertMember(CarMemberDto dto) {
		
		session.insert("insertOfMember",dto);
	}
	
	//num�� ���� �����Ͱ�
	public CarMemberDto getNum(String num) {
		
		return session.selectOne("getNumUpdate", num);
	}
	
	//����
	public void updateMember(CarMemberDto dto) {
		
		session.update("updateOfMember",dto);
	}
	
	//����
	public void deleteMember(CarMemberDto dto) {
		
		session.delete("deleteOfMyMember", dto);
	}

}
