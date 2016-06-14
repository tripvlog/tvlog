package trip.post;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import trip.post.boardVO;
import trip.post.pagingAction;
import trip.post.PostDTO;
import trip.band.*;

@Controller
public class postBean {

   @Autowired
   private SqlMapClientTemplate sqlMapClientTemplate;
   
   @RequestMapping("/post/postList.trip") //����Ʈȭ��
   public ModelAndView postList(HttpServletRequest request, boardVO dto, HttpSession session){
	  String id=null;
	  id= (String)session.getAttribute("memId");
	  dto.setId(id);
     
	  List<boardVO> list = null;   
	  List<boardVO> ldto = null;   
       int blockCount = 10;   
       int blockPage = 5;    
       int currentPage = 1;
       if(request.getParameter("currentPage")!=null){
       currentPage = Integer.parseInt(request.getParameter("currentPage"));
       }
       
       if(id==null){
       list = sqlMapClientTemplate.queryForList("post.All",null); 
       
     
       }else if(id!=null){
    	   
    	   list =sqlMapClientTemplate.queryForList("post.sessionList", id);
       }
       int totalCount = list.size(); 
      pagingAction page = new pagingAction(currentPage, totalCount, blockCount, blockPage); 
      String pagingHtml = page.getPagingHtml().toString();


      int lastCount = totalCount;


      if (page.getEndCount() < totalCount)
         lastCount = page.getEndCount() + 1;

      list = list.subList(page.getStartCount(), lastCount);
       
      ModelAndView mv = new ModelAndView(); 
      
      
      request.setAttribute("dto", dto);
       mv.addObject("list", list);
       mv.addObject("count", list.size());
      mv.addObject("currentPage", currentPage);
      mv.addObject("PagingHtml", pagingHtml);
   
      mv.setViewName("/post/postList.jsp");
      

   return mv;
   }
   @RequestMapping("/post/friendpost.trip")
   public ModelAndView friendpost(String friend_id, HttpServletRequest request, boardVO dto, HttpSession session){
	  
	   		String id=null;	   
		  id= (String)session.getAttribute("memId");
		  dto.setId(id);
	     
		  List<boardVO> list = null;   
		  List<boardVO> ldto = null;   
	       int blockCount = 10;   
	       int blockPage = 5;    
	       int currentPage = 1;
	       if(request.getParameter("currentPage")!=null){
	       currentPage = Integer.parseInt(request.getParameter("currentPage"));
	       }
	       
	       if(id==null){
	       list = sqlMapClientTemplate.queryForList("post.friendPost", dto); 
	     
	       }else if(id!=null){
	    	   int count =(Integer)sqlMapClientTemplate.queryForObject("member_friendCheck", dto);
	    	   
	    	   if(count ==1){
	    	   list =sqlMapClientTemplate.queryForList("post.sessionFriend", friend_id);}
	    	   else if(count != 1){
	    	       list = sqlMapClientTemplate.queryForList("post.friendPost", dto); 	    		   
	    	   }
	    	}
	       int totalCount = list.size(); 
	      pagingAction page = new pagingAction(currentPage, totalCount, blockCount, blockPage); 
	      String pagingHtml = page.getPagingHtml().toString();


	      int lastCount = totalCount;


	      if (page.getEndCount() < totalCount)
	         lastCount = page.getEndCount() + 1;

	      list = list.subList(page.getStartCount(), lastCount);
	       
	      ModelAndView mv = new ModelAndView(); 
	      
	      
	      request.setAttribute("dto", dto);
	       mv.addObject("list", list);
	      mv.addObject("currentPage", currentPage);
	      mv.addObject("PagingHtml", pagingHtml);
	   
	      mv.setViewName("/post/postList.jsp");
	      

	   return mv;
	   }
   @RequestMapping("/post/friendOnly.trip")
   public ModelAndView friendOnly(String friend_id, HttpServletRequest request, boardVO dto, HttpSession session){
		  
  		String id=null;	   
	  id= (String)session.getAttribute("memId");
	  dto.setId(id);
    
	  List<boardVO> list = null;   
	  List<boardVO> ldto = null;   
      int blockCount = 10;   
      int blockPage = 5;    
      int currentPage = 1;
      if(request.getParameter("currentPage")!=null){
      currentPage = Integer.parseInt(request.getParameter("currentPage"));
      }
   
      list =sqlMapClientTemplate.queryForList("post.friendOnly", id);
      
     int totalCount = list.size(); 
     pagingAction page = new pagingAction(currentPage, totalCount, blockCount, blockPage); 
     String pagingHtml = page.getPagingHtml().toString();


     int lastCount = totalCount;


     if (page.getEndCount() < totalCount)
        lastCount = page.getEndCount() + 1;

     list = list.subList(page.getStartCount(), lastCount);
      
     ModelAndView mv = new ModelAndView(); 
     
     
     request.setAttribute("dto", dto);
      mv.addObject("list", list);
     mv.addObject("currentPage", currentPage);
     mv.addObject("PagingHtml", pagingHtml);
  
     mv.setViewName("/post/postList.jsp");
     

  return mv;
  }
   @RequestMapping("/post/publicfriend.trip")
   public ModelAndView publicfriend(String friend_id, HttpServletRequest request, boardVO dto, HttpSession session){
		  
  		String id=null;	   
	  id= (String)session.getAttribute("memId");
	  dto.setId(id);
    
	  List<boardVO> list = null;   
	  List<boardVO> ldto = null;   
      int blockCount = 10;   
      int blockPage = 5;    
      int currentPage = 1;
      if(request.getParameter("currentPage")!=null){
      currentPage = Integer.parseInt(request.getParameter("currentPage"));
      }
   
      list =sqlMapClientTemplate.queryForList("post.publicfriend", friend_id);
      
     int totalCount = list.size(); 
     pagingAction page = new pagingAction(currentPage, totalCount, blockCount, blockPage); 
     String pagingHtml = page.getPagingHtml().toString();


     int lastCount = totalCount;


     if (page.getEndCount() < totalCount)
        lastCount = page.getEndCount() + 1;

     list = list.subList(page.getStartCount(), lastCount);
      
     ModelAndView mv = new ModelAndView(); 
     
     
     request.setAttribute("dto", dto);
      mv.addObject("list", list);
     mv.addObject("currentPage", currentPage);
     mv.addObject("PagingHtml", pagingHtml);
  
     mv.setViewName("/post/postList.jsp");
     

  return mv;
   }
   @RequestMapping("/post/mypost.trip")
   public ModelAndView mypost(String friend_id, HttpServletRequest request, boardVO dto, HttpSession session){
		  
	   String id=null;	   
	  id= (String)session.getAttribute("memId");
	  dto.setId(id);
   
	  List<boardVO> list = null;   
	  List<boardVO> ldto = null;   
     int blockCount = 10;   
     int blockPage = 5;    
     int currentPage = 1;
     if(request.getParameter("currentPage")!=null){
     currentPage = Integer.parseInt(request.getParameter("currentPage"));
     }
  
     list =sqlMapClientTemplate.queryForList("post.mypost", id);
     
    int totalCount = list.size(); 
    pagingAction page = new pagingAction(currentPage, totalCount, blockCount, blockPage); 
    String pagingHtml = page.getPagingHtml().toString();


    int lastCount = totalCount;


    if (page.getEndCount() < totalCount)
       lastCount = page.getEndCount() + 1;

    list = list.subList(page.getStartCount(), lastCount);
     
    ModelAndView mv = new ModelAndView(); 
    
    
    request.setAttribute("dto", dto);
     mv.addObject("list", list);
    mv.addObject("currentPage", currentPage);
    mv.addObject("PagingHtml", pagingHtml);
 
    mv.setViewName("/post/postList.jsp");
    

 return mv;
 }  
   @RequestMapping("/post/postWritePro.trip")
   public String postWritePro(boardVO dto, HttpServletRequest request, MultipartHttpServletRequest mrequest){
	   System.out.println("������Ʈ="+dto.getSubject());
	      System.out.println("������="+dto.getContent());
	      System.out.println("����Ʈ="+dto.getSelect_p());
	   
	   Calendar today = Calendar.getInstance();   
      dto.setRegdate(today.getTime());
      
      String imgFile= dto.getContent();
      int img = imgFile.indexOf("<img src=");
      if(img != -1){
    	  imgFile = imgFile.substring(img);
    	  imgFile = imgFile.substring(imgFile.indexOf("\"")+1, imgFile.indexOf("title")-2);
    	  dto.setFile_savname(imgFile);
    	  System.out.println("=====>>  "+imgFile);
      }
      
      sqlMapClientTemplate.insert("post.insertPost", dto);
     
      
      
      int size = mrequest.getFiles("upload").size();
      String sn ="" , on="";
      if (size > 0) {// �������ϱ� ���� �ƴ�.
         List<MultipartFile> files=mrequest.getFiles("upload");
         for(MultipartFile file : files){
        	 String fileUploadPath = request.getRealPath("img");
	         int count=(Integer)sqlMapClientTemplate.queryForObject("countNo", null);
	         if(count ==0){
	            dto.setNo(1);
	         }else{
	            dto=(boardVO)sqlMapClientTemplate.queryForObject("selectLast", null);
	         }
	         String file_name = "file_" +(Integer)dto.getNum();  //file_name = file_+ ��ȣ (����������) 
	         String file_ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.') + 1,file.getOriginalFilename().length());
	         File destFile = new File(fileUploadPath+"//" + file_name + "."+ file_ext);   
	         try{
	        	 file.transferTo(destFile);
	         }catch(Exception e){
	        	 e.printStackTrace();
	         } 
	         dto.setFile_orgname(file.getOriginalFilename());
	         dto.setFile_savname(file_name+"."+file_ext);
	         if(file.getOriginalFilename().length() > 0){
	        	 sqlMapClientTemplate.insert("updateFile", dto);
	        	 on +=file.getOriginalFilename()+",";
	        	 sn +=(file_name + "."+ file_ext)+",";
	         }
          }
         dto.setFile_orgname(on);
         dto.setFile_savname(sn);
         dto.setNo((Integer)sqlMapClientTemplate.queryForObject("selectLastNo", null));
         sqlMapClientTemplate.update("updatePostFile", dto);
         
        }

      return "redirect:/post/postList.trip";
		
      //return "/postboard/postWritePro.jsp";
      }
   
   
   
   @RequestMapping("/post/postView.trip")
   public String postView(HttpServletRequest request, boardVO dto, boardVO vo, int currentPage){
      List<boardVO> list=null;
      List<boardVO> filelist = null;
      sqlMapClientTemplate.update("post.updateReadHit",dto);
      int no = dto.getNo();
      
      dto = (boardVO)sqlMapClientTemplate.queryForObject("post.search", dto);
      list=sqlMapClientTemplate.queryForList("post.uploadAll", no);
  
      
      
	  List<boardVO> colist = null;
	  
	  colist=sqlMapClientTemplate.queryForList("post.selectComment", no);
	  
	   request.setAttribute("colist", colist); 
       request.setAttribute("currentPage",currentPage);
      request.setAttribute("dto", dto);
      request.setAttribute("list",list); 
      System.out.println("����ǰ� �ֳ�");
      return "/tvlog/postView.jsp";
   }

   @RequestMapping("/post/search.trip") //�˻��ؼ� �۾���,����,��ȣ�� �Ͽ����� ���ε带 �ѱ�� ���ε带 �ѱ䰪�� ����־ �ش�Ǵ� �͵��� �ѷ��ش�. 
   public ModelAndView boardsearch(HttpServletRequest request,boardVO dto,String select, String find){      
      List<boardVO> list = null;       
       int blockCount = 5;   
       int blockPage = 5;    
       int currentPage = 1;
       if(request.getParameter("currentPage")!=null){
       currentPage = Integer.parseInt(request.getParameter("currentPage"));
       }
       
       
       
       System.out.println("select__"+select);
       System.out.println("select__"+find);
       
       //find = "%"+find+"%";
      // System.out.println(find);
       
       if(select.equals("no") ){
          
          System.out.println("no������__"+find);
             list = sqlMapClientTemplate.queryForList("post.rjator",find);    
       
       }else if(select.equals("subject")){
          System.out.println("subject������__"+find);
             list = sqlMapClientTemplate.queryForList("post.rjator1",find);
          
       }else{
          System.out.println("writer������__"+find);
               list = sqlMapClientTemplate.queryForList("post.rjator2",find);
       }

       // list = sqlMapClientTemplate.queryForList("All",dto);       
      int totalCount = list.size(); 
      pagingAction page = new pagingAction(currentPage, totalCount, blockCount, blockPage); 
      String pagingHtml = page.getPagingHtml().toString();
      
      


      int lastCount = totalCount;


      if (page.getEndCount() < totalCount)
         lastCount = page.getEndCount() + 1;

      list = list.subList(page.getStartCount(), lastCount);
        
      ModelAndView mv = new ModelAndView(); 

        mv.addObject("list", list);
      mv.addObject("currentPage", currentPage);
      mv.addObject("PagingHtml", pagingHtml);
      mv.addObject("find",find);
      System.out.println(find);
      
      mv.setViewName("/post/postList.jsp");
      

   return mv;
   }

   @RequestMapping("/post/postDeleteForm.trip")
   public String postDeleteForm(HttpServletRequest request, boardVO dto, int currentPage){
      
      request.setAttribute("dto", dto);
      request.setAttribute("currentPage", currentPage);
      request.setAttribute("no", dto.getNo());
      return "/postboard/checkPassword.jsp";
   }

   @RequestMapping("/post/postDelete.trip")
   public String postDeletePro(HttpServletRequest request, boardVO dto){
	   System.out.println("����Ʈ"+dto.getNo());
      sqlMapClientTemplate.delete("post.deletePro",dto);   
      return "redirect:/post/postList.trip";
   }
   
   @RequestMapping("/post/postModifyForm.trip")
   public String postModifyForm(HttpServletRequest request, boardVO dto){
	   
	   dto = (boardVO)sqlMapClientTemplate.queryForObject("post.modifysearch", dto);

      request.setAttribute("no", dto.getNo());
      request.setAttribute("dto", dto);

      return "/post/postModifyForm.jsp";
   }

   @RequestMapping("/post/postModifyPro.trip")
   public String postModifyPro(HttpServletRequest request, boardVO dto, int currentPage){
      dto = (boardVO)sqlMapClientTemplate.queryForObject("modifysearch",dto);

      if(dto==null){      
         return "/postboard/checkError.jsp";   
      }
      request.setAttribute("currentPage",currentPage);  
      request.setAttribute("dto",dto);
      System.out.println("Ŀ��Ʈ ������"+currentPage);
      return "/postboard/checkSuccess.jsp";
   }
   
   @RequestMapping("/post/postModifyList.trip")
   public String postModifyList(HttpServletRequest request, boardVO dto, int currentPage){
      List<boardVO> list =null;
      int no = dto.getNo();
      dto = (boardVO)sqlMapClientTemplate.queryForObject("modifyall",dto);
      list=sqlMapClientTemplate.queryForList("uploadAll", no);
      int count=(Integer)sqlMapClientTemplate.queryForObject("uploadNoSerch", no);
      
      request.setAttribute("count",count);
      request.setAttribute("dto",dto);
      request.setAttribute("currentPage", currentPage);
      request.setAttribute("list", list);
      System.out.println("count="+count);
      return "/postboard/boardWrite.jsp";
   }
   @RequestMapping("/post/postModify.trip")
   public String postModify(boardVO dto, HttpServletRequest request, int no){
	  System.out.println("������̳ѹ�="+dto.getNo());
	  System.out.println("������̳ѹ�="+no);
	  
	  String imgFile= dto.getContent();
      int img = imgFile.indexOf("<img src=");
      if(img != -1){
    	  imgFile = imgFile.substring(img);
    	  imgFile = imgFile.substring(imgFile.indexOf("\"")+1, imgFile.indexOf("title")-2);
    	  dto.setFile_savname(imgFile);
    	  System.out.println("=====>>  "+imgFile);
      }
      
	   sqlMapClientTemplate.update("post.update", dto);
	   return "redirect:/post/postList.trip";
   }
   
   @RequestMapping("/post/postModifyUpdate.trip")
   public String postModifyUpdate(int no, boardVO dto, PostDTO pto, HttpServletRequest request, int currentPage, MultipartHttpServletRequest mrequest){
      
      request.setAttribute("currentPage", currentPage);
      sqlMapClientTemplate.update("update",dto);
      
     
         
      int size = mrequest.getFiles("upload").size();
      String sn ="" , on="";
     
      if (size > 0) {
       
         List <PostDTO> filelist=null;
         String fileUploadPath = request.getRealPath("img");
         filelist = sqlMapClientTemplate.queryForList("selectFile2", dto.getNo()); //���� db���� no���� ���� �͵� ��󳻼� list�� ��´�
        System.out.println("�����н� ���1"+fileUploadPath);

        
 
         if(filelist != null){
            for(int i = 0; i<filelist.size(); i++){
               PostDTO pdto = filelist.get(i);
              
               String delete_name= "file_"+pdto.getNum();
               String delete_ext = filelist.get(i).getFile_savname().substring(filelist.get(i).getFile_savname().lastIndexOf('.') + 1,filelist.get(i).getFile_savname().length());
               File deleteFile=new File(fileUploadPath +"//"+ delete_name+ "." +delete_ext);
               deleteFile.delete();
               int num = filelist.get(i).getNum();
           
           //   if(pdto.getNo() > 0){ //if�� ���� ������ �׳� ��� ������ �Ǳ⿡
               sqlMapClientTemplate.delete("modifyDelete", num);
              
        //    }
            }
         }
         ///////////////////////////////////////////////////////////
         //delete �ǰ�  maxno�������ϱ� file_name�� �������� ���⶧���� dto_getAno �޾ƿ��� ������ ����Ʈ ������ �÷��� ���ְ�
         //������ file�����ŭ +1,+2,+3 �ǰ� �����ؾߵ�.

         List<MultipartFile> files = mrequest.getFiles("upload");
         for(MultipartFile file : files){
            int power=files.size();
            
            int count=(Integer)sqlMapClientTemplate.queryForObject("countNo", null);
            if(count ==0){
               dto.setNo(1);            
         }else{
            dto=(boardVO)sqlMapClientTemplate.queryForObject("selectLast", null);
           
           }
            String file_name="file_"+dto.getNum();
            String file_ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.') + 1, file.getOriginalFilename().length());
            File destFile=new File(fileUploadPath + "//"+ file_name+ "."+file_ext);
            System.out.println("�����н� ���2"+fileUploadPath);
             try {
                 file.transferTo(destFile);
              }catch (Exception e) {
                 e.printStackTrace();
              }
      
           dto.setFile_orgname(file.getOriginalFilename());      
           dto.setFile_savname(file_name + "." + file_ext);
           dto.setNo(no);
           
           if(file.getOriginalFilename().length() > 0){//������ ���� ��츸 ��
           sqlMapClientTemplate.update("modifyInsert", dto);
           on +=file.getOriginalFilename()+",";
           sn +=(file_name + "."+ file_ext)+",";
           }
         }
         dto.setFile_orgname(on);
         dto.setFile_savname(sn);
         System.out.println("on="+on);
         System.out.println("sn="+sn);
         sqlMapClientTemplate.update("updatePostFile", dto);
 
}

      return "redirect:/post/postList.trip";
   }
   
   
   @RequestMapping("/post/filedownload.trip")
   public ModelAndView boardfiledownload(boardVO dto,HttpServletRequest request, int num){
       System.out.println("�ٿ�ε� �� ��="+num);
      String filepath = "c://save//";
      System.out.println(filepath);
      dto = (boardVO) sqlMapClientTemplate.queryForObject("selectFile",dto.getNum());
      File down= new File(filepath+dto.getFile_savname());
      
      request.setAttribute("dto", dto);
      
      return new ModelAndView("download","downloadFile",down);
      }   
   
      @RequestMapping("/post/postGood.trip")
      public String goodPost(HttpSession session, HttpServletRequest request,boardVO dto, int no){
         String id= (String)session.getAttribute("memId");
         dto.setNo(no);
         dto.setId(id);
         System.out.println("id="+dto.getId());
         System.out.println("no="+dto.getNo());
         int count =(Integer)sqlMapClientTemplate.queryForObject("post.checkGood", dto);
         
         if(count != 1){ 
            sqlMapClientTemplate.insert("post.insertPgood", dto);
            sqlMapClientTemplate.update("post.updateGood",no);
 
         }else if(count == 1){
            sqlMapClientTemplate.delete("post.deletePgood", dto);
            sqlMapClientTemplate.update("post.minusGood",no);
         }
         int good = (Integer)sqlMapClientTemplate.queryForObject("post.selectGood", no);
            request.setAttribute("good", good);
            
         return "/post/postGood.jsp";
      }

      @RequestMapping("/post/comment.trip")
      public String comment(HttpSession session, boardVO dto, HttpServletRequest request, int no){
    	
    	  String id= (String)session.getAttribute("memId");
    	  dto.setId(id);
    	  Calendar today = Calendar.getInstance();
    	  dto.setRegdate(today.getTime());
    	  sqlMapClientTemplate.insert("post.insertComment", dto);
   
    	  /*
    	  List<boardVO> colist = null;    	  
    	  colist=sqlMapClientTemplate.queryForList("post.selectComment", no);
    	   request.setAttribute("colist", colist); 
    	    */
    /*	   
       return "redirect:/postView.trip?no="+no+"&currentPage="+currentPage;
		�ٷ� �ٸ� �޼ҵ�� �̾������� */
    	return "redirect:/post/postList.trip";
      }
      @RequestMapping("/post/commentView.trip")
      public String commnetView(boardVO dto, HttpServletRequest request, int no){
    	 System.out.println("�ڸ�Ʈ��="+no);
    	  List<boardVO> colist = null;
    	  colist=sqlMapClientTemplate.queryForList("post.selectComment", no);
    	  request.setAttribute("colist", colist);
      return "/post/commentView.jsp";
      }
      
      @RequestMapping("/post/startComment.trip")
      public String StartComment(boardVO dto, int no, HttpServletRequest request){
    	  List<boardVO> colist = null;
    	  colist=sqlMapClientTemplate.queryForList("selectComment", no);
    	  request.setAttribute("colist", colist);
    	  System.out.println("��ŸƮ�ڸ�="+no);
    	  return "/postboard/commentView.jsp";
      }
     
      @RequestMapping("/post/deleteComment.trip")
      public String deleteComment(boardVO dto){
    	  sqlMapClientTemplate.delete("post.deleteComment", dto);
    	  return "redirect:/post/postList.trip";
      }
      @RequestMapping("/post/newFriend.trip")
      public String newFriend(HttpSession session, String id, String friend_id, HttpServletRequest request){
    	  id= (String)session.getAttribute("memId");
    	  request.setAttribute("id", id);
    	  request.setAttribute("friend_id", friend_id);
    	  return "/post/newFriend.jsp";
      }
      //ģ����û �� ���̵� 0��, ���� ���̵� 1���� friend_state �� �ִ´�
      @RequestMapping("/post/newFriendPro.trip")
      public String newFriendPro(HttpServletRequest request, boardVO dto){
    	
    	  int count =(Integer)sqlMapClientTemplate.queryForObject("member_friendCheck", dto);
    	  request.setAttribute("count", count);
    	  
    	  if(count==0){
    		  sqlMapClientTemplate.insert("member_sendfriend", dto);
    		  sqlMapClientTemplate.insert("member_getfriend", dto);
    	  }
    	  return "/post/friendOkFail.jsp";
      }
      //ģ������â
      @RequestMapping("/post/friendManage.trip") 
      public String friendManage(boardVO dto, HttpSession session, HttpServletRequest request){
    	  String id = (String)session.getAttribute("memId");
    	  List<boardVO> list = null;
    	  List<boardVO> list2 = null;
    	  List<boardVO> list3 = null;
    	  list=sqlMapClientTemplate.queryForList("member_selectFriend1", id);
    	  //���� ģ�� ��û(1��) ����Ʈ�� ���
    	  int count = (Integer)sqlMapClientTemplate.queryForObject("member_selectFriendcount1", id);
    	  //���� ģ�� ��û ���� count�� ���
    	  list2=sqlMapClientTemplate.queryForList("member_selectFriend0", id);
    	  //���� �� ģ�� ��û list2 �� ���
    	  int count2 = (Integer)sqlMapClientTemplate.queryForObject("member_selectFriendcount0", id);
    	  //���� �� ģ�� ��û count2�� ���
    	  list3=sqlMapClientTemplate.queryForList("member_selectFriend2", id);
    	  // ģ�������� ��� �̾� ���
    	  int count3 = (Integer)sqlMapClientTemplate.queryForObject("member_selectFriendcount2", id);
    	  request.setAttribute("list", list);
    	  request.setAttribute("list2", list2);
       	  request.setAttribute("list3", list3);
    	  request.setAttribute("count", count);
    	  request.setAttribute("count2", count2);
    	  request.setAttribute("count3", count3);
    	  

    	  return "/post/friendManage.jsp";
      }//ģ����û ����
   @RequestMapping("/post/okFriend.trip")
   public String okFriend(HttpSession session, boardVO dto){
	   String id = (String)session.getAttribute("memId");
	   dto.setId(id);
	   sqlMapClientTemplate.update("member_okfriend1", dto);
	   sqlMapClientTemplate.update("member_okfriend2", dto);
	   
	   return "redirect:/post/friendManage.trip";
   }
   //ģ����û ����
   @RequestMapping("/post/noFriend.trip")
   public String noFriend(HttpSession session, boardVO dto){
	   String id = (String)session.getAttribute("memId");
	   dto.setId(id);
	   sqlMapClientTemplate.delete("member_nofriend1", dto);
	   sqlMapClientTemplate.delete("member_nofriend2", dto);
	   
	   return "redirect:/post/friendManage.trip";
   }
   //ģ�� ����
   @RequestMapping("/post/deleteFriend.trip")
   public String deleteFriend(HttpSession session, boardVO dto){
	   String id = (String)session.getAttribute("memId");
	   dto.setId(id);
	   sqlMapClientTemplate.delete("member_nofriend1", dto);
	   sqlMapClientTemplate.delete("member_nofriend2", dto);
	   
	   return "redirect:/post/friendManage.trip";
   }
   @RequestMapping("/post/friendSearch.trip")
   public String friendSearch(HttpServletRequest request, boardVO dto, String select, String find){
	   
	   List<boardVO> list = null;       
       
       if(select.equals("id") ){
          
          System.out.println("no������__"+find);
             list = sqlMapClientTemplate.queryForList("member_findfriend_id",find);    
       
       }else if(select.equals("name")){
          System.out.println("subject������__"+find);
             list = sqlMapClientTemplate.queryForList("member_findfriend_name",find);          
       }
	   
       request.setAttribute("list", list);
       return "/post/friendFind.jsp";
   }
   @RequestMapping("/post/bandComeon.trip")
   public String bandComeon(HttpSession session, BandDTO dto, String friend_id, HttpServletRequest request){
	   String id = (String)session.getAttribute("memId");
	   List<BandDTO> list = null;
	   list = sqlMapClientTemplate.queryForList("post.myBand", id);
	   
	   request.setAttribute("list", list);
	   request.setAttribute("friend_id", friend_id);
	   return "/post/bandComeon.jsp";
   }
   //��� �ʴ븦 �� ���, ������ �̹� ���Ե� ������� �ƴ��� ī��Ʈ�� �Ǵ��ؼ� ���� �� �� ����� ��� ���̺� �ִ´�.
   @RequestMapping("/post/bandselect.trip")
   public String bandselect(HttpSession session, BandDTO dto, memberDTO mdto, String band_member_id, HttpServletRequest request){
	   String id = (String)session.getAttribute("memId");
	   int count =(Integer)sqlMapClientTemplate.queryForObject("post.hisbandCheck", mdto);	  
	   if(count==0){
		   System.out.println("count1��"+count);
		   sqlMapClientTemplate.insert("post.comeband", mdto);	  
		   sqlMapClientTemplate.insert("post.myband_insert", dto);
	   }
	   request.setAttribute("count", count);
	   request.setAttribute("band_name", dto.getBand_name());
	   request.setAttribute("dto", dto);
	   return "/post/bandComeOKNO.jsp";
   }  
   // �� ��� ����� �����ش�
   @RequestMapping("/post/bandManage.trip")
   public String bandManage(HttpSession session, memberDTO mdto, BandDTO dto, String friend_id, HttpServletRequest request){
	  String id = (String)session.getAttribute("memId");
 	  List<memberDTO> list = null;
 	  
 	  list=sqlMapClientTemplate.queryForList("post.myBand", id);
 	  int count = (Integer)sqlMapClientTemplate.queryForObject("post.mybandcount", id);
 	  request.setAttribute("list", list);
 	  request.setAttribute("count", count);
 	  
 	  return "/post/bandManage.jsp";
   }
   //�� ��� ��Ͽ��� ���Ե� ��� Ż��
   @RequestMapping("/post/bandBye.trip")
   public String bandBye(HttpSession session, memberDTO mdto, BandDTO dto, String band_id, HttpServletRequest request){
	  String id = (String)session.getAttribute("memId");
	  mdto.setBand_member_id(id);
	  sqlMapClientTemplate.delete("post.mybandBye", mdto);
	  sqlMapClientTemplate.delete("post.bandMemberBye", mdto);
	  return "/post/bandBye.jsp";
   }
   // ���� ������ ����� �������� ���, ��� ���� ��û ����� �����Ѵ�
   @RequestMapping("/post/bandKing.trip")
   public String bandKing(HttpSession session, memberDTO mdto, BandDTO dto, String band_id, String band_name, HttpServletRequest request){
	  String id = (String)session.getAttribute("memId");
 	  List<memberDTO> list = null;
 	 mdto.setBand_member_id(id);
 	 int count = (Integer)sqlMapClientTemplate.queryForObject("post.imbandkingCount2", mdto);
 	
 	 if(count==1){
 		 list=sqlMapClientTemplate.queryForList("post.imbandkingCount0", mdto);
 	 }	 
 	  request.setAttribute("list", list);
 	  request.setAttribute("count", count);
 	 request.setAttribute("band_id", band_id);
 	request.setAttribute("band_name", band_name);
 	
 	  return "/post/bandMemberLevel.jsp";
   }
   //��� ���� ��û ����
   @RequestMapping("/post/bandmemberOk.trip")
   public String bandmemberOk(HttpSession session, memberDTO mdto, String band_id, String band_member_id, String band_name, HttpServletRequest request){
	   sqlMapClientTemplate.update("post.memberlevelup", mdto);
	   request.setAttribute("band_id", band_id);
	   return "redirect:/post/bandManage.trip";
   }
   // ��� ���� ��û ���� 
   @RequestMapping("/post/bandmemberNo.trip") 
   public String bandmemberNo(HttpSession session, memberDTO mdto, int band_id, String band_member_id, String band_name, HttpServletRequest request){
	   mdto.setBand_id(band_id);
	   mdto.setBand_member_id(band_member_id);
	   
	   System.out.println("�����̵�"+band_id);
	   System.out.println("��������̵�"+band_member_id);
	   sqlMapClientTemplate.delete("post.memberNo", mdto);
	   request.setAttribute("band_id", band_id);
	   return "redirect:/post/bandManage.trip";
   }
   //��� ȭ�鿡�� ��� �̸��̳� �Ұ��� �˻�
   @RequestMapping("/post/bandSearch.trip")
   public String bandSearch(String bandname, BandDTO dto, HttpServletRequest request){
	   List<BandDTO> list =null;
	   list = sqlMapClientTemplate.queryForList("post.bandSearch",bandname);   
	   request.setAttribute("b_list", list);
	   
	   return "/band/list_band.jsp";
   }
   @RequestMapping("/post/friendschedule-list.trip")
	public String schedulelist(HttpServletRequest request, HttpSession session, String s_writer){
		String id= (String)session.getAttribute("memId");
		int count = (Integer)sqlMapClientTemplate.queryForObject("schedule.scheduleCount", s_writer);
		request.setAttribute("scheduleCount", count);
		
		if(count > 0){

			List scheduleList = null;
			scheduleList = sqlMapClientTemplate.queryForList("schedule.scheduleList", s_writer);
			request.setAttribute("scheduleList", scheduleList);
	
			
		}
		return "/schedule/schedule-list.jsp";
	}
   
}