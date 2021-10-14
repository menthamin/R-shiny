# R-shiny
Nginx 로 Reverse proxy 설정 후 Clinet IP 얻기
- 방법 : UI의 req(Http request)에서 HTTP_X_FORWARDED_FOR헤더 값을 가져옴
- 전역변수를 선언하고 해당 변수에 HTTP_X_FORWARDED_FOR 헤더 값을 저장

### 코드 적용
- app.R <- shiny site_dir 경로에 저장
- nginx.conf <- nginx 경로에 저장 (Ex. /etc/nginx/)
- shiny-server.conf <- shiny-server 경로에 저장 (Ex. /etc/shiny-server/)
