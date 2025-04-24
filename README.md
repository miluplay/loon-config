# 结构
loon-config/
├── config.conf     # 主配置文件，Loon 订阅拉取的目标
├── rules/
│   └── direct_rules.conf   # 直连规则文件，存放所有的直连规则
├── create_loon.py  # 生成 Loon 配置文件的脚本
└── README.md

# 使用说明
1. 确保 `rules/direct_rules.conf` 文件中包含所需的规则。
2. 运行脚本生成配置文件：
   ```bash
   python create_loon.py
   ```
3. 生成的 `config.conf` 文件即为 Loon 的订阅配置文件。
