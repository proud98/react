package spring.mvc.json;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JsonTestController {
	
	@GetMapping("/list1") //json �������� ���� �����ּ�...list1�̶�� �� �� ����� ������ ajax���� url�� Ȱ�� �� ��
	@ResponseBody //jsonó�� �� �������� ���... @Controller(�Ϲ�)�� �� �߰����ֱ�
	public Map<String, String> list1(){
		//Map���� key�� valu�� �� �ֱ� key�� ������ String�ϰ�.. value���� int�� string ��� �پ��ϰ� ���� object
		
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("name", "�϶�");
		map.put("hp", "010-2222-3333");
		map.put("addr", "����� ������");
		
		return map;
	}
}
