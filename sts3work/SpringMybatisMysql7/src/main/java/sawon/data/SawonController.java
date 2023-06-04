package sawon.data;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SawonController {
	
	@Autowired
	SawonDaoInter dao;
	
	@GetMapping("/sawon/list")
	public ModelAndView list(@RequestParam(defaultValue = "name") String title, @RequestParam(required = false) String search) {
		
		ModelAndView model=new ModelAndView();
		
		//��ü����
		int totalCount=dao.getTotalCount();
		
		//title�� search �°� �Ѿ������ �ֿܼ� ����
		System.out.println(title+","+search);
		
		//map ����ֱ�
		Map<String, String> map=new HashMap<String, String>();
		map.put("title", title);
		map.put("search", search);
		//�˻� ����
		int searchCount=dao.searchCount(map);
		
		//��ü ȸ�� ����Ʈ
		List<SawonDto> list=dao.getAllDatas(map);
		
		model.setViewName("sawon/sawonlist");
		model.addObject("totalCount", totalCount);
		model.addObject("searchCount", searchCount);
		model.addObject("list", list); //list�ȿ��� map���� ���� �Ǿ� ����
		model.addObject("search",search);
		
		return model;
	}
	
	//��� �ۼ� ���� ������
	@GetMapping("sawon/form")
	public String form() {
		
		return "sawon/addform";
	}
	
	//�ۼ� �׼�
	@PostMapping("/sawon/insert")
	public String insert(@ModelAttribute SawonDto dto, @RequestParam MultipartFile upload, HttpSession session) {
		//upload�� insert������ input�±� file�� name
		
		String path=session.getServletContext().getRealPath("/WEB-INF/image/");
		System.out.println(path);
		
		String photoname; //dto�� ���� ���� ���� ����
		
		//����÷�� ���ο� ���� photoname ���� ����
		if(upload.getOriginalFilename().equals("")) {
			photoname="no"; //���� ���� �������� no 
		}else {
			String fName=upload.getOriginalFilename();
			photoname=fName; //���������ϸ� fName
			
			//���ε�
			try {
				
				upload.transferTo(new File(path+"\\"+photoname));
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//dto�� photo�� ���ε��� photoname �־��ֱ�
		dto.setPhoto(photoname);
		
		//insert
		dao.insertSawon(dto);
				
		return "redirect:list";
		
	}
	
	//���������� �̵�
	@GetMapping("/sawon/updateform")
	public String updateform(@RequestParam String num, Model model) {
		
		SawonDto dto=dao.getNum(num);
		
		model.addAttribute("dto",dto);
		
		return "sawon/updateform";
	}
	
	@PostMapping("/sawon/update")
	public String update(@ModelAttribute SawonDto dto, @RequestParam MultipartFile upload, HttpSession session) {
		//upload�� insert������ input�±� file�� name
		
		String path=session.getServletContext().getRealPath("/WEB-INF/image/");
		System.out.println(path);
		
		String photoname=""; //dto�� ���� ���� ���� ����
		
		//����÷�� ���ο� ���� photoname ���� ����
		if(upload.getOriginalFilename().equals("")) {
			photoname=null; //���� ���� �������� no 
		}else {
			photoname=upload.getOriginalFilename();
			//photoname=fName; //���������ϸ� fName
			
			//���ε�
			try {
				
				upload.transferTo(new File(path+"\\"+photoname));
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//dto�� photo�� ���ε��� photoname �־��ֱ�
		dto.setPhoto(photoname);
		
		dao.updateSawon(dto);
				
		return "redirect:list";
		
	}
	
	@GetMapping("/sawon/delete")
	public String delete(@ModelAttribute SawonDto dto, HttpSession session) {
		
		dao.delete(dto);
		return "redirect:list";
	}
	
	
	/*
	 * //�̹������� ����ʵ� ����
	 * 
	 * @PostMapping("/sawon/update") public String update(@ModelAttribute SawonDto
	 * dto, @RequestParam MultipartFile upload, HttpSession session) {
	 * 
	 * String path=session.getServletContext().getRealPath("/WEB-INF/image/");
	 * System.out.println(path);
	 * 
	 * String photoname=""; //dto�� ���� ���� ���� ����
	 * 
	 * photoname=upload.getOriginalFilename();
	 * 
	 * //���ε� try {
	 * 
	 * upload.transferTo(new File(path+"\\"+photoname));
	 * 
	 * } catch (IllegalStateException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } catch (IOException e) { // TODO Auto-generated catch
	 * block e.printStackTrace(); }
	 * 
	 * //dto�� photo�� ���ε��� photoname �־��ֱ� dto.setPhoto(photoname);
	 * 
	 * //update dao.updateSawon(dto);
	 * 
	 * return "redirect:list";
	 * 
	 * }
	 */
}
