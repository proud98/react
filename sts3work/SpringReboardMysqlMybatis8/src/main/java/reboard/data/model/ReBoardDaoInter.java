package reboard.data.model;

import java.util.List;

public interface ReBoardDaoInter {
	
	public int getTotalCount();
	public int getMaxNum();
	public void updateRestep(int regroup, int restep);
	public void insertReboardDto(ReBoardDto dto);
	public List<ReBoardDto> getliList(int start,int perpage);
	
	//0410 �̾
	public void updateReadCount(int num); //��ȸ��
	public ReBoardDto getData(int num); //num�� �ش��ϴ� dto��ȸ
	public int getCheckPass(int num,int pass);
	public void deleteReboard(int num);
	public void updateReboard(ReBoardDto dto);
	
	//���� 
	//�׳� ����Ʈ ���
	public List<ReBoardDto> selectTestBoard();
}

