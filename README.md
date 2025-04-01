# ICT 问题快速解决仪表盘

这是一个专门为 ICT 人员打造的快速解决 ICT 问题的仪表盘，借助 AI 技术实现问题的分类，并自动生成问题简介、主题以及解决方案，极大提升 ICT 问题的处理效率。

## 项目概述
该项目是一个基于 Flutter 开发的响应式管理面板/仪表盘，专门服务于 ICT 人员。它能利用 AI 技术对各类 ICT 问题进行智能分类，并快速生成问题的简介、主题和解决方案。支持多平台，包括 iOS、Android、Windows 和 macOS。

### 项目结构
- **`android`**: Android 平台相关配置和代码。
- **`ios`**: iOS 平台相关配置和代码。
- **`macos`**: macOS 平台相关配置和代码。
- **`windows`**: Windows 平台相关配置和代码。
- **`lib`**: 项目的主要 Dart 代码。
  - **`models`**: 数据模型定义，包含 ICT 问题的相关数据结构。
  - **`screens`**: 应用界面屏幕。
    - **`dashboard`**: 仪表盘界面组件，展示 ICT 问题的分类、简介等信息。

### 最终运行预览


## 如何运行项目

### 前提条件

- 安装 Flutter SDK。
- 安装对应平台的开发工具（如 Xcode 用于 iOS，Android Studio 用于 Android）。

### 配置国内镜像源（推荐）

在中国大陆地区，访问 Flutter 官方仓库可能会受到网络限制。建议配置国内镜像源以提高下载速度：

#### 临时配置（当前终端会话有效）

```bash
# 配置 TUNA 镜像源
export PUB_HOSTED_URL=https://mirrors.tuna.tsinghua.edu.cn/dart-pub
export FLUTTER_STORAGE_BASE_URL=https://mirrors.tuna.tsinghua.edu.cn/flutter
```

### 步骤
1. 克隆项目到本地：
```bash
git clone https://github.com/hexwarrior6/Insight-Enco.git
cd Insight-Enco
```

### 浏览器调试提示

如果使用 Chrome 浏览器进行调试，需要关闭 CORS 安全限制，可选择以下任一方式：

1. **安装插件**（推荐）：
   - [CORS Unblock](https://chromewebstore.google.com/detail/cors-unblock) 插件

2. **命令行启动**（临时方案）：
```bash
# MacOS 指令
open -n -a "Google Chrome" --args --user-data-dir=/tmp/chrome_dev_test --disable-web-security
```