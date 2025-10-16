# osquery-security-audit

## 개요
Windows 환경에서 osquery를 활용한 보안 감사 자동화 프로젝트입니다.  
수동 쿼리(운영 시나리오)와 자동 스케줄(osqueryd) 설정, PowerShell 래퍼 스크립트를 포함하여 실무에서 바로 활용 가능한 구성을 목표로 합니다.

## 주요 기능
- 프로세스 ↔ 리스닝 포트 매핑 (외부 바인드 탐지)
- 랜섬웨어 의심 파일(확장자) 탐지
- Downloads 폴더 대용량 파일 탐지
- 관리자/권한 상승 의심 프로세스 탐지
- osquery.conf 샘플(Windows용) 제공

<img width="972" height="510" alt="깃허브에 정리04" src="https://github.com/user-attachments/assets/55ffd625-a82a-44d7-b8e5-22037e980816" />

## 사용 방법(간단)
1. `osqueryi` 인터랙티브 모드
```powershell
"C:\Program Files\osquery\osqueryi.exe"
# 또는 단일 쿼리
"C:\Program Files\osquery\osqueryi.exe" --json "SELECT * FROM listening_ports LIMIT 10;"


## 파일로 결과 저장 (PowerShell)

& "C:\Program Files\osquery\osqueryi.exe" --json "SELECT * FROM listening_ports;" | Out-File samples/osq_listening_example.json -Encoding utf8


## 데몬/스케줄용 (osqueryd)

& "C:\Program Files\osquery\osqueryd.exe" --config_path="configs\osquery.conf" --verbose


## 인터랙티브로 실행한 결과(지금 스크린샷) 정리 방식
쿼리 파일로 정리: 위 queries/*.sql 처럼 쿼리를 파일화.
샘플 출력 저장: osqueryi --json "SELECT ..." 또는 PS 스크립트로 JSON 파일로 저장
samples/ 폴더에 실제 출력 예시(JSON) 올리되, 민감한 IP/계정/도메인은 마스킹 처리.



