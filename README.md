# 개발 워크스테이션 구축 및 컨테이너 환경 검증 (Mission e1-1)

## 1. 프로젝트 개요
본 프로젝트는 팀원 누구나 동일하고 재현 가능한 환경에서 실행 및 협업할 수 있도록 리눅스 CLI, Docker, Git/GitHub을 연계하여 개발 워크스테이션을 구축한 실습 결과물입니다.
터미널 명령어 실습, 파일 권한 체계 검증, Nginx 기반 커스텀 웹 서버 컨테이너화, 포트 포워딩, 그리고 바인드 마운트와 Docker 볼륨을 통한 데이터 영속성 검증 과정을 상세히 기록하였습니다.

---

## 2. 실행 환경
* **OS:** Windows 11 (x86_64)
* **Shell/Terminal:** Windows PowerShell / Git Bash
* **Docker:** Docker Desktop (Engine 27.x.x)
* **Git:** Git 2.x

---

## 3. 수행 항목 체크리스트
- [x] 터미널 기본 조작 및 파일 관리 (조회, 생성, 복사, 이름변경, 삭제)
- [x] 권한 변경 실습 및 원리 분석 (chmod 600, 700)
- [x] Docker 설치 및 데몬 점검 (`docker --version`, `docker info`)
- [x] hello-world 및 ubuntu 컨테이너 실행 (`run`, `exec`, `exit` 동작 차이)
- [x] Dockerfile 기반 커스텀 웹 서버 이미지 빌드
- [x] 포트 매핑 기반 다중 컨테이너 접속 검증 (8080, 8081)
- [x] 바인드 마운트를 활용한 실시간 변경 사항 반영
- [x] Docker 볼륨을 통한 데이터 영속성 검증 (컨테이너 삭제 전/후 비교)
- [x] Git 사용자 설정 및 GitHub 연동

---

## 4. 터미널 조작 및 권한 실습

### 4.1 터미널 기본 조작 로그
```bash
$ pwd
/c/Users/User/mission1

$mkdir -p practice && cd practice$ touch test_file.txt
$ echo "Hello Codyssey" > test_file.txt
$ cat test_file.txt
Hello Codyssey

$ cp test_file.txt copy_file.txt
$ mv copy_file.txt renamed_file.txt
$ ls -la
total 5
drwxr-xr-x 1 user 197121 0 Nov 5 17:00 .
drwxr-xr-x 1 user 197121 0 Nov 5 16:59 ..
-rw-r--r-- 1 user 197121 15 Nov 5 17:00 test_file.txt
-rw-r--r-- 1 user 197121 15 Nov 5 17:00 renamed_file.txt

$ rm renamed_file.txt