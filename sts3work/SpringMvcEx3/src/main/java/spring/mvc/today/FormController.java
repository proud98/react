package spring.mvc.today;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.TestDto;

@Controller
public class FormController {
	
	@GetMapping("/data/myform")
	public String form() {
		
		return "form1";
	}
	
	@GetMapping("/data/read1")
	public ModelAndView read1(@RequestParam String name, @RequestParam int age, @RequestParam(value="msg",defaultValue = "�⺻���ѱ�") String msg) {
		//�׼�ó���� ���⼭ ���ָ� ��
		//@RequestParam ���� �� �����ö� ���(���� ����)
		
		ModelAndView mview=new ModelAndView();
		
		mview.addObject("name", name);
		mview.addObject("age", age);
		mview.addObject("msg", msg); //form���� ���� ���� �ѱ�ٸ� ������ ��..... �⺻���� �Ѱ��ָ� �ذ�
		
		mview.setViewName("process1");
		
		return mview;
		
	}
	
	@PostMapping("/data/read2") //form�� post���_dto������� �Ѱܹޱ�
	public ModelAndView read2(@ModelAttribute TestDto dto) {
		
		ModelAndView mview=new ModelAndView();
		
		mview.addObject("dto", dto);
		mview.setViewName("process2");
		
		return mview;
		
	}
	
	@PostMapping("/data/read3") //form�� post���_map����� �� �Ѱܹޱ�
	public ModelAndView read3(@RequestParam Map<String, String> map) {
		
		ModelAndView mview=new ModelAndView();
		
		String sang=map.get("sang");
		String price=map.get("price");
		
		String data=sang+"�� ������"+price+"�Դϴ�";
		
		mview.addObject("data", data);
		mview.setViewName("process3");
		
		return mview;
	}
	
	

}
