# 本地搭建 React + Django 项目开发环境 (Windows)

## 安装数据库 [MySQL](https://dev.mysql.com/downloads/mysql/)
> 1. 下载 MySQL MSI Installer  （这里使用的是 MySQL 8.1）
> 2. 根据提示安装，（这里用的是 自定义安装 指定位置）
> 3. 选择配置 [查看](https://github.com/Sam-Mey/some_project/blob/main/React-Django_dev-env/img/mysql01.png) （这里使用默认）
> 4. 创建 root 密码 [查看](https://github.com/Sam-Mey/some_project/blob/main/React-Django_dev-env/img/mysql02.png)
> 5. 默认下一步直到安装完成。
> 6. 进入到 MySQL 安装目录，例：E:\MySQL\MySQL Server 8.1\bin
> 7. 输入 `mysql -u root -p` 
> 8. 输入 设置 root 密码 既可以连接到数据库 

##### 相关命令：
```bash
SHOW DATABASES; # 查看数据库
CREATE DATABASE database_name; # 查看数据库
DROP DATABASE database_name; # 删除数据库
USE database_name; # 更改数据库

# 重置 root 密码：

# 停止 MySQL 服务器。
# 启动 MySQL 服务器，并在启动过程中添加 --skip-grant-tables 选项，以绕过权限检查。
# 连接到 MySQL 服务器。
# 执行 SQL 命令来更改 root 密码。
# 停止 MySQL 服务器，然后重新启动它

ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_password'; # 更改 root 密码
CREATE USER 'username'@'localhost' IDENTIFIED BY 'password'; # 创建新用户
DROP USER 'username'@'localhost'; # 删除新用户
```

## 安装 react 前端框架

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
npx create-react-app frontend_project # 前端项目名称 例：custom
cd frontend_project
npm start
```

#### 此时就可以访问 http://localhost:3000/ ,不出意外你将会看到一下界面：[查看](https://github.com/Sam-Mey/some_project/blob/main/React-Django_dev-env/img/React.png)

##### 相关命令：
```bash
npm start //启动开发服务器,允许你在本地开发环境中实时预览你的React应用。当你运行这个命令时，它将启动一个本地服务器并在浏览器中打开应用。你可以在开发服务器中进行代码修改，它会自动重新加载以显示更新。

npm run build //用于创建生产环境中使用的优化过的静态文件。当你准备将你的React应用部署到生产环境时，运行这个命令会将所有的代码和资源打包成一个或多个优化的静态文件。这些文件可以更有效地加载和运行，提供更好的性能。

npm test //用于启动测试运行器，以运行你的单元测试和集成测试。在开发过程中，编写测试可以帮助你捕捉潜在的问题，确保代码的质量和稳定性。

npm run eject //用于 "弹出" 你的应用，将构建依赖、配置文件和脚本复制到应用目录中。通过执行此命令，你将不再依赖于 create-react-app 提供的开发环境和配置，但请注意，一旦弹出，就不能撤销操作。这个命令可以让你更深入地自定义项目的构建配置。

//提示信息建议你从运行以下命令开始:
cd jcclub
npm start
```

## 设置 Django 后端框架

### 安装 Django 之前，请确保你已经安装了 [Python](https://www.python.org/) 与编辑器 [vscode](https://code.visualstudio.com/)，并设置好环境变量。

#### 1. 安装虚拟环境（可选）,虽然不是必需的，但建议在项目中使用 Python 虚拟环境，以隔离不同项目的依赖关系。在命令行中运行以下命令来创建和激活虚拟环境：
  
#### 打开 cmd 切换到要创建虚拟环境的目录，如：D:\project
```bash
python -m venv venv  # 创建虚拟环境
venv\Scripts\activate  # (vscode) 激活虚拟环境 
venv\Scripts\activate  # (Windows cmd) 激活虚拟环境 
venv\Scripts\activate.ps1  # (Windows PowerShell) 激活虚拟环境
```

#### 2. 安装 Django
```bash
pip install django
```

#### 3. 创建 Django 项目
```bash
django-admin startproject backend_project # 后端项目名称 例：admin
```
#### 配置数据库：
> 打开 `backend/settings.py` 文件，配置数据库连接。默认情况下，Django使用SQLite数据库。您可以在 DATABASES 部分配置数据库连接信息，例如使用 MySQL 或 PostgreSQL。

```bash
cd backend_project
python manage.py startapp api # 创建应用,例如 api
python manage.py migrate # 运行数据库迁移
python manage.py runserver # 启动开发服务器
```

#### 此时就可以访问 http://127.0.0.1:8000/ ,不出意外你将会看到一下界面：[查看](https://github.com/Sam-Mey/some_project/blob/main/React-Django_dev-env/img/Django.png)

