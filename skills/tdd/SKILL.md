---
name: tdd
description: Use when writing any production code - new features, bug fixes, refactoring. Enforces RED-GREEN-REFACTOR cycle.
metadata:
  version: "1.0.0"
  source: "Adapted from obra/superpowers"
---

# 測試驅動開發 (Test-Driven Development)

先寫測試，看它失敗，寫最小代碼通過。

## 鐵律

```
NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST
```

先寫了代碼？**刪除它**。從頭開始。

- 不保留作「參考」
- 不「改寫」它
- 不看它
- 刪除就是刪除

從測試重新實作。句號。

## 何時使用

**總是：**
- 新功能
- Bug 修復
- 重構
- 行為變更

**例外（需詢問人類）：**
- 一次性原型
- 生成代碼
- 配置檔

想著「這次跳過 TDD」？停。那是合理化。

## RED-GREEN-REFACTOR 循環

```
[RED] 撰寫失敗測試
    ↓
驗證失敗正確？ → No → 修正測試
    ↓ Yes
[GREEN] 最小代碼通過
    ↓
驗證通過？ → No → 修正代碼
    ↓ Yes
[REFACTOR] 清理代碼
    ↓
仍然通過？ → No → 回滾重構
    ↓ Yes
下一個測試
```

## RED: 撰寫失敗測試

- 測試必須失敗
- 失敗訊息必須清晰
- 測試必須測試正確的事

```python
# 好的失敗測試
def test_user_can_login_with_valid_credentials():
    user = User(email="test@example.com", password="secret")
    result = authenticate(user.email, user.password)
    assert result.success is True
```

## GREEN: 最小代碼通過

- 只寫讓測試通過的最小代碼
- 不要「順便」加功能
- 硬編碼也OK（之後重構）

```python
# 最小代碼
def authenticate(email, password):
    return AuthResult(success=True)
```

## REFACTOR: 清理代碼

- 消除重複
- 改善命名
- 保持測試通過
- 小步改動

## 好測試的特徵

| 特徵 | 說明 |
|------|------|
| 快速 | 毫秒級執行 |
| 獨立 | 不依賴其他測試 |
| 可重複 | 每次結果相同 |
| 自我驗證 | 無需人工判讀 |
| 及時 | 與代碼同時寫 |

## 測試反模式

| 反模式 | 問題 |
|--------|------|
| 測試實作細節 | 重構就壞 |
| 一個測試測太多 | 失敗不知何處 |
| 測試間相依 | 隨機失敗 |
| 忽略邊界案例 | Bug 藏在角落 |
| 事後補測試 | 測不到正確行為 |

## 常見合理化藉口

| 藉口 | 駁斥 |
|------|------|
| 「先寫代碼再補測試」 | 補的測試驗證不了正確行為 |
| 「這只是原型」 | 原型會變成生產代碼 |
| 「太簡單不需要」 | 簡單的今天，複雜的明天 |
| 「時間不夠」 | TDD 減少除錯時間 |
