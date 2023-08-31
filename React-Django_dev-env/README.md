# 本地搭建 React + Django 项目开发环境 (Windows)

### 安装 react

##### 您需要安装 [Node.js](https://nodejs.org/en) 进行本地开发。

#### 1. 安装 React 和 ReactDOM
```bash
npm install react react-dom
```
#### 2. 安装create-react-app：create-react-app是一个用于快速创建React应用的官方脚手架工具
```bash
npm install -g create-react-app
```

#### 3. 创建新的 React 应用；进入项目目录启动服务器
```bash
npx create-react-app frontend
cd frontend
npm start
```

#### 不出意外的情况下，此时就可以访问 `http://localhost:3000/` 。

##### 相关命令：
```bash
npm start # 启动开发服务器,允许你在本地开发环境中实时预览你的React应用。当你运行这个命令时，它将启动一个本地服务器并在浏览器中打开应用。你可以在开发服务器中进行代码修改，它会自动重新加载以显示更新。

npm run build # 用于创建生产环境中使用的优化过的静态文件。当你准备将你的React应用部署到生产环境时，运行这个命令会将所有的代码和资源打包成一个或多个优化的静态文件。这些文件可以更有效地加载和运行，提供更好的性能。

npm test # 用于启动测试运行器，以运行你的单元测试和集成测试。在开发过程中，编写测试可以帮助你捕捉潜在的问题，确保代码的质量和稳定性。

npm run eject # 用于 "弹出" 你的应用，将构建依赖、配置文件和脚本复制到应用目录中。通过执行此命令，你将不再依赖于 create-react-app 提供的开发环境和配置，但请注意，一旦弹出，就不能撤销操作。这个命令可以让你更深入地自定义项目的构建配置。

# 提示信息建议你从运行以下命令开始:
cd jcclub
npm start
```
