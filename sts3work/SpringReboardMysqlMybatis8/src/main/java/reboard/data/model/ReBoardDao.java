package reboard.data.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReBoardDao implements ReBoardDaoInter {
	
	@Autowired
	private SqlSession session;

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		
		return session.selectOne("getTotalCountOfReboard");
	}

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return session.selectOne("MaxNumOfReboard");
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		// TODO Auto-generated method stub
		
		//int regroup, int restep �� int���� value���� integer�� �ѱ��
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("regroup", regroup);
		map.put("restep", restep);
		
		session.update("updateStepOfReboard",map);
	}

	@Override
	public void insertReboardDto(ReBoardDto dto) {
		// TODO Auto-generated method stub
		
		int num=dto.getNum(); //0:���� , 1���� ū ��:���
		int regroup=dto.getRegroup();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		
		//�����ϰ��
		if(num==0) {
			regroup=getMaxNum()+1; //num�� �ִ밪�� +1
			restep=0;
			relevel=0;
		}else {
			//����ϰ��
			//���� �׷��߿��� ���޹��� restep���� ū �۵��� ��� +1
			updateRestep(regroup, restep);
			//���޹��� step�� level�� +1
			restep++;
			relevel++;
		}
		
		//�ٲ� �����Ͱ����� �ٽ� dto�� ����ֱ�
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		//dto�� ���� �� insert
		session.insert("insertOfReboard", dto);
	}

	@Override
	public List<ReBoardDto> getliList(int start, int perpage) {
		// TODO Auto-generated method stub
		
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perpage", perpage);
		
		return session.selectList("getAllPagingOfReboard", map);
	}
	
	//��ȸ��
	@Override
	public void updateReadCount(int num) {
		// TODO Auto-generated method stub
		
		session.update("UpdateReadCountOfReboard", num);
		
	}
	
	//num�� �ش��ϴ� dto
	@Override
	public ReBoardDto getData(int num) {
		// TODO Auto-generated method stub
		return session.selectOne("getDataOfReboard", num);
	}

	@Override
	public int getCheckPass(int num, int pass) {
		// TODO Auto-generated method stub
		
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("num", num);
		map.put("pass", pass);
		
		return session.selectOne("checkEqualPassOfReboard", map);
	}

	@Override
	public void deleteReboard(int num) {
		// TODO Auto-generated method stub
		session.delete("deleteReborad", num);
	}

	@Override
	public void updateReboard(ReBoardDto dto) {
		// TODO Auto-generated method stub
		
		session.update("updateOfReboard", dto);
		
	}
	
	//�׳� ����Ʈ ���
	@Override
	public List<ReBoardDto> selectTestBoard() {
		// TODO Auto-generated method stub
		return session.selectList("listReboardTest");
	}




	
	
	

}
