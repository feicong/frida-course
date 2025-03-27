# Frida架构分析学习环境

<font size=5 color=red>Frida源码情景分析</font>

```text
Copyright (c) 2024-2025 fei_cong(https://github.com/feicong/frida-course)
```

![image](https://github.com/user-attachments/assets/fd043172-d991-4bd5-9dd6-053f59a3e840)

## 学习环境

vala版本: 0.56

Ubuntu版本：jammy (22.04)

## 启动学习环境

docker方式：

```bash
docker run --cap-add=SYS_PTRACE --rm -it fsx199/frida-course-env:latest
```

dev containers方式：

```bash
npm install -g @devcontainers/cli
devcontainer up --workspace-folder .
```


## 编译项目

## 编译例代码

```bash
./build-demo.sh
```

或者：

Command Palette (⇧⌘P) -> Tasks: Run Task -> build-demo
