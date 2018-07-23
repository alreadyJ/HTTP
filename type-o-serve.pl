#!/usr/bin/perl

use Socket;
use Carp;
use FileHandle;

# (1) 명령줄에서 덮어쓰지 않는 이상 8080
$port = (@ARGV ? $ARGV[0] : 8080);

# (2) 로컬 TCP 소켓 생성
$proto = getprotobyname('tcp');
socket(S, PT_INET, SOCK_STREAM, $proto) || die;
setsockopt(S, SOL_SOCKET, SO_REUSEADDR, pack("l", 1)) || die;
bind(S, sockaddr_in($port, INADDR_ANY)) || die;
listen(S, SOMAXCONN) || die;

# (3) 시작 메시지
while (1) {

	# (4) 커넥션 C를 기다린다.
	$cport_caddr = accept(C, S);
	($cport, $caddr) = sockaddr_in($cport_caddr);
	C->autoflush(1);
	
	# (5) 누구의 커넥션인가?
	$cname = gethostbyaddr($caddr, AF_INET);
	printf("    <<<Request from '%s'>>>\n", $cname);
	
	# (6) 빈줄이 나올 때까지 요청 메시지를 읽어 화면 출력
	while($line = <C>) {
		print $line;
		if ($line =~ /^\r/) { last; }
	}

	# (7) 응답 메시지를 위한 프롬프트를 만들고, 응답줄을 입력 받는다.
	# "." 만 있는 줄이 입력되기 전까지, 입력된 줄을 클라에게 보낸다.
	
	printf("    <<<Type Response Followed by '.'>>>\n");

	while($line = <STDIN>) {
		$line =~ s/\r//;
		$line =~ s/\n//;
		if ($line =~ /^\./) { last; }
		print C $line . "\r\n";
	}
	close(c);
}
