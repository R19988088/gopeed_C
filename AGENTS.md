# 项目工作准则

适用于本仓库所有修改；用户明确要求优先。

## 验证与推送
- 本地没有安卓环境，涉及 Android 或 Flutter 构建验证的修改必须推送到 GitHub Actions 验证。
- 修改完成后推送到远端，并检查 https://github.com/R19988088/gopeed_C/actions 的对应 workflow 结果。
- `test` 和 `release` workflow 只算检查，不算可交付构建；不要把它们的成功当成用户可安装版本已经可用。
- 需要给用户可运行桌面包时，必须手动触发 `build` workflow（`workflow_dispatch`，按需求选择 `platform`，通常为 `all` 或目标平台），并等它完成。
- 交付桌面包的完成标准：Actions 页面能直接看到并下载可运行产物，macOS 至少有 `.dmg`，Windows 至少有 `.exe` 或包含 `.exe` 的压缩包；如果当前 workflow 没上传这些产物，先修改 workflow 上传 artifact/asset，再重新跑 `build`。
- 最终回复必须说明 `build` workflow 的 run id、结论，以及看到的 `.dmg`/`.exe` 产物名；没有这些就明确说未完成，不要让用户自行猜测。
- 不要用本地无法验证的结论替代 Actions 结果；未验证项必须明确说明。

## 修改原则
- 先阅读相关代码、调用方和现有实现，再改动。
- 优先复用项目现有结构和组件，避免新增不必要的抽象、配置或依赖。
- UI 修改以美观和实用兼顾为优先；不明白需求或边界时直接询问。
- 不做掩盖性处理：不要隐藏错误、吞掉异常、绕过测试或用假成功状态结束任务。
