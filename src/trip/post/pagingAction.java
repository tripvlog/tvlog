package trip.post;

public class pagingAction {

   private int currentPage;   // ?��?��?��?���?
   private int totalCount;    // ?���? 게시�? ?��
   private int totalPage;    // ?���? ?��?���? ?��
   private int blockCount;    // ?�� ?��?���??��  게시물의 ?��
   private int blockPage;    // ?�� ?��면에 보여�? ?��?���? ?��
   private int startCount;    // ?�� ?��?���??��?�� 보여�? 게시�??�� ?��?�� 번호
   private int endCount;    // ?�� ?��?���??��?�� 보여�? 게시�??�� ?�� 번호
   private int startPage;    // ?��?�� ?��?���?
   private int endPage;    // 마�?�? ?��?���?

   private StringBuffer pagingHtml;

   // ?��?���? ?��?��?��
   public pagingAction(int currentPage, int totalCount, int blockCount,
         int blockPage) {

      this.blockCount = blockCount;
      this.blockPage = blockPage;
      this.currentPage = currentPage;
      this.totalCount = totalCount;

      // ?���? ?��?���? ?��
      totalPage = (int) Math.ceil((double) totalCount / blockCount);
      if (totalPage == 0) {
         totalPage = 1;
      }

      // ?��?�� ?��?���?�? ?���? ?��?���? ?��보다 ?���? ?���? ?��?���? ?���? ?��?��
      if (currentPage > totalPage) {
         currentPage = totalPage;
      }

      // ?��?�� ?��?���??�� 처음�? 마�?�? �??�� 번호 �??��?���?.
      startCount = (currentPage - 1) * blockCount;
      endCount = startCount + blockCount - 1;

      // ?��?�� ?��?���??? 마�?�? ?��?���? �? 구하�?.
      startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
      endPage = startPage + blockPage - 1;

      // 마�?�? ?��?���?�? ?���? ?��?���? ?��보다 ?���? ?���? ?��?���? ?���? ?��?��
      if (endPage > totalPage) {
         endPage = totalPage;
      }

      // ?��?�� block ?��?���?
      pagingHtml = new StringBuffer();
      if (currentPage > blockPage) {
         pagingHtml.append("<a href=postList.trip?currentPage="
               + (startPage - 1) + ">");
         pagingHtml.append("?��?��");
         pagingHtml.append("</a>");
      }

      pagingHtml.append("&nbsp;|&nbsp;");

      //?��?���? 번호.?��?�� ?��?���??�� 빨간?��?���? 강조?���? 링크�? ?���?.
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

      // ?��?�� block ?��?���?
      if (totalPage - startPage >= blockPage) {
         pagingHtml.append("<a href=postList.trip?currentPage="
               + (endPage + 1) + ">");
         pagingHtml.append("?��?��");
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