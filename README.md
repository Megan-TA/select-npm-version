<h2 align="center">select-version-cli</h2>

一个简单的 cli 帮助发布 npm 包

<img src="https://fuss10.elemecdn.com/6/67/d7b4b2af2f87aa10028feee5ed1b8gif.gif" alt="cli-select preview">

提供两个 bin 命令

`select-version-cli`

提供交互式的基于当前 package 版本更新的选择

`select-version-publish-cli`

提供相对统一的一键发布功能，包含 git 提交、npm 的发布过程
一般只需要此命令进行发布

注意：不能使用`publish`会导致内部的`npm publish`命令重复，导致死循环

```json
// package.json

scripts: {
    "release": "select-version-publish-cli"
}

```
