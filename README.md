# http the definitive guide

<h4>2018-07-16</h4>
<hr/>

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



<h4>2018-07-17</h4>
<hr/>

1. proxy는 주로 보안을 위해 사용되며 요청과 응답을 필터링한다.
2. 캐시는 사본을 저장하는 것으로, 속도의 향상, 프라이버시를 보호하는 역할을 맡는다.
3. 게이트웨이는 다른 서버들의 중개자로 동작하는 특별한 서버이며, HTTP 트래픽을 다른 프로토콜로 변환하기 위해 사용된다.
4. 예를 들어 HTTP/FTP 게이트웨이는 FTP URI에 대한 HTTP요청을 받아들인 뒤, FTP Server로부터 FTP로 문서를 가져온다.
5. HTTP/SSL 터널은 HTTP 요청을 받아들여 목적지의 주소와 포트번호로 커넥션을 맺는다.

````
<scheme>://<user-name>:<password>@<host>:<port>/<path>;<parameter>?<query>#<fragment>
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
18. extension-method: LOCK, MKCOL, COPY, MOVE (syncronized한 문서 접근제한, 사용자가 문서 생성, 서버의 리소스를 복사, 서버의 리소스를 옮긴다.)


<h4>2018-07-22</h4>
<hr/>

1. 주관적으로 중요하다고 생각하는 상태코드

|  <center>status code</center> |  <center>reason phase</center> |  <center>meaning</center> |
|:--------|:--------:|:--------:|
|<center>100</center>| <center>continue</center> |<center>요청의 일부가 받아들여졌지만, 클라이언트는 나머지를 계속 이어서 보낼 것이다.</center> |
|<center>101</center>| <center>switching protocols</center> |<center>클라이언트가 Upgrade 헤더에 나열한 것 중 하나로 서버가 프로토콜을 바꾸었음.</center> |

 continue의 의미는 서버에 엔티티 본문을 전송하기 전에 그 엔티티 본문을 서버가 받아들 일것인지 확인하려고 할 때, 그 확인 작업을 최적화하기 위한 의도로 도입된 것이다. 예를 들어 서버가 다루거나 사용할 수 없는 큰 엔티티를 서버에게 보내지 않기 위한 목적으로 사용한다.</br>
클라이언트는 100 Continue응답을 기다리겠다면, 값을 100 continue로하는 Expect 요청 헤더를 보낼 필요가 있다.</br>
서버는 100응답을 받을 것을 의도하지 않은 클라이언트에게 100 continue 응답을 보내서는 안되며, 서버가 응답을 보낼 기회를 갖기 전에 어떤 이유로 인해 엔티티의 일부를 수신했다면, 100 continue 코드를 보낼 필요가 없다. 또한 에러 등의 이유로 엔티티를 읽기 전에 요청을 끝내기로 결정했다면, 서버는 연결을 닫아서는 안된다. 그 이유는 클라이언트가 응답을 받을 수 없게 되기 때문이다. </br>

|  <center>status code</center> |  <center>reason phase</center> |  <center>meaning</center> |
|:--------|:--------:|:--------:|
|<center>201</center>| <center>created</center> |<center>서버 개체를 생성하라는 요청을 위한 것, 생성된 리소스에 대한 구체적인 참조가 담긴 Location 헤더와 함께 그 리소스를 참조할 수 있는 여러 URL을 엔티티 본문에 포함해야한다.</center> |
|<center>202</center>| <center>accepted</center> |<center>요청을 받았다, 하지만 그에 대한 어떠한 동작도 수행하지 않은 상태를 나타낸다.</center> |
|<center>203</center>| <center>non-authoritative infomation</center> |<center>원래 서버가 아닌, 중개자의 리소스를 반환했다. 다만 리소스에 대한 메타 정보를 검증하지 못했다.</center> |
|<center>204</center>| <center>no content</center> |<center>헤더와 상태줄을 포함하지만 본문은 포함하지 않는다. 주로 폼을 리프레시할 때 사용한다.</center> |
|<center>205</center>| <center>reset content</center> |<center>HTML form에 채워진 모든 값을 비워라.</center> |
|<center>206</center>| <center>partical content</center> |<center>부분 혹은 범위 요청이 성공했다. 나중에 이어서 요청할 수 있다. 206 응답에서는 Content-Range와 Date 헤더를 포함해야하며, Etag와 Content-Location 중 하나의 헤더도 포함해야 한다.</center> |

</br>

|  <center>status code</center> |  <center>reason phase</center> |  <center>meaning</center> |
|:--------|:--------:|:--------:|
|<center>300</center>| <center>multiple choices</center> |<center>클라이언트가 동시에 여러 리소스를 가리키는 URL을 요청한 경우 그 리소스의 목록과 함께 반환</center> |
|<center>301</center>| <center>moved permanently</center> |<center>요청한 URL이 옮겨졌을 때 사용한다. Must include Location header.</center> |
|<center>302</center>| <center>found</center> |<center>301과 같으나  클라이언트는 Location 헤더로 주어진 URL을 리로스를 임시로 가리키기 위한 목적으로 사용해야 한다.</center> |
|<center>303</center>| <center>see other</center> |<center>301과 같으나 주목적은 POST 요청에 대한 응답으로 클라이언트에게 리소스의 위치를 알려주는 것이다.</center> |
|<center>304</center>| <center>not modified</center> |<center>이 상태코드를 동반한 응답은 엔티티 본문을 가져서는 안된다.</center> |
|<center>305</center>| <center>use proxy</center> |<center>리소스가 반드시 프락시를 통해 접근 되어야함, Location 헤더에는 프락시의 위치를 포함한다.</center> |
|<center>307</center>| <center>temporary Redirect</center> |<center>302와 완전히 동일하다.</center> |

302, 303, 307은 HTTP/1.0과 HTTP/1.1의 상태코드를 다루는 방식의 차이점 때문에 같은 기능을 가지면서 다른 코드를 갖는다. </br>
1.0에서는 302만을 이용해 POST 요청이 들어오면 GET으로 redirect를 하면 된다.</br>
1.1에서는 일시적인 redirect를 위해 302 대신에 307을 사용하고, 303을 이용해 1.0의 302 redirect를 수행한다.


|  <center>status code</center> |  <center>reason phase</center> |  <center>meaning</center> |
|:--------|:--------:|:--------:|
|<center>400</center>| <center>bad request</center> |<center>클라이언트가 잘못된 요청을 보냈다.</center> |
|<center>401</center>| <center>unauthorized</center> |<center>인증을 요구한다.</center> |
|<center>403</center>| <center>forbidden</center> |<center>서버에의해 리소스의 사용이 금지되었다.</center> |
|<center>404</center>| <center>not found</center> |<center>URL을 찾을 수 없다.</center> |
|<center>405</center>| <center>method not allowed</center> |<center>지원하지 않는 메서드로 요청을 받았을 때 사용한다.</center> |
|<center>406</center>| <center>not acceptable</center> |<center>주어진 URL에 대한 리소스 중 클라이언트가 받아들일 수 있는 것이 없는 경우에 사용한다.</center> |
|<center>407</center>| <center>proxy authentication required</center> |<center>인증에 대한 요구로 proxy server를 위한 것이다.</center> |
|<center>410</center>| <center>gone</center> |<center>404와 같지만, 이전에는 그 리소스를 가지고 있었다.</center> |
|<center>413</center>| <center>request entity too large</center> |<center>엔티티의 크기를 넘겼을 때 사용한다.</center> |
|<center>415</center>| <center>unsupported media type</center> |<center>서버가 인식할 수 없는 미디어 타입의 내용을 보냈을 때 사용한다.</center> |
|<center>416</center>| <center>requested range not satisfiable</center> |<center>잘못된 범위요청을 한 경우에 사용한다.</center> |
|<center>417</center>| <center>expectation failed</center> |<center>요청에 포함된 Expect 요청 헤더에 서버가 만족시킬 수없는 기대가 담겨 있는 경우에 사용한다.</center> |

</br>

|  <center>status code</center> |  <center>reason phase</center> |  <center>meaning</center> |
|:--------|:--------:|:--------:|
|<center>500</center>| <center>interal server error</center> |<center>서버가 요청을 처리할 수 없게 만드는 에러를 만났을 때 사용한다.</center> |
|<center>501</center>| <center>not implemented</center> |<center>클라이언트가 서버의 능력을 넘은 요청을 했을 때 사용한다.(예: 서버가 지원하지 않는 메서드를 사용)</center> |
|<center>502</center>| <center>bad gateway</center> |<center>프락시나 게이트웨이처럼 행동하는 서버가 그 요청응답 연쇄에 있는 다음 링크로부터 가짜 응답에 맞닥뜨렸을 때 사용한다.(예: 만약 자신의 부모 게이트웨이에 접속하는 것이 불가능 할 때)</center> |
|<center>503</center>| <center>service unavailable</center> |<center>요청을 처리할 수는 없지만, 나중에는 가능할 것이다. retry-after 헤더를 이용하여 사용가능한 때를 전달할 수 있다.</center> |
|<center>504</center>| <center>gateway timeout</center> |<center>408과 비슷하지만 프록시나 게이트웨에서 온 응답이다.</center> |
|<center>505</center>| <center>HTTP version not supported</center> |<center>프로토콜을 지원하지 않는 경우에 사용한다.</center> |

</br>

2. 헤더의 종류로는 일반 헤더, 요청 헤더, 응답 헤더, 엔티티 헤더, 확장 헤더가 있다.
3. 일반 헤더의 Connection 헤더는 클라이언트와 서버가 요청/응답 연결에 대한 옵션을 정할 수 있다. (keep-alive)
4. 조건부 요청 헤더의 if-none-match 헤더를 이용하면 304요청을 받을 수 있다.

<br>

5. HTTP는 TCP 위에서 동작하기 때문에, TCP 성능에 영향을 많이 받는다.
6. TCP 커넥션은 ````<발신지 IP, 발신지 port, 수신지 IP, 수신지 port>````로 식별한다.
7. 대부분의 HTTP지연은 TCP 네트워크 지연 때문에 발생한다. (단, 클라이언트나 서버가 너무 많은 데이터를 내려받거나 복잡하고 동적인 자원들을 실행하지 않는다는 가정에서)
8. DNS resolution에 수십초의 시간이 걸린다. 현재는 인터넷 인프라의 발전으로 대부분 밀리초 단위로 DNS resolution이 끝난다. 또한 DNS 캐시기능으로 순간으로 처리가 가능하다.
9. HTTP 트랜잭션이 작은 데이터를 주고 받는 경우 트랜잭션의 50% 이상의 시간을 TCP를 구성하는데 쓴다.
10. TCP는 신뢰성있는 전송을 목적으로하기 때문에 응답에 대한 확인을 보낸다, 하지만 이 것이 성능의 저하를 야기할 수 있다.
11. OS에 따라 다르지만 확인 응답 지연 관련 기능을 수정하거나 비활성할 수 있다.
12. TCP는 특성상 slow start를 실행한다. 그 이유는 네트워크의 혼잡을 제어하기 위해서이다.
13. Nagle 알고리즘은 TCP의 데이터를 한 개의 덩어리로 합쳐서 보내려는 알고리즘이다. 세그먼트가 최대 크기에 도달하지 않으면 전송하지 않는다. 다만 모든 패킷이 확인 응답을 받았응 경우, 크기에 도달하지 않아도 전송을 허락한다.Nagle 알고리즘은 확인 응답이 도착할 때까지 전송을 하지 않기 때문에 성능의 하락을 가져온다.
14. HTTP 어플리케이션은 성능 향상을 위해서 ````HTTP 스택에 TCP_NODELAY 파라미터 값````을 설정하여 네이글 알고리즘을 비활성하기도 한다.
15. 순차적인 트랜잭션 처리에 의한 지연을 최적화하기 위한 방법으로는 ````parallel connection````, ````persistent connection````, ````pipelinend conncetion````, ````multiplexed connection```` 등이 있다.
16. parallel connection은 HTML 문서 안의 여러 리소스에 대한 요청을 병렬적으로 요청하는 방식이다. 하지만 제한된 대역폭에서는 빠르지 않다. 또한 다수의 커넥션은 메모리를 많이 소모하고 자체적인 성능 문제를 발생시킨다.
17. persistent connection은 TCP의 slow start로 인한 지연을 없애기 위한 connction이다. 
18. 병렬의 단점은 다음과 같다.</br>
 - 각 트랜잭션마다 새로운 커넥션을 맺고 끊기 때문에 시간과 대역폭이 소요된다.
 - 각각의 새로운 커넥션은 TCP slow start로 인해 성능이 떨어진다.
 - 실제로 연결할 수있는 병렬 커넥션의 수는 제한 되어있다.</br>
19. 따라서 parallel + persistent가 함께 사용될 때 가장 효과적이다.
20. persistent connection에서 발생할 수 있는 문제점은 HTTP/1.0+의 keep-alive  커넥션이다. dumb proxy에 의해 proxy server와 server 사이에 persistent connection이 이루어질 수 있다. 따라서 1.1에서는 connction:close라는 방법을 사용한다.
21. persistent connection을 통해서 요청을 파이프라이닝 할 수 있다. 즉 한 커넥션 안에서 요청을 pipelining 한다는 것이다.
22. 단점은 HTTP메시지는 순서가 없기 때문에 응답이 순서 없이 오면 순서에 맞게 정렬시킬 방법이 없다.
23. 따라서 non-idempotent (비멱등) 요청의 경우 문제가 생길 수 있다.
24. 왜 POST는 non-idempotent하고 나머지는 idempotent 한가? [PUT 및 DELETE 요청은 사이트의 코드에서 POST와 다르게 처리되거나 처리되지 않을 수 있습니다.]
25. close의 경우 connection 전체 끊기, shutdown의 경우 connection 반만 끊기
