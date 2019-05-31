## 파일업로드

자카르타프로젝트나 서블릿3의 라이브러리를 사용하지 않는 방법

<http://www.servlets.com/cos/> 하단의 [**cos-20.08.zip**](http://www.servlets.com/cos/cos-20.08.zip)

에서 cos.jar 파일 lib 에 위치

form태그의 method = "post" enctype="multipart/form-data" 설정 후, request 객체로 parameter 값을 얻어올 수 없다.

 enctype="multipart/form-data" : 스트림(Stream)방식으로 데이터 전송한다는 의미

ex01_02.jsp의 파일명, 파일내용으로 서버에 새로운 파일을 생성하면 업로드 되는것 

-> 라이브러리 사용 

```jsp
//cos.jar의 MultipartRequest 사용
MultipartRequest mrequest 
= new MultipartRequest(request, saveDirectory
		, maxPostSize, encoding, policy); 
```





파일삭제 - db정보 삭제 + 실제 FileSystem 경로에 위치한 파일 삭제하는 자바코딩



++ drag drop / 동적 태그 생성 / ajax(프로필사진 변경) / 펼쳐지는것 막기

