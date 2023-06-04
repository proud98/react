package spring.mvc.friday;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller //bean�� ���
public class HelloController {
	
	//@RequestMapping(value = "/",method = RequestMethod.GET)
	@GetMapping("/") //form.xml���Ͽ��� �������༭ �̷��� �����ϰ� ��� ���� 
	public String home(Model model) {
		//Model �������̽��� request�� �����͸� ������ 
		
		//�������� �ڵ��ߴ� request.setAttribute�� ����
		model.addAttribute("msg", "HelloController�κ��� �������");
		model.addAttribute("today", new Date());
		return "home";
		
	}
	
	@GetMapping("/apple/list") //list�ڿ� .do .nhn������ ���̴�����  �� ȣ���(�����ּҿ� Ȯ���ڰ� ������ �� �� Ȯ���ڸ� ȣ��)
	public String hello1(Model model) {
		
		model.addAttribute("name", "���϶�"); //name�� ���϶��� ���� 
		model.addAttribute("addr", "����� ������"); //addr�� ����� ������ ����
		return "result1"; // WEB-INF/day0331/result1.jsp�� �̵�
		
	}
	
	@GetMapping("banana/insert") 
	public ModelAndView one() {
		//ModelAndView�� request�� �����ϱ� ���� Model�� �������ϱ� ���� View�� ��ģ ���� (Ŭ����)
		//Ŭ�����̱⿡ �ݵ�� ������ ���࿩�� 
		ModelAndView mview=new ModelAndView();
		
		//�ϴ� request�� �����ϱ� 
		mview.addObject("Java", 88);
		mview.addObject("Spring", 100);
		
		//�׸��� �������ϱ� ���� view �����
		mview.setViewName("result2");
				
		return mview; //���ϰ��� ������ ������ mview
		
	}
	
	@GetMapping("orange/delete")
	public String two(Model model,HttpSession session) {
	
		//request�� ����
		model.addAttribute("name", "�϶�");
		
		//session�� ����
		session.setAttribute("myid", "admin");
		
		return "result3";
		
	}
	
	@GetMapping("shop/detail")
	public String three() {
		
		return "result4";
	}
	
	@GetMapping("/board/add/data")
	
	public String four() {
		
		return "result5";
	}
                                                                                                                                                                                                                   
}
