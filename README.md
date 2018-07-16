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


