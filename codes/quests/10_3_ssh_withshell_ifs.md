# 🧪Shell 조건문 및 텍스트 처리 실습 문제
## 💻 실습 환경 설정
## 🔹 1. 실습 디렉토리 생성 및 이동
```
mkdir ~/shell_practice
cd ~/shell_practice
```
## 🔹 2. 실습용 데이터 파일 생성
- students.txt 파일 생성
```
cat > students.txt << EOF
김철수:수학:85:영어:92:과학:78
이영희:수학:95:영어:88:과학:91
박민수:수학:76:영어:79:과학:82
최지원:수학:88:영어:95:과학:89
정우진:수학:92:영어:76:과학:94
김지현:수학:83:영어:91:과학:87
이준호:수학:79:영어:84:과학:76
박서연:수학:97:영어:93:과학:96
한도윤:수학:81:영어:77:과학:83
송민재:수학:86:영어:89:과학:91
EOF
```
- server_logs.txt 파일 생성
```
cat > server_logs.txt << EOF
2024-01-15 10:30:15 INFO User login successful: user001
2024-01-15 10:31:22 ERROR Database connection failed
2024-01-15 10:32:05 INFO User login successful: user002
2024-01-15 10:33:18 WARNING Memory usage high: 85%
2024-01-15 10:34:25 ERROR Authentication failed: user003
2024-01-15 10:35:10 INFO User logout: user001
2024-01-15 10:36:33 ERROR Network timeout occurred
2024-01-15 10:37:45 INFO System backup started
2024-01-15 10:38:52 WARNING Disk space low: 90%
2024-01-15 10:39:15 ERROR Database connection failed
2024-01-15 10:40:28 INFO User login successful: user004
2024-01-15 10:41:35 ERROR Authentication failed: user005
EOF
```
- sales_data.txt 파일 생성
```
cat > sales_data.txt << EOF
2024-01,서울,노트북,1500000
2024-01,부산,스마트폰,800000
2024-01,대구,태블릿,600000
2024-01,서울,스마트폰,850000
2024-02,부산,노트북,1450000
2024-02,서울,태블릿,620000
2024-02,대구,스마트폰,780000
2024-02,서울,노트북,1520000
2024-03,부산,태블릿,590000
2024-03,대구,노트북,1480000
2024-03,서울,스마트폰,820000
2024-03,부산,스마트폰,790000
EOF
```
- words.txt 파일 생성
```cat > words.txt << EOF
apple
banana
Apple
cherry
BANANA
date
Cherry
elderberry
Apple
fig
banana
CHERRY
EOF
```

## 🧭 실습 문제
### 📁 문제 1 : 학생 성적 분석기 
- 파일 : grade_analyzer.sh
- 요구사항
```
students.txt 파일을 분석하여 다음 기능을 수행하는 스크립트 작성
사용자로부터 과목명을 입력받아 해당 과목의 통계 정보 출력
조건문을 사용하여 입력 검증 및 등급 분류 수행
```
- 구현해야 할 기능
```
사용자가 입력한 과목이 유효한지 검사 (수학, 영어, 과학)
해당 과목의 모든 점수를 추출하여 정렬된 목록 출력
최고점, 최저점, 평균점수 계산
90점 이상(A), 80점 이상(B), 70점 이상(C), 그 외(D) 등급별 학생 수 출력
평균이 85점 이상이면 "우수", 75점 이상이면 "양호", 그 외는 "보통" 출력
```
- 힌트
```
cut, grep, sort, wc 명령어 활용
파이프라인으로 명령어 연결
조건문으로 점수 범위 검사
```
```bash
# 스크립트 (4번 등급별 학생수는 수는 다 치기엔 너무 많음.. 뭔가 다른 방법이 있을 것 같음)
read -p "Enter the Subject: " subj
# 있는 과목인지 판별
if ! grep -q "$subj" ./students.txt; then
        echo "No such subjects"
        return
else
        echo "$subj is in this file."
fi
# 원하는 과목 점수 뽑아내기
if [ "$subj" = "수학" ]; then
        field=3
elif [ "$subj" = "영어" ]; then
        field=5
elif [ "$subj" = "과학" ]; then
        field=7
fi

scores=$(cut -d":" -f"$field" ./students.txt | sort -n )
scores_r=$(cut -d":" -f"$field" ./students.txt | sort -rn )
echo "$scores"

# 최소, 최대, 평균
echo "min: $(echo "$scores" | tail -n 1)"
echo "max: $(echo "$scores_r" | tail -n 1)"

line1=$(echo "$scores" | tail -n 10 | head -n 1)
line2=$(echo "$scores" | tail -n 9  | head -n 1)
line3=$(echo "$scores" | tail -n 8  | head -n 1)
line4=$(echo "$scores" | tail -n 7  | head -n 1)
line5=$(echo "$scores" | tail -n 6  | head -n 1)
line6=$(echo "$scores" | tail -n 5  | head -n 1)
line7=$(echo "$scores" | tail -n 4  | head -n 1)
line8=$(echo "$scores" | tail -n 3  | head -n 1)
line9=$(echo "$scores" | tail -n 2  | head -n 1)
line10=$(echo "$scores" | tail -n 1)

sum=$((line1 + line2 + line3 + line4 + line5 + line6 +line7 +line8 +line9 +line10))
average=$((sum / 10))

echo "average: $average"
# 학업 성취도 판정
if [ "$average" -ge 85 ]; then
        echo "우수"
elif [ "$average" -ge 75 ]; then
        echo "양호"
else
        echo "보통"
fi
```
```bash
#출력결과

# 수학
[doyoung@localhost shell_practice]$ source grade_analyzer.sh 
Enter the Subject: 수학
수학 is in this file.
76
79
81
83
85
86
88
92
95
97
min: 97
max: 76
average: 86
우수

# 영어
[doyoung@localhost shell_practice]$ source grade_analyzer.sh 
Enter the Subject: 영어
영어 is in this file.
76
77
79
84
88
89
91
92
93
95
min: 95
max: 76
average: 86
우수

# 과학
[doyoung@localhost shell_practice]$ source grade_analyzer.sh 
Enter the Subject: 과학
과학 is in this file.
76
78
82
83
87
89
91
91
94
96
min: 96
max: 76
average: 86
우수

# 없는 과목
[doyoung@localhost ~]$ source ./shell_practice/grade_analyzer.sh 
Enter the Subject: math
grep: ./students.txt: No such file or directory
No such subjects
```
### 📁 문제 2 : 서버 로그 모니터링 도구
- 파일 : log_monitor.sh
- 요구사항
```
server_logs.txt 파일을 분석하여 로그 수준별 통계 및 문제 상황 감지
조건문을 사용하여 경고 수준 결정
```
- 구현해야 할 기능
```
전체 로그 라인 수 출력
ERROR, WARNING, INFO 각각의 개수 계산 및 출력
ERROR 로그만 별도 파일(errors.log)로 저장
가장 많이 발생한 ERROR 유형 찾기 (중복 제거 후 개수 확인)
ERROR 비율이 30% 이상이면 "위험", 20% 이상이면 "주의", 그 외는 "정상" 출력
마지막 5개 로그 항목을 시간 역순으로 출력
- 힌트
```
```
grep, wc, uniq, sort, tail 명령어 활용
리다이렉션으로 파일 저장
수치 계산을 위한 조건문 사용
```
### 🔧 정답
```
[yhc@192.168.0.51 ~/shell_practice]$ vi log_monitor.sh
```
```
# vi
#!bin/bash

V_LOG_FILE="server_logs.txt"

echo "Log Line Output : " && wc -l < "$V_LOG_FILE"
echo "ERROR, WARNING, INFO Output : " && cut -d" " -f 3 "$V_LOG_FILE" | sort | uniq -c
grep "ERROR" "$V_LOG_FILE" > errors.log
echo "Most ERROR : " && cut -d" " -f 4- errors.log | sort | uniq -c | sort -nr | head -n 1

V_TOTAL=$(wc -l < $V_LOG_FILE)
V_ERROR=$(grep -c "ERROR" $V_LOG_FILE)
V_RATE=$((V_ERROR * 100 / V_TOTAL))

echo "Situation : " && if [ "$V_RATE" -ge 30 ]; then
        echo "DANGEROUS"
elif [ "$V_RATE" -ge 20 ]; then
        echo "WARNING"
else
        echo "GOOD"
fi

echo "Last 5 Log : " && cut -d" " -f 2- "$V_LOG_FILE" | sort -r | tail -n 5
```
```
[yhc@192.168.0.51 ~/shell_practice]$ source log_monitor.sh 
Log Line Output : 
12
ERROR, WARNING, INFO Output : 
      5 ERROR
      5 INFO
      2 WARNING
Most ERROR : 
      2 Database connection failed
Situation : 
DANGEROUS
Last 5 Log : 
10:34:25 ERROR Authentication failed: user003
10:33:18 WARNING Memory usage high: 85%
10:32:05 INFO User login successful: user002
10:31:22 ERROR Database connection failed
10:30:15 INFO User login successful: user001
```
### 📁 문제 3 : 판매 데이터 분석 시스템
- 파일 : sales_analyzer.sh
- 요구사항
```
sales_data.txt 파일을 분석하여 매출 데이터 통계 생성
사용자 입력에 따른 다양한 분석 결과 제공
```
- 구현해야 할 기능
```
사용자로부터 분석 타입 입력받기 (월별/지역별/제품별)
입력값이 유효하지 않으면 사용법 출력 후 종료
선택한 분석 타입에 따라 다음 수행:
월별 : 각 월의 총 매출액을 높은 순으로 정렬하여 출력
지역별 : 각 지역의 총 매출액과 평균 매출액 출력
제품별 : 각 제품의 판매 횟수와 총 매출액 출력
전체 매출액이 1000만원 이상이면 "목표 달성", 800만원 이상이면 "양호", 그 외는 "노력 필요" 출력
```
- 힌트
```
cut, sort, uniq, grep 명령어 조합
필드 분리를 위한 -d 옵션 활용
조건문으로 분석 타입 분기 처리
```
### 📁 문제 4 : 단어 빈도 분석기
- 파일 word_frequency.sh
- 요구사항
```
words.txt 파일의 단어들을 분석하여 빈도수 계산
대소문자 처리 옵션 제공
```
- 구현해야 할 기능
```
사용자로부터 대소문자 구분 여부 입력받기 (y/n)
입력값 검증 (y 또는 n이 아니면 재입력 요구)
대소문자 구분하지 않는 경우
모든 단어를 소문자로 변환
중복 제거 후 빈도수와 함께 출력
빈도수 기준 내림차순 정렬
대소문자 구분하는 경우:
원본 그대로 중복 제거 후 빈도수 계산
총 고유 단어 개수 출력
가장 빈도가 높은 단어가 3회 이상 나타나면 "높은 중복도", 2회면 "보통 중복도", 1회면 "낮은 중복도" 출력
```
- 힌트
```
tr, sort, uniq, wc 명령어 활용
대소문자 변환을 위한 tr A-Z a-z
조건문으로 사용자 선택 처리
```