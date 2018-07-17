# http the definitive guide


1. 그 어떤 것이라도 리소스가 될 수 있다. (image, text, html, video, spread shit, web gateway, search engine, ...)
2. HTTP/1.0 부터 MIME(Multipurpose Internet Mail Extensions)를 기술하고 라벨을 붙이기 위해 채택 되었다. (ex, image/jpeg)

3. URI(Uniform resource identifier)는 정보 리소스를 고유하게 실벽하고 위치를 지정할 수 있는 것이다.
4. URI에는 URL과 URN이 있다.
5. URL(locator)은 흔히 우리가 아는 Path로 형태로 표현된 URI이다.
6. URN(name)은 컨텐츠를 이루는 한 리소스에 대해, 위치에 관계 없이 유일무이한 이름만으로 접근이 가능한 URI이다.

7. HTTP의 트랜잭션은 요청과, 응답으로 구성된다.
8. HTTP 요청메시지는 명령과 URI를 포함하고, HTTP 응답메시지는 트랜잭션의 결과를 포함한다.
9. 헤더의 마지막은 빈줄이다.
10. body에는 임의의 이진 데이터를 포함할 수 있다.(이미지, 비디오, 오디오, 소프트웨어)

텔넷 실행해보기

````
telnet www.joes-hardware.com 80

...

GET /tools.html HTTP/1.1
Host: www.joes-hardware.com

....
````

11. 텔넷은 HTTP 클라이언트는 잘 흉내 내지만 서버로서는 변변치 않다.
12. 보다 유연한 도구로, nc를 사용하자.

HTTP 버전

13. HTTP/0.9는 1991년에 만들어졌다. 오직 GET만 지원되고, MIME 타입이나, 헤더, 버전 번호는 지원하지 않는다.
14. HTTP/1.0은 버전번호, 헤더, 추가 메소드, MIME 타입 등을 추가 했으나 잘 동작하는 용례들을 모아 놓은 것이다.
15. HTTP/1.0+는 keep-alive 커넥션이 추가 되었고, 가상 호스팅, 프락시, 연결 지원 등 많은 표준들이 추가되었다.
16. HTTP/2.0은 추후에 업데이트 하겠다.

17. 프락시: 클라이언트와 서버 사이에 위치한 HTTP 중개자.
18. 캐시: 많이 찾는 웹페이지를 클라이언트 가까이에 보관하는 HTTP 창고.
19. 터널: 단순히 HTTP 통신을 전달하기만 하는 특별한 프락시.
20. 에이전트: 자동화된 HTTP 요청을 만드는 준지능적 웹클라이언트.



2018-07-17

1. proxy는 주로 보안을 위해 사용되며 요청과 응답을 필터링한다.
2. 캐시는 사본을 저장하는 것으로, 속도의 향상, 프라이버시를 보호하는 역할을 맡는다.
3. 게이트웨이는 다른 서버들의 중개자로 동작하는 특별한 서버이며, HTTP 트래픽을 다른 프로토콜로 변환하기 위해 사용된다.
4. 예를 들어 HTTP/FTP 게이트웨이는 FTP URI에 대한 HTTP요청을 받아들인 뒤, FTP Server로부터 FTP로 문서를 가져온다.
5. HTTP/SSL 터널은 HTTP 요청을 받아들여 목적지의 주소와 포트번호로 커넥션을 맺는다.

````
<schem>://<user-name>:<password>@<host>:<port>/<path>;<parameter>?<query>#<fragment>
````

6. 스킴은 사용할 프로토콜을 말한다.
7. 파라미터는 리소스에 접근하는데 필요한 어떤 추가 정보든 전달할 수 있다. (ftp://prep.ai.mit.edu/pub/gnu;type=d)

8. base url은 상대 url의 기준이 되는 url.
9. 인코딩 체계는 안전하지 않은 문자를 %로 시작해 ASCII 코드로 표현되는 두 개의 16진수 숫자로 이루어진 '이스케이프' 문자로 바꾼다.

10. 원 서버로 향하는 메시지를 인바운드, 에이전트로 돌아오는 것을 아웃바운드 메시지라고 한다.
11. 모든 메시지는 다운 스트림으로 흐른다. (업스트림, 다운스트림은 발송자와 수신자에 대한 것임.)
12. 사유구절 (reason phrase)는 오로지 사람에게 읽히기 위한 목적. (200 NOT OK --> 성공)

13. HEADER는 항상 \r\n으로 끝난다.
14. HTTP/1.0 이전에는 요청줄에 버전이 들어있을 필요가 없었다.


OPTIONS Request 보내보기

![image](https://user-images.githubusercontent.com/24931420/42819878-bc216a02-8a0f-11e8-89c6-fba59ec653fd.png)

물론 잘 안된다..... 

15. safe method -> GET, HEAD 하지만 안전한 메소드가 서버에 작용을 유발하지 않는다는 보장은 없다.(개발자가 개발하면 그렇게 되기 때문에)
16. HEAD method로 할 수 있는 일은? 리소스의 타입을 확인, 개체 존재 여부 확인, 리소스 변경 여부 확인.
17. TRACE method는 서버에 도착하면 응답의 res body에 req header를 넣어준다. (via: 1.1 proxy3.company.com)
