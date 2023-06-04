package spring.db.car;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository //dao�� bean�� ���
public class MyCarDao {
	
	@Autowired //sql������ ��� dao���� �ڵ�����
	private SqlSession session;
	
	//�Ѱ���
	public int getTotalCount() {
		
		return session.selectOne("getTotalCountOfMyCar");
		//�ڵ����� ���� ���ǿ��� mycarMapper�� select�� id �������� 
	}
	
	//��ü������ ��ȸ
	public List<MyCarDto> getAllDatas(){
		
		return session.selectList("getAllDatasOfMyCar");
	}
	
	//insert
	public void insertMyCar(MyCarDto dto) {
		
		session.insert("insertOfMyCar", dto); //mycarMapper�� insert�� id�� �Ķ��Ÿ������ �Ѿ�� dto
	}
	
	//���� �� num
	public MyCarDto getData(String num) {
		
		return session.selectOne("getOneDataOfMyCar", num);
	}
	
	//����
	public void updateMyCar(MyCarDto dto) {
		
		session.update("updateOfMyCar", dto);
	}
	

	//����
	public void deleteMyCar(MyCarDto dto) {
		
		session.delete("deleteOfMyCar", dto);
	}

}
