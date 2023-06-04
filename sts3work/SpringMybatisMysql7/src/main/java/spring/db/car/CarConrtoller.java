package spring.db.car;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CarConrtoller {
	
	@Autowired
	MyCarDao dao;
	
	@GetMapping("/")
	public String index() {
		
		return "index";
	}
	
	@GetMapping("/samsung/list") //carlist�� list��� �Լ�����
	public String list(Model model) {
		
		//��ü����
		int totalCount=dao.getTotalCount();
		
		//��ü���
		List<MyCarDto> list=dao.getAllDatas(); //�̰� �迭 list
		
		//request�� ����
		model.addAttribute("totalCount", totalCount); //��������
		model.addAttribute("list", list); //�迭 ����Ʈ����
		
		return "car/carlist";
	}
	
	@GetMapping("/samsung/writeform")
	public String write() {
		
		return "car/writeform"; //�۾��� ������ �̵�
	}
	
	//insert ó��
	@PostMapping("/samsung/write")
	public String insert(@ModelAttribute MyCarDto dto) {
		
		dao.insertMyCar(dto);
		return "redirect:list"; //insert ó�� �� ������� �̵�..samsung/list�� ����
		
	}
	
	//���������� ���� 
	@GetMapping("/samsung/updateform")
	public String updateform(@RequestParam String num,Model model) {
		
		//dto ��������
		MyCarDto dto=dao.getData(num);
		
		//����
		model.addAttribute("dto", dto);
		
		return "car/updateform";
	}
	
	//����action
	@PostMapping("/samsung/update")
	public String update(@ModelAttribute MyCarDto dto) {
		
		dao.updateMyCar(dto);
		return "redirect:list"; //insert ó�� �� ������� �̵�..samsung/list�� ����
		
	}
	
	
	//����
	@GetMapping("/samsung/delete")
	public String delete(@ModelAttribute MyCarDto dto) {
		
		dao.deleteMyCar(dto);
		return "redirect:list"; //insert ó�� �� ������� �̵�..samsung/list�� ����
		
	}
	
	
	
	

}
