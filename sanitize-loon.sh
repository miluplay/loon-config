#!/bin/bash

INPUT_FILE="loon.conf"
OUTPUT_FILE="loon.template.conf"

cp "$INPUT_FILE" "$OUTPUT_FILE"

# 替换订阅链接（Remote Proxy）
sed -i '' 's#https://[^,]*#https://example.com/your-subscription-link#g' "$OUTPUT_FILE"

# 替换 ca-p12 内容为占位符
sed -i '' '/^ca-p12 *=/c\ca-p12 = __REDACTED__' "$OUTPUT_FILE"

# 替换 ca-passphrase
sed -i '' '/^ca-passphrase *=/c\ca-passphrase = __REDACTED__' "$OUTPUT_FILE"

# 替换作者名（可选）
sed -i '' 's/^# Author: .*/# Author: __REDACTED__/' "$OUTPUT_FILE"

echo "✅ 脱敏完成，已生成 $OUTPUT_FILE"