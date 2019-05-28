## GoogleMap javascript API 

좌표뿌리기/ 누르면 해당페이지 이동 기능 등

https://developers.google.com/maps/documentation/javascript/get-api-key

-- youtube link
https://www.youtube.com/watch?v=dPNqI42CiaI

```jsp
 <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD22gGuJambID4g4M2bHWgxOCmWCArzTzM&callback=initMap">
    </script>
```

### 웹 사이트에 마커가있는 Google지도 추가

<script async="" defer="" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD22gGuJambID4g4M2bHWgxOCmWCArzTzM&amp;callback=initMap">
</script>

는 여러 스크립트를 자동으로 호출하고 호출된 후, initMap호출(callback)한다.

* lat, lang을 DB에서 가져와서 ~

* ​                     param에서 가져와서~ 

#### 마커추가

#### 말풍선 추가

#### 이벤트 등록 및 처리

클릭시 모달창 띄우기 + Ajax 처리 및 DB 저장 + 모달 닫기

#### 클러스터링



poliline, 거리계산 등 다양한 기능

<https://developers.google.com/maps/documentation/javascript/tutorial>  튜토리얼참고

내일..

DB연동.. 지역 저장 ->

                 지역 뿌리기  <-