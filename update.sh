#!/bin/bash
# after-yoga-collaboration 자동 push 스크립트

# 이 스크립트가 있는 폴더 기준으로 실행
cd "$(dirname "$0")"

echo "📤 변경 사항 확인 중..."
git add .

# 변경된 파일이 없으면 종료
if git diff --cached --quiet; then
  echo "✅ 변경된 파일이 없습니다."
  exit 0
fi

# 타임스탬프로 커밋 메시지 자동 생성
TIMESTAMP=$(date "+%Y-%m-%d %H:%M")
git commit -m "update $TIMESTAMP"

echo "🚀 GitHub에 업로드 중..."
git push

echo "✅ 완료! 1~2분 후 링크에서 확인하세요."
echo "🔗 https://piercepark.github.io/after-yoga-collaboration/after_yoga_collaboration_slides.html"
