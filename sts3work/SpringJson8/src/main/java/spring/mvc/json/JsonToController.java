package spring.mvc.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController //json���� ��Ʈ�ѷ�..�Ϲ� �޼���� ��� ����
public class JsonToController {
	
	@GetMapping("/list2")
	public List<PhotoDto> list2(){
		
		List<PhotoDto> list=new ArrayList<PhotoDto>();
		
		//������ ���ÿ� list�� ���
		list.add(new PhotoDto("�ְ��", "�ְ��.jpg"));
		list.add(new PhotoDto("�ְ��2", "�ְ��2.jpg"));
		list.add(new PhotoDto("�ְ��3", "�ְ��3.jpg"));
		list.add(new PhotoDto("�ֺ���", "�����̱׸�.png"));
		list.add(new PhotoDto("�׸�׸�", "��������.jpg"));
		return list;
	}
	
}
