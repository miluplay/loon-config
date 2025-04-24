# 反脱敏还原脚本段（用于本地开发调试）
if [[ "$1" == "--restore" ]]; then
  echo "🔄 正在从模板恢复原始配置..."

  cp "$OUTPUT_FILE" "$INPUT_FILE"

  # 恢复 ca-p12 和 ca-passphrase（需要手动填入）
  sed -i '' '/^ca-p12 *=/c\ca-p12 = YOUR_REAL_CA_P12' "$INPUT_FILE"
  sed -i '' '/^ca-passphrase *=/c\ca-passphrase = YOUR_REAL_PASSPHRASE' "$INPUT_FILE"

  # 恢复订阅链接
  sed -i '' 's#https://example.com/your-subscription-link#https://your.real.subscription/link#g' "$INPUT_FILE"

  # 恢复作者名（可选）
  sed -i '' 's/^# Author: __REDACTED__/# Author: 白月/' "$INPUT_FILE"

  echo "✅ 已恢复为 $INPUT_FILE，请手动确认私密字段。"
  exit 0
fi