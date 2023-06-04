package sawon.data;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;

public interface SawonDaoInter {
	
	public int getTotalCount();
	
	public int searchCount(Map<String, String> map);
	
	//insert
	public void insertSawon(SawonDto dto);
	
	//select (����Ʈ�̱�� �˻�(map))
	public List<SawonDto> getAllDatas(Map<String, String> map);
	
	//num ��ȸ
	public SawonDto getNum(String num);
	
	//update
	public void updateSawon(SawonDto dto);
	
	//delete
	@GetMapping("/sawon/delete")
	public String delete(SawonDto dto);
			

}
