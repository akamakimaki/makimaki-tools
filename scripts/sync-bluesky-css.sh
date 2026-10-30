#!/usr/bin/env bash
set -euo pipefail

SOURCE="$HOME/makimaki-tools/css/bluesky-button.css"
DEST="$HOME/poll/public/css/bluesky-button.css"

test -s "$SOURCE" || {
  echo "エラー: 共通CSSの原本がありません"
  exit 1
}

mkdir -p "$(dirname "$DEST")"

# 更新前のバックアップ
if [ -f "$DEST" ]; then
  cp -p "$DEST" "$DEST.bak"
fi

# 共通CSSを同期
cp "$SOURCE" "$DEST"

# 一致を検証
cmp "$SOURCE" "$DEST"

echo "🦋 共通CSSの同期完了！"
