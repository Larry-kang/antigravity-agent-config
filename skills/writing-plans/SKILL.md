---
name: writing-plans
description: Use when you have approved design/spec and need to create step-by-step implementation tasks before coding.
metadata:
  version: "1.0.0"
  source: "Adapted from obra/superpowers"
---

# 撰寫實作計畫 (Writing Plans)

將設計文件轉化為詳細的實作計畫，每個任務粒度為 2-5 分鐘。

## 何時使用

- 設計已核准，準備開始實作
- 需要多步驟的功能開發
- 希望遵循 TDD 流程

## 核心原則

- **DRY** - Don't Repeat Yourself
- **YAGNI** - You Aren't Gonna Need It
- **TDD** - Test-Driven Development
- **頻繁提交** - 每個任務完成即提交

## 任務粒度

每個步驟是一個動作 (2-5 分鐘)：

```
「撰寫失敗測試」 - 一步
「執行測試確認失敗」 - 一步
「撰寫最小代碼通過測試」 - 一步
「執行測試確認通過」 - 一步
「提交」 - 一步
```

## 計畫文件結構

```markdown
# [功能名稱] 實作計畫

> **For Agent:** 使用 `executing-plans` 或 `subagent-development` 技能執行此計畫

**目標:** [一句話描述]

**架構:** [2-3 句技術方案]

**技術棧:** [關鍵技術/套件]

---

### Task 1: [元件名稱]

**檔案:**
- 建立: `exact/path/to/file.py`
- 修改: `exact/path/to/existing.py:123-145`
- 測試: `tests/exact/path/to/test.py`

**Step 1: 撰寫失敗測試**

\`\`\`python
def test_specific_behavior():
    result = function(input)
    assert result == expected
\`\`\`

**Step 2: 執行測試確認失敗**

執行: `pytest tests/path/test.py::test_name -v`
預期: FAIL with "function not defined"

**Step 3: 撰寫最小實作**

\`\`\`python
def function(input):
    return expected
\`\`\`

**Step 4: 執行測試確認通過**

執行: `pytest tests/path/test.py::test_name -v`
預期: PASS

**Step 5: 提交**

\`\`\`bash
git add tests/path/test.py src/path/file.py
git commit -m "feat: add specific feature"
\`\`\`
```

## 存檔位置

計畫存入: `docs/plans/YYYY-MM-DD-<feature-name>.md`

## 執行選項

計畫完成後，提供兩種執行方式：

1. **子代理驅動** - 使用 `subagent-development` 技能，每任務獨立子代理
2. **批次執行** - 使用 `/execute-plan` 工作流，含人工檢查點
