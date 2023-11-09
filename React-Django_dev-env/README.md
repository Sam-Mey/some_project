# 本地搭建 [React](https://github.com/facebook/react) + Django 前后端项目分离的开发环境 (Windows)


## 安装数据库 [MySQL](https://dev.mysql.com/downloads/mysql/)
> 1. 下载 [Windows (x86, 64-bit), MSI Installer](https://dev.mysql.com/downloads/mysql/)  （这里使用的是 MySQL 8.1）
> 2. 根据提示安装，（这里用的是 自定义安装 指定位置）
> 3. 选择配置 [查看](https://github.com/Sam-Mey/some_project/blob/main/React-Django_dev-env/img/mysql01.png) （这里使用默认）
> 4. 创建 root 密码 [查看](https://github.com/Sam-Mey/some_project/blob/main/React-Django_dev-env/img/mysql02.png)
> 5. 默认下一步直到安装完成。
> 6. 进入到 MySQL 安装目录，例：E:\MySQL\MySQL Server 8.1\bin
> 7. 输入 `mysql -u root -p` 
> 8. 输入 设置 root 密码 登录到数据库 

##### 相关命令：
```bash
CREATE DATABASE 数据库名;    # 创建数据库
SHOW DATABASES;             # 查看数据库
DROP DATABASE 数据库名;      # 删除数据库
USE 数据库名;                # 更改数据库

# 重置 root 密码：

# 停止 MySQL 服务器。
# 启动 MySQL 服务器，并在启动过程中添加 --skip-grant-tables 选项，以绕过权限检查。
# 连接到 MySQL 服务器。
# 执行 SQL 命令来更改 root 密码。
# 停止 MySQL 服务器，然后重新启动它

ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_password';     # 更改 root 密码
CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';    # 创建新用户
DROP USER 'username'@'localhost';                               # 删除新用户
```

## 安装 react 前端框架
  
> 本地开发需要安装 [Node.js](https://nodejs.org/en)。您还可以选择在生产中使用 Node.js，但不是必须的。许多 React 框架支持导出到静态 HTML/CSS/JS 文件夹。

### 1. 安装与卸载 （React  ReactDOM）
```bash
npm install react-scripts@latest           # 安装

npm install react@latest react-dom@latest  # 更新您项目中的 React 核心库 (react) 和用于将 React 渲染到 DOM 上的包 (react-dom) 到最新版本。
npm uninstall -g react react-dom           # 卸载
yarn global remove react react-dom         # yarn 卸载
```
> @18.2.0 表示版本为 18.2.0，你可以在 [releases](https://github.com/facebook/react/releases) 中查看以及安装相应的版本

### 2. 安装 create-react-app：它是一个用于快速创建 React 应用的官方脚手架工具
```bash
npm install -g create-react-app
```

### 3. 创建新的 React 项目  
#### 使用 React 创建前端项目 例：frontend_project [官方文档](https://react.dev/learn/start-a-new-react-project)
```bash
npx create-react-app frontend_project
cd frontend_project
npm start
```
  
#### [Next.js](https://react.dev/learn/start-a-new-react-project) 是一个全栈 React 框架。它用途广泛，可让您创建任何规模的 React 应用程序 — 从大部分静态博客到复杂的动态应用程序。要创建新的 Next.js 项目，请在终端中运行：
```bash
npx create-next-app frontend_project  
cd frontend_project
npm run dev
```
> 当你使用 npx create-next-app [项目名称] 创建前端项目时会出现以下交互：  
>  
> √ Would you like to use TypeScript? ... No / [Yes]()  
> √ Would you like to use ESLint? ... No / [Yes]()  
> √ Would you like to use Tailwind CSS? ... No / [Yes]()  
> √ Would you like to use `src/` directory? ... No / [Yes]()  
> √ Would you like to use App Router? (recommended) ... No / [Yes]()  
> √ Would you like to customize the default import alias? ... [No]() / Yes
>  

#### [Remix](https://react.dev/learn/start-a-new-react-project) 是一个带有嵌套路由的全栈 React 框架。它允许您将应用程序分解为嵌套部分，这些部分可以并行加载数据并刷新以响应用户操作。要创建新的 Remix 项目，请运行：
```bash
npx create-remix
```

#### [Gatsby](https://react.dev/learn/start-a-new-react-project) 是一个 React 框架，用于快速 CMS 支持的网站。其丰富的插件生态系统及其 GraphQL 数据层简化了将内容、API 和服务集成到一个网站中的过程。要创建新的 Gatsby 项目，请运行：
```bash
npx create-gatsby
```

#### [Expo (for native apps)](https://react.dev/learn/start-a-new-react-project) 是一个 React 框架，可让您创建具有真正本机 UI 的通用 Android、iOS 和 Web 应用程序。它为React Native提供了一个SDK，使本机部分更易于使用。要创建新的 Expo 项目，请运行：
```bash
npx create-expo-app
```  

> 推荐工具
> [Yarn](https://yarnpkg.com/) 用于更快、更可靠的依赖管理。使用它代替 npm 和 npx 。  
> VS Code 编辑器和 VS Code Expo 扩展可更轻松地进行调试和应用程序配置自动完成。  
> PowerShell（VS Code 中的默认终端）或通过 WSL 进行的 Bash，适合喜欢 Windows 的开发人员。  
> 如果您使用 [Yarn](https://yarnpkg.com/)，则可以使用以下命令引导新应用程序：  
```bash
yarn create expo [项目名称] # 创建项目
cd [项目名称]               # 进入项目
yarn init                  # 初始化项目
yarn expo start            # 启动项目
```
  
> 此时就可以访问 http://localhost:3000/ ,不出意外你将会看到一下界面：[React](https://github.com/Sam-Mey/some_project/blob/main/React-Django_dev-env/img/React.png)  [Next.js](https://github.com/Sam-Mey/some_project/blob/main/React-Django_dev-env/img/Nextjs.png)
>   
> 接下来你可以开始你的前端项目开发了
  
##### React 相关命令：
```bash
npm start     # 启动开发服务器,允许你在本地开发环境中实时预览你的 [React](https://github.com/facebook/react) 应用。当你运行这个命令时，它将启动一个本地服务器并在浏览器中打开应用。你可以在开发服务器中进行代码修改，它会自动重新加载以显示更新。
npm run build # 用于创建生产环境中使用的优化过的静态文件。当你准备将你的React应用部署到生产环境时，运行这个命令会将所有的代码和资源打包成一个或多个优化的静态文件。这些文件可以更有效地加载和运行，提供更好的性能。
npm test      # 用于启动测试运行器，以运行你的单元测试和集成测试。在开发过程中，编写测试可以帮助你捕捉潜在的问题，确保代码的质量和稳定性。
npm run eject # 用于 "弹出" 你的应用，将构建依赖、配置文件和脚本复制到应用目录中。通过执行此命令，你将不再依赖于 create-react-app 提供的开发环境和配置，但请注意，一旦弹出，就不能撤销操作。这个命令可以让你更深入地自定义项目的构建配置。
```

## 设置 Django 后端框架 
> [官网]( https://www.djangoproject.com/)  
> [官方文档]( https://docs.djangoproject.com/)  
> [教程（Tutorials）](https://docs.djangoproject.com/en/stable/intro/tutorial01/ )  
>  
> 安装 Django 之前，请确保你已经安装了 [Python](https://www.python.org/) 与编辑器 [vscode](https://code.visualstudio.com/)，并设置好环境变量。  
> 安装虚拟环境（可选）,虽然不是必需的，但建议在项目中使用 [Python](https://www.python.org/) 虚拟环境，以隔离不同项目的依赖关系。在命令行中运行以下命令来创建和激活虚拟环境： 
  
#### 1. 创建虚拟环境的目录，打开 cmd 切换到要创建虚拟环境的目录；如：D:\project
```bash
python -m venv .env          # 创建虚拟环境
.env\Scripts\activate        # (vscode) 激活虚拟环境 
.env\Scripts\activate        # (Windows cmd) 激活虚拟环境 
.env\Scripts\activate.ps1    # (Windows PowerShell) 激活虚拟环境
deactivate                   # 退出虚拟环境
```

#### 2. 安装 Django
```bash
pip install django
```

#### 3. 创建 Django 项目
```bash
django-admin startproject backend_project .   # 后端项目名称 例：backend_project 注意后面的 '.'
cd backend_project                           # 进入后端项目目录
python manage.py startapp application              # 创建应用,例如：application
```
#### 配置数据库：
> 打开 `settings.py` 文件，配置数据库连接。默认情况下，Django 使用 SQLite 数据库。您可以在 DATABASES 部分配置数据库连接信息，例如使用 MySQL 或 PostgreSQL；以 MySQL 为例：
>
> 如果使用默认 SQLite 数据库 则无需配置，运行迁移命令即可 `python manage.py migrate`。
>   
```bash
DATABASES = {
    'default': {
        'ENGINE': 'mysql.connector.django',
        'NAME': 'your_database_name',               # 数据库 名
        'USER': 'your_database_user',               # 数据库 用户名
        'PASSWORD': 'your_database_password',       # 数据库 密码
        'HOST': 'your_database_host',               # 默认为 'localhost'，如果 MySQL 在本地，请保留
        'PORT': 'your_database_port',               # 默认为 '3306'
    }
}
```

```bash
pip install mysql-connector-python     # 安装 MySQL 模块
pip install pymysql                    # 安装依赖
python manage.py makemigrations        # 生成数据库迁移文件
python manage.py migrate               # 运行数据库迁移
python manage.py createsuperuser       # 创建超级管理员
python manage.py runserver             # 启动开发服务器

python manage.py changepassword admin  # 重置超级管理员密码
```

> 1. 此时就可以访问 http://127.0.0.1:8000/ ,不出意外你将会看到一下界面：[查看](https://github.com/Sam-Mey/some_project/blob/main/React-Django_dev-env/img/Django.png)   
> 2. 接下来可以开始你的项目开发了！

#### 4. [React](https://github.com/facebook/react) 前端项目 连接 Django 后端项目
```bash
# 安装 CORS 中间件，并配置 CORS 中间件以允许来自 React 前端跨域请求
pip install django-cors-headers 

# 在 settings.py 中添加以下配置：
from decouple import config

INSTALLED_APPS = [
    # ...
    'corsheaders',
    # ...
]

MIDDLEWARE = [
    # ...
    'corsheaders.middleware.CorsMiddleware',
    # ...
]

CORS_ALLOWED_ORIGINS = [
    'http://localhost:3000',  # React前端的地址，'*' 表示所有源
]

# 设置 surl.py 路由，添加以下：
from django.contrib import admin
from django.urls import path
from 程序名称 import views


urlpatterns = [
    # 默认路由
    path('admin/', admin.site.urls),
    # ... 其他路由
    path('api/endpoint/', views.endpoint_view, name='endpoint'),
]


# 在 React 项目中进行 HTTP 请求：在 React 组件中，使用 fetch、axios 等工具进行 HTTP 请求到 Django 后端。
fetch('http://localhost:8000/api/endpoint/')
    .then(response => response.json())
    .then(data => console.log(data))
    .catch(error => console.error('Error:', error));

# Django 终端返回以下结果表示前后端连接成功。
[11/Sep/2023 12:47:50] "GET /api/endpoint/ HTTP/1.1" 200 39
```


#### 开始项目开发，以下是一些可能的步骤：

> 1.创建视图和 URL 配置： 如果您已经创建了模型并希望与数据库交互，可以开始编写视图函数和 URL 配置，以便通过 API 或网页访问您的模型数据。  
> 2. 创建模板： 如果您计划构建网页应用程序，可以创建 HTML 模板，以便渲染和显示数据。  
> 3. 配置静态文件： 如果您需要使用静态文件（如 CSS、JavaScript 或图像），请配置 Django 的静态文件设置，并将静态文件添加到您的项目中。  
> 4. 创建前端应用： 如果您的项目包括前端部分（如 React 应用程序），可以开始编写前端代码，并确保它与后端进行通信。  
> 5. 设置管理员账户： 在开发阶段，通常会创建管理员账户，以便您可以轻松地管理应用程序中的数据。您可以使用 `python manage.py createsuperuser` 命令来创建管理员账户。  
> 6. 编写单元测试： 编写单元测试是一种良好的实践，可以确保您的应用程序正常运行并在将来进行更改时不会破坏现有功能。  
> 7. 部署计划： 如果您的项目计划在生产环境中部署，考虑项目部署和服务器设置。  
>  具体下一步取决于您的项目需求和开发计划。您可以选择从上述列表中的任何一项开始，根据项目的优先级和需求进行安排。随着项目的发展，您将不断迭代和完善它。如果您有特定的问题或需要进一步的指导，请随时提出。
