#!/bin/bash

# GitHub repository 정보
REPO_OWNER="username"
REPO_NAME="repo-name"

# 라벨 정보를 배열로 정의
LABELS=(
  # Common
  "60A5FA / ✨feature / 기능 신규 추가"
  "3B82F6 / 🛠️enhancement / 기존 기능 개선"
  "6B7280 / ⚙️chore / 기타 작업"
  # Issue
  "DC2626 / 🐞bug / 오류"
  "CA8A04 / ❓question / 질문"
  # Pull Request
  "F5F5F5 / 📝docs / 문서 변경"
  "F87171 / 🛠️bugfix / 오류 수정"
  "A78BFA / 🧹refactor / 코드 리팩토링"
  "34D399 / ✅test / 테스트 코드 추가"
  ## Size
  "F3F4F6 / 📏diff:XS / 50라인 이내 변경"
  "E5E7EB / 📏diff:S / 50~150라인 변경"
  "D1D5DB / 📏diff:M / 150~250라인 변경"
  "9CA3AF / 📏diff:L / 250~500라인 변경"
  "6B7280 / 📏diff:XL / 500라인 초과 변경"
)

# 각 라벨 생성
for LABEL_INFO in "${LABELS[@]}"; do
  IFS=' / ' read -r LABEL_COLOR LABEL_NAME LABEL_DESCRIPTION <<< "$LABEL_INFO"
  echo "Creating label: $LABEL_NAME with color $LABEL_COLOR"
  gh api repos/$REPO_OWNER/$REPO_NAME/labels -f name="$LABEL_NAME" -f color="$LABEL_COLOR" -f description="$LABEL_DESCRIPTION"
done

echo "All labels have been created successfully!" 