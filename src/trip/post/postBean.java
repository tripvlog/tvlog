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

@Controller
public class postBean {

   @Autowired
   private SqlMapClientTemplate sqlMapClientTemplate;
   
   @RequestMapping("/post/postList.trip") //리스트화면
   public ModelAndView postList(HttpServletRequest request, boardVO dto, HttpSession session){
	  String id=null;
	  id= (String)session.getAttribute("memId");
	  dto.setId(id);
	  System.out.println("리스트화면id="+id);
     
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
	    	 
	    	 //  ldto = sqlMapClientTemplate.queryForList("post.public_2", id);
	    	  // sql 조인 기능 찾기 전에 친구 테이블을 리스트로 담아 id값에 전부 담으려고 했을 때 사용했던 쿼리 
	    	   
	    	   list =sqlMapClientTemplate.queryForList("post.sessionFriend", friend_id);
	       
	    	/*   for(int i = 0; i <= ldto.size(); i++){
	    		   
	    		  id = id + (" or id='"+ldto.get(i).getFriend_id()+"'");
	    		  System.out.println("반복문="+id);
	    	list =sqlMapClientTemplate.queryForList("post.sessionList", id);
	    		System.out.println("리스트의끝="+list);
	    		  //   list = sqlMapClientTemplate.queryForList("post.public_4", id);
	       }*/}
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
   
   @RequestMapping("/post/postWriteForm.trip")
   public String postWriteForm(HttpServletRequest request, int currentPage){
      request.setAttribute("currentPage", currentPage);

      return "/post/boardWrite.jsp";
   }
   
   
   @RequestMapping("/post/postWritePro.trip")
   public String postWritePro(boardVO dto, HttpServletRequest request, MultipartHttpServletRequest mrequest){
	   System.out.println("서브젝트="+dto.getSubject());
	      System.out.println("컨텐츠="+dto.getContent());
	      System.out.println("셀렉트="+dto.getSelect_p());
	   
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
      if (size > 0) {// 보냈으니까 널이 아님.
         List<MultipartFile> files=mrequest.getFiles("upload");
         for(MultipartFile file : files){
        	 String fileUploadPath = request.getRealPath("img");
	         int count=(Integer)sqlMapClientTemplate.queryForObject("countNo", null);
	         if(count ==0){
	            dto.setNo(1);
	         }else{
	            dto=(boardVO)sqlMapClientTemplate.queryForObject("selectLast", null);
	         }
	         String file_name = "file_" +(Integer)dto.getNum();  //file_name = file_+ 번호 (위에지정한) 
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
      System.out.println("실행되고 있나");
      return "/tvlog/postView.jsp";
   }

   @RequestMapping("/post/search.trip") //검색해서 글쓴이,제목,번호로 하였을때 파인드를 넘기고 파인드를 넘긴값을 집어넣어서 해당되는 것들을 뿌려준다. 
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
          
          System.out.println("no이프문__"+find);
             list = sqlMapClientTemplate.queryForList("post.rjator",find);    
       
       }else if(select.equals("subject")){
          System.out.println("subject이프문__"+find);
             list = sqlMapClientTemplate.queryForList("post.rjator1",find);
          
       }else{
          System.out.println("writer이프문__"+find);
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
	   System.out.println("딜리트"+dto.getNo());
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
      System.out.println("커런트 페이지"+currentPage);
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
	  System.out.println("모디파이넘버="+dto.getNo());
	  System.out.println("모디파이넘버="+no);
	  
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
         filelist = sqlMapClientTemplate.queryForList("selectFile2", dto.getNo()); //파일 db에서 no값이 같은 것들 골라내서 list에 담는다
        System.out.println("리얼패스 경로1"+fileUploadPath);

        
 
         if(filelist != null){
            for(int i = 0; i<filelist.size(); i++){
               PostDTO pdto = filelist.get(i);
              
               String delete_name= "file_"+pdto.getNum();
               String delete_ext = filelist.get(i).getFile_savname().substring(filelist.get(i).getFile_savname().lastIndexOf('.') + 1,filelist.get(i).getFile_savname().length());
               File deleteFile=new File(fileUploadPath +"//"+ delete_name+ "." +delete_ext);
               deleteFile.delete();
               int num = filelist.get(i).getNum();
           
           //   if(pdto.getNo() > 0){ //if로 묶지 않으면 그냥 모두 삭제가 되기에
               sqlMapClientTemplate.delete("modifyDelete", num);
              
        //    }
            }
         }
         ///////////////////////////////////////////////////////////
         //delete 되고  maxno가져오니까 file_name이 이전꺼로 들어가기때문에 dto_getAno 받아오는 쿼리문 딜리트 전으로 올려서 해주고
         //나오면 file사이즈만큼 +1,+2,+3 되게 연산해야됨.

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
            System.out.println("리얼패스 경로2"+fileUploadPath);
             try {
                 file.transferTo(destFile);
              }catch (Exception e) {
                 e.printStackTrace();
              }
      
           dto.setFile_orgname(file.getOriginalFilename());      
           dto.setFile_savname(file_name + "." + file_ext);
           dto.setNo(no);
           
           if(file.getOriginalFilename().length() > 0){//파일이 있을 경우만 들어감
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
       System.out.println("다운로드 넘 값="+num);
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
		바로 다른 메소드로 이어지도록 */
    	return "redirect:/post/postList.trip";
      }
      @RequestMapping("/post/commentView.trip")
      public String commnetView(boardVO dto, HttpServletRequest request, int no){
    	 System.out.println("코멘트뷰="+no);
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
    	  System.out.println("스타트코멘="+no);
    	  return "/postboard/commentView.jsp";
      }
     
      @RequestMapping("/post/deleteComment.trip")
      public String deleteComment(boardVO dto){
    	  sqlMapClientTemplate.delete("post.deleteComment", dto);
    	  return "redirect:/post/postList.trip";
      }
      
      
   
}