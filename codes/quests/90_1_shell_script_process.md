## **✅ 문제 : 간단한 서버 관리 스크립트 작성**

### **🔧 요구사항**

* `start`: 포트 8000에서 `http.server`를 백그라운드로 실행 (`nohup`, 로그는 `server.log`)

* `stop`: 실행 중인 프로세스를 찾아 종료

* `status`: 프로세스가 실행 중인지 확인하여 출력

* `restart`: 중지 후 다시 실행

  ### **🎯 실행 예시**

  $ ./webserver.sh start  
  서버가 백그라운드에서 시작되었습니다.  
    
  $ ./webserver.sh status  
  서버 실행 중입니다. PID: 13579  
    
  $ ./webserver.sh stop  
  서버가 종료되었습니다.  
    
  $ ./[webserver.sh](http://webserver.sh) tail\_log  
  … log message 확인


문제 모두 조건에 따라:

* `if [ "$1" == "start" ]` 식으로 흐름 제어

* 변수 `PORT`, `PID`, `LOGFILE` 등을 정의해 구성 가능

```bash
if [ $1 == "start" ]; then
        nohup python3 -m http.server 8000 --bind 0.0.0.0 &>> view.log
elif [ $1 == "stop" ]; then
        PID_V=$(ps aux | grep "http.server 8000 --bind" | cut -d" " -f6 | head -n 1)
        kill -9 "$PID_V"

elif [ $1 == "status" ]; then
        PID_V=$(ps aux | grep "http.server 8000 --bind" | cut -d" " -f6 | head -n 1)
        echo "서버 실행중입니다"
        
elif [ $1 == "tail_log" ]; then
        cat view.log
else
        echo "No such argument"
fi
```
```bash
#start
[doyoung@192.168.0.46 ~/Downloads]$ . webserver.sh start
[doyoung@192.168.0.46 ~/Downloads]$ ps aux | grep "http.server 8000"
doyoung     5172  0.0  1.0 242444 18560 pts/0    S+   14:12   0:00 python3 -m http.server 8000 --bind 0.0.0.0

#stop
[doyoung@192.168.0.46 ~/Downloads]$ . webserver.sh stop
[doyoung@192.168.0.46 ~/Downloads]$ ps aux | grep "http.server 8000"
doyoung     5473  0.0  0.1 221804  2176 pts/1    S+   14:22   0:00 grep --color=auto http.server 8000

#status
[doyoung@192.168.0.46 ~/Downloads]$ . webserver.sh status
서버 실행중입니다. PID = 5488

#tail_log
[doyoung@192.168.0.46 ~/Downloads]$ curl 192.168.0.46:8000
[doyoung@192.168.0.46 ~/Downloads]$ . webserver.sh tail_log
nohup: ignoring input
192.168.0.46 - - [28/Jul/2025 14:31:10] "GET / HTTP/1.1" 200 -
```
