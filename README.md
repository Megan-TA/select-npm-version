# select-npm-version

一个简单的 cli 帮助规范化发布 npm 包

![select-npm-version preview](https://s1.ax1x.com/2020/10/14/05jLD0.gif)

提供两个 bin 命令

`select-npm-version` 提供交互式的基于当前 package 版本进行更新

`select-npm-version-publish` 提供相对统一的一键发布功能，包含 git 提交、npm 的发布过程
一般只需要此命令进行发布

两个命令可以简写为`snv`和`snvp`

注意：scripts 名称不能使用`publish`会导致内部的`npm publish`命令重复，导致死循环

```json
// package.json

scripts: {
    "snv": "select-npm-version",
    "release": "select-npm-version-publish"
}

```

## npm 版本号说明

- major: 主版本号
- premajor: 预备主版本
- minor: 次版本号
- preminor: 预备次版本
- patch: 修订号
- prepatch: 预备修订版
- prerelease: 预发布版本

示例说明

假设初始版本为 0.1.0

➜ xxx git:(master) npm version preminor

v0.1.0-0

➜ xxx git:(master) npm version minor

v0.1.0

➜ xxx git:(master) npm version prepatch

v0.1.1-0

➜ xxx git:(master) npm version patch

v0.1.1

➜ xxx git:(master) npm version prerelease

v0.1.2-0

➜ xxx git:(master) npm version premajor

v1.0.0-0

➜ xxx git:(master) npm version major

v1.0.0
