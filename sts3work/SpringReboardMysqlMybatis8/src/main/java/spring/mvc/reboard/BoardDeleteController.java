package spring.mvc.reboard;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import reboard.data.model.ReBoardDao;


@Controller
public class BoardDeleteController {
	
	@Autowired
	ReBoardDao dao;
	
	@GetMapping("/board/deletepassform")
	public ModelAndView dpassform(@RequestParam int num, @RequestParam int currentPage) {
		
		ModelAndView model=new ModelAndView();
		
		model.addObject("num", num);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("deletepassform");
		return model;
	}
	
	//����
	@PostMapping("/board/delete")
	public String delete(@RequestParam int num, @RequestParam int pass, @RequestParam int currentPage, HttpSession session) {
		
		//��� �´��� äũ
		int check=dao.getCheckPass(num, pass);
		//Ʋ������
		if(check==0) {
			return "passfail"; //�� ������
		}else { //������
			
			//photo������ ���������
			String photo=dao.getData(num).getPhoto();
			if(!photo.equals("no")) {
				//,�� �и�
				String []fName=photo.split(",");
				//�������ε� ���
				String path=session.getServletContext().getRealPath("/WEB-INF/photo");
				
				for(String f:fName) {
					File file=new File(path+"\\"+f);
					file.delete();
				}
			}
			//db����
			dao.deleteReboard(num);
			
			return "redirect:list?currentPage="+currentPage; //currentPage���� ���� �ѱ��
		}
		
		
	}
	

}
