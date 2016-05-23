package trip.post;

public class pagingAction {

   private int currentPage;   // ?˜„?¬?˜?´ì§?
   private int totalCount;    // ? „ì²? ê²Œì‹œë¬? ?ˆ˜
   private int totalPage;    // ? „ì²? ?˜?´ì§? ?ˆ˜
   private int blockCount;    // ?•œ ?˜?´ì§??˜  ê²Œì‹œë¬¼ì˜ ?ˆ˜
   private int blockPage;    // ?•œ ?™”ë©´ì— ë³´ì—¬ì¤? ?˜?´ì§? ?ˆ˜
   private int startCount;    // ?•œ ?˜?´ì§??—?„œ ë³´ì—¬ì¤? ê²Œì‹œê¸??˜ ?‹œ?‘ ë²ˆí˜¸
   private int endCount;    // ?•œ ?˜?´ì§??—?„œ ë³´ì—¬ì¤? ê²Œì‹œê¸??˜ ? ë²ˆí˜¸
   private int startPage;    // ?‹œ?‘ ?˜?´ì§?
   private int endPage;    // ë§ˆì?ë§? ?˜?´ì§?

   private StringBuffer pagingHtml;

   // ?˜?´ì§? ?ƒ?„±?
   public pagingAction(int currentPage, int totalCount, int blockCount,
         int blockPage) {

      this.blockCount = blockCount;
      this.blockPage = blockPage;
      this.currentPage = currentPage;
      this.totalCount = totalCount;

      // ? „ì²? ?˜?´ì§? ?ˆ˜
      totalPage = (int) Math.ceil((double) totalCount / blockCount);
      if (totalPage == 0) {
         totalPage = 1;
      }

      // ?˜„?¬ ?˜?´ì§?ê°? ? „ì²? ?˜?´ì§? ?ˆ˜ë³´ë‹¤ ?¬ë©? ? „ì²? ?˜?´ì§? ?ˆ˜ë¡? ?„¤? •
      if (currentPage > totalPage) {
         currentPage = totalPage;
      }

      // ?˜„?¬ ?˜?´ì§??˜ ì²˜ìŒê³? ë§ˆì?ë§? ê¸??˜ ë²ˆí˜¸ ê°?? ¸?˜¤ê¸?.
      startCount = (currentPage - 1) * blockCount;
      endCount = startCount + blockCount - 1;

      // ?‹œ?‘ ?˜?´ì§??? ë§ˆì?ë§? ?˜?´ì§? ê°? êµ¬í•˜ê¸?.
      startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
      endPage = startPage + blockPage - 1;

      // ë§ˆì?ë§? ?˜?´ì§?ê°? ? „ì²? ?˜?´ì§? ?ˆ˜ë³´ë‹¤ ?¬ë©? ? „ì²? ?˜?´ì§? ?ˆ˜ë¡? ?„¤? •
      if (endPage > totalPage) {
         endPage = totalPage;
      }

      // ?´? „ block ?˜?´ì§?
      pagingHtml = new StringBuffer();
      if (currentPage > blockPage) {
         pagingHtml.append("<a href=postList.trip?currentPage="
               + (startPage - 1) + ">");
         pagingHtml.append("?´? „");
         pagingHtml.append("</a>");
      }

      pagingHtml.append("&nbsp;|&nbsp;");

      //?˜?´ì§? ë²ˆí˜¸.?˜„?¬ ?˜?´ì§??Š” ë¹¨ê°„?ƒ‰?œ¼ë¡? ê°•ì¡°?•˜ê³? ë§í¬ë¥? ? œê±?.
      for (int i = startPage; i <= endPage; i++) {
         if (i > totalPage) {
            break;
         }
         if (i == currentPage) {
            pagingHtml.append("&nbsp;<b> <font color='red'>");
            pagingHtml.append(i);
            pagingHtml.append("</font></b>");
         } else {
            pagingHtml
                  .append("&nbsp;<a href='postList.trip?currentPage=");
            pagingHtml.append(i);
            pagingHtml.append("'>");
            pagingHtml.append(i);
            pagingHtml.append("</a>");
         }

         pagingHtml.append("&nbsp;");
      }

      pagingHtml.append("&nbsp;&nbsp;|&nbsp;&nbsp;");

      // ?‹¤?Œ block ?˜?´ì§?
      if (totalPage - startPage >= blockPage) {
         pagingHtml.append("<a href=postList.trip?currentPage="
               + (endPage + 1) + ">");
         pagingHtml.append("?‹¤?Œ");
         pagingHtml.append("</a>");
      }
   }

   public int getCurrentPage() {
      return currentPage;
   }

   public void setCurrentPage(int currentPage) {
      this.currentPage = currentPage;
   }

   public int getTotalCount() {
      return totalCount;
   }

   public void setTotalCount(int totalCount) {
      this.totalCount = totalCount;
   }

   public int getTotalPage() {
      return totalPage;
   }

   public void setTotalPage(int totalPage) {
      this.totalPage = totalPage;
   }

   public int getBlockCount() {
      return blockCount;
   }

   public void setBlockCount(int blockCount) {
      this.blockCount = blockCount;
   }

   public int getBlockPage() {
      return blockPage;
   }

   public void setBlockPage(int blockPage) {
      this.blockPage = blockPage;
   }

   public int getStartCount() {
      return startCount;
   }

   public void setStartCount(int startCount) {
      this.startCount = startCount;
   }

   public int getEndCount() {
      return endCount;
   }

   public void setEndCount(int endCount) {
      this.endCount = endCount;
   }

   public int getStartPage() {
      return startPage;
   }

   public void setStartPage(int startPage) {
      this.startPage = startPage;
   }

   public int getEndPage() {
      return endPage;
   }

   public void setEndPage(int endPage) {
      this.endPage = endPage;
   }

   public StringBuffer getPagingHtml() {
      return pagingHtml;
   }

   public void setPagingHtml(StringBuffer pagingHtml) {
      this.pagingHtml = pagingHtml;
   }
}