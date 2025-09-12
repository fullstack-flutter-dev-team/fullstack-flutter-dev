<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<%!
String COLOR_RED      = "\u001B[31m" ;
String COLOR_GREEN    = "\u001B[32m" ;
String COLOR_YELLOW   = "\u001B[33m" ;
String COLOR_BLUE     = "\u001B[34m" ;
%>

<%
    // JsonTest02ok.jsp
    
    String name = request.getParameter("name");
    String content = request.getParameter("content");
    
    // 반환해줄 쿼리 스트링
    String result = "";
    
    // * JSON 데이터(배열)
    /*
        [ {"이름1":"값1", "이름2":"값2", ...}
          ,{"이름1":"값1", "이름2":"값2", ...}
          ,{"이름1":"값1", "이름2":"값2", ...}
        ]
         

         1
         {"num":"1", "name":"김한국1", "content":"안녕하세요.1"}
         {"num":"2", "name":"김한국2", "content":"안녕하세요.2"}
         {"num":"3", "name":"김한국3", "content":"안녕하세요.3"}
         {"num":"4", "name":"김한국4", "content":"안녕하세요.4"}
         {"num":"5", "name":"김한국5", "content":"안녕하세요.5"}

         {"num":"1", "name":"김한국1", "content":"안녕하세요.1"},  『,』(컴마) 추가
         {"num":"2", "name":"김한국2", "content":"안녕하세요.2"},
         {"num":"3", "name":"김한국3", "content":"안녕하세요.3"},
         {"num":"4", "name":"김한국4", "content":"안녕하세요.4"},
         {"num":"5", "name":"김한국5", "content":"안녕하세요.5"},

         {"num":"1", "name":"김한국1", "content":"안녕하세요.1"},
         {"num":"2", "name":"김한국2", "content":"안녕하세요.2"},
         {"num":"3", "name":"김한국3", "content":"안녕하세요.3"},
         {"num":"4", "name":"김한국4", "content":"안녕하세요.4"},
         {"num":"5", "name":"김한국5", "content":"안녕하세요.5"}    마지막 컴마 제거

        [
         {"num":"1", "name":"김한국1", "content":"안녕하세요.1"},
         {"num":"2", "name":"김한국2", "content":"안녕하세요.2"},
         {"num":"3", "name":"김한국3", "content":"안녕하세요.3"},
         {"num":"4", "name":"김한국4", "content":"안녕하세요.4"},
         {"num":"5", "name":"김한국5", "content":"안녕하세요.5"}]    [] 에 삽입
         
    */


    for (int i=1; i<=5; i++) {  //-- i : 1 ~ 5
        StringBuilder sb = new StringBuilder();
        sb.append("{\"num\":\"" + i + "\"");
        sb.append(",\"name\":\"" + name + i + "\"");
        sb.append(",\"content\":\"" + content + i + "\"},"); //-- check~!!!! 『,』

        result += sb.toString();
    }

    // 마지막 컴마 제거
    result = result.substring(0, result.length()-1);

    // JSON 배쳘 객체 구성
    result = "[" + result + "]";
    out.println(result);

%>
