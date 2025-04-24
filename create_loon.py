import os

# 定义文件路径
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
RULES_FILE = os.path.join(BASE_DIR, "rules", "direct_rules.conf")
OUTPUT_FILE = os.path.join(BASE_DIR, "config.conf")

def read_rules(file_path):
    """读取规则文件"""
    with open(file_path, "r", encoding="utf-8") as f:
        return f.readlines()

def generate_loon_config(rules):
    """生成 Loon 配置文件内容"""
    config = [
        "[General]",
        "bypass-system = true",
        "skip-proxy = 127.0.0.1, localhost",
        "log-level = info",
        "",
        "[Rule]",
    ]
    config.extend(rule.strip() for rule in rules if rule.strip() and not rule.startswith("#"))
    config.append("")
    return "\n".join(config)

def write_config(file_path, content):
    """写入配置文件"""
    with open(file_path, "w", encoding="utf-8") as f:
        f.write(content)

def main():
    # 读取规则文件
    rules = read_rules(RULES_FILE)
    # 生成 Loon 配置文件内容
    loon_config = generate_loon_config(rules)
    # 写入配置文件
    write_config(OUTPUT_FILE, loon_config)
    print(f"Loon 配置文件已生成: {OUTPUT_FILE}")

if __name__ == "__main__":
    main()
