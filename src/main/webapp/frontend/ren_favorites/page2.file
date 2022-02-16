<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <%if (rowsPerPage<rowNumber) {%>
    <%if(pageIndex>=rowsPerPage){%>
        <A href="<%=request.getRequestURI()%>?whichPage=1">至第一頁</A>&nbsp;
        <A href="<%=request.getRequestURI()%>?whichPage=<%=whichPage-1%>">上一頁 </A>&nbsp;
    <%}%>
  
    <%if(pageIndex<pageIndexArray[pageNumber-1]){%>
        <A href="<%=request.getRequestURI()%>?whichPage=<%=whichPage+1%>">下一頁 </A>&nbsp;
        <A href="<%=request.getRequestURI()%>?whichPage=<%=pageNumber%>">至最後一頁</A>&nbsp;
    <%}%>
  <%}%>  

<br><br>

  <%if (pageNumber>1) {%>
    <FORM METHOD="post" ACTION="<%=request.getRequestURI()%>">   
       <select size="1" name="whichPage">
         <%for (int i=1; i<=pageNumber; i++){%>
            <option value="<%=i%>">跳至第<%=i%>頁
         <%}%> 
       </select>
       <input type="submit" value="確定" >  
    </FORM>
  <%}%>