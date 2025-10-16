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

## 사용 방법(간단)
1. `osqueryi` 인터랙티브 모드
```powershell
"C:\Program Files\osquery\osqueryi.exe"
# 또는 단일 쿼리
"C:\Program Files\osquery\osqueryi.exe" --json "SELECT * FROM listening_ports LIMIT 10;"
