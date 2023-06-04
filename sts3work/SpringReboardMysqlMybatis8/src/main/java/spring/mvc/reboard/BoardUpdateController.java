package spring.mvc.reboard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import reboard.data.model.ReBoardDao;
import reboard.data.model.ReBoardDto;

@Controller
public class BoardUpdateController {
	
	@Autowired
	ReBoardDao dao;
	
	@GetMapping("/board/updatepassform")
	public ModelAndView upassform(@RequestParam int num, @RequestParam int currentPage) {
		
		ModelAndView model=new ModelAndView();
		
		model.addObject("num", num);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("updatepassform");
		return model;
	}
	
	@PostMapping("/board/updatepass")
	public ModelAndView upass(@RequestParam int num,@RequestParam int pass,@RequestParam int currentPage) {
		
		ModelAndView model=new ModelAndView();
		
		//����� ������ ������ Ʋ���� paafail
		int check=dao.getCheckPass(num, pass);
		
		//����� ������
		if(check==1) {
			//num�� �ش��ϴ� dto ���
			ReBoardDto dto=dao.getData(num);
			
			model.addObject("dto", dto);
			model.addObject("currentPage", currentPage);
			model.setViewName("updateform"); //���������� ������
		}else {
			//0�� ���(Ʋ�����)
			model.setViewName("passfail"); //���з� ������
		}
		return model;
		
	}
	
		@PostMapping("/board/update")
		public String update(@ModelAttribute ReBoardDto dto, @RequestParam ArrayList<MultipartFile> upload, HttpSession session, @RequestParam String currentPage){
			
			//���ε� �� �������
			String path=session.getServletContext().getRealPath("/WEB-INF/photo/");
			
			//���ϸ��� ��¥ �ٿ��ֱ�
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHss");
			System.out.println(path);
			
			String photo="";
			
			//���� ���� ���ϸ� 'no' �� �����ϰ� ���� ���� ','�� ������
			//get(0)�� ù��° �����̶� ��
			if(upload.get(0).getOriginalFilename().equals("")) {
				photo="no";
			}else {
				for(MultipartFile f:upload) {
					String fName="p_"+sdf.format(new Date())+f.getOriginalFilename();
					photo+=fName+",";
					
					//���ε�
					try {
						f.transferTo(new File(path+"\\"+fName));
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				//photo���� ������ �ĸ�����
				photo=photo.substring(0, photo.length()-1);
			}
			
			//dto�� photo �־��ֱ�
			dto.setPhoto(photo);
			
			//update
			dao.updateReboard(dto);
			
			return "redirect:content?num="+dto.getNum()+"&currentPage="+currentPage;
		}
	
	
	
	
}