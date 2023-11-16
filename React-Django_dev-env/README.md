# 本地搭建 [React](https://github.com/facebook/react) + Django 前后端项目分离的开发环境 (Windows)

## 安装数据库 [MySQL](https://dev.mysql.com/downloads/mysql/)

### [Node.js](https://nodejs.org/en)

### [Python](https://www.python.org/)

>
> 1. 下载 [Windows (x86, 64-bit), MSI Installer](https://dev.mysql.com/downloads/mysql/)  （这里使用的是 MySQL 8.1）
> 2. 根据提示安装，（这里用的是 自定义安装 指定位置）
> 3. 选择配置 [查看](https://github.com/Sam-Mey/some_project/blob/main/React-Django_dev-env/img/mysql01.png) （这里使用默认）
> 4. 创建 root 密码 [查看](https://github.com/Sam-Mey/some_project/blob/main/React-Django_dev-env/img/mysql02.png)
> 5. 默认下一步直到安装完成。
> 6. 进入到 MySQL 安装目录，例：E:\MySQL\MySQL Server 8.1\bin
> 7. 输入 `mysql -u root -p` 
> 8. 输入 设置 root 密码 登录到数据库 

### 相关命令

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

## 安装 [Yarn](https://yarnpkg.com/)

> 管理 [Yarn](https://yarnpkg.com) 的首选方法是按项目和 [Corepack](https://yarnpkg.com/corepack)（Node.js 默认附带的工具）。Yarn 的现代版本并不意味着全局安装，也不意味着从 npm 安装。
>  
> 首先启用 [Corepack](https://yarnpkg.com/corepack)（如果尚未启用）;这会将 yarn 二进制文件添加到您的 PATH 中：

```bash
# 帮助信息
yarn init -h

# 管理员运行 cmd
corepack enable

# 然后初始化一个新项目：
yarn init -2

# 更新 Yarn
# 每当您想将 Yarn 更新到最新版本时，只需运行：

yarn set version stable
yarn install

# 然后，Yarn 会将您的项目配置为使用最新的稳定二进制文件。
```

> Yarn 还经常发布候选版本。如果您需要尚未在稳定频道上发布的功能，请使用 `yarn set version canary`。这些版本非常稳定，与常规频道的唯一区别是，当我们实施新的重大更改时，主要版本之间的迁移更加交错。
>  
> 从 master 全新安装最新版本
> 您可能想要测试最近的 Yarn 版本，该版本尚未在候选发布版本中发布，甚至尚未合并。以下命令将直接从我们的存储库克隆、构建和安装 Yarn 到您的项目中：
>  
> `yarn set version from sources`
> 它接受可用于测试特定 PR 的标志：--branch
>  
> `yarn set version from sources --branch 1211`
> 与稳定版和金丝雀频道不同，`yarn set version from sources` 命令不能利用 Corepack，需要将 Yarn 二进制文件存储在文件夹中，并从项目文件中引用它。.yarn/releases.yarnrc.yml

## 用法

> 如果你来自 npm，主要变化是：
>  
> 运行 yarn 足以运行安装！它是 `yarn install` 的别名。
>  
> 向单个包添加或更新依赖项是通过 `yarn add` 完成的。
>  
> 升级整个项目中的依赖项是通过 `yarn up` 完成的。
>  
> 您的脚本是别名的。调用 `yarn build` 和 `yarn run build` 是一样的！
>  
> 大多数与注册表相关的命令都移到了 `yarn npm` 后面（例如： `yarn npm audit`）。
>  
> 要查看命令的完整列表，请查看 [CLI](https://yarnpkg.com/cli) 参考。

## 设置 Django 后端框架

> [官网]( https://www.djangoproject.com/)
>  
> [官方文档]( https://docs.djangoproject.com/)
>  
> [教程（Tutorials）](https://docs.djangoproject.com/en/stable/intro/tutorial01/ )
>  
> 安装 Django 之前，请确保你已经安装了 [Python](https://www.python.org/) 与编辑器 [vscode](https://code.visualstudio.com/)，并设置好环境变量。
>  
> 安装虚拟环境（可选）,虽然不是必需的，但建议在项目中使用 [Python](https://www.python.org/) 虚拟环境，以隔> 离不同项目的依赖关系。在命令行中运行以下命令来创建和激活虚拟环境:
  
### 1. 创建虚拟环境的目录，打开 cmd 切换到要创建虚拟环境的目录；如：D:\project

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
cd backend_project                            # 进入后端项目目录
python manage.py startapp application         # 创建应用,例如：application
```

#### 连接数据库

> 打开 `settings.py` 文件，配置数据库连接。默认情况下，Django 使用 SQLite 数据库。
>  
> 您可以在 DATABASES 部分配置数据库连接信息，例如使用 MySQL 或 PostgreSQL；以 MySQL 为例
>
> 默认情况下 Django 将使用 SQLite 数据库；如使用默认数据库，则无需配置，运行以下迁移命令即可
>  
> `python manage.py migrate`。
>

#### 创建一个非 root 用户（将 “用户” 替换为根据自己需求，非中文）

```bash
CREATE USER '用户'@'localhost' IDENTIFIED BY '密码';
GRANT ALL PRIVILEGES ON 用户.* TO '用户'@'localhost';
FLUSH PRIVILEGES;
```

#### 检查 MySQL 数据库允许用户 '数据库名'@'localhost' 连接

```bash
SELECT user, host FROM mysql.user;
```

```bash
# 如下表示允许：
+------------------+-----------+
| user             | host      |
+------------------+-----------+
| mysql.infoschema | localhost |
| mysql.session    | localhost |
| mysql.sys        | localhost |
| root             | localhost |
| XXXXX            | localhost |
+------------------+-----------+
```

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

#### 定义模型：在 `application/models.py` 文件中定义你的模型类，例如

```bash
from django.db import models

class MyModel(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()

    def __str__(self):
        return self.name

```

#### 注册应用：编辑 `settings.py` 文件，将你的应用添加到 `INSTALLED_APPS` 中

```bash
INSTALLED_APPS = [
    # ...
    'myapp', # 如你创建的应用为 myapp
    # ...
]
```

#### 使用 `mysql-connector-python` 来连接 MySQL 数据库

```bash
pip install mysql-connector-python     # 安装 MySQL 模块
pip install pymysql                    # 安装依赖
```

```bash
python manage.py makemigrations        # 生成数据库迁移文件
python manage.py migrate               # 运行数据库迁移
python manage.py createsuperuser       # 创建超级管理员
python manage.py runserver             # 启动开发服务器

python manage.py changepassword admin  # 重置超级管理员密码
```

> 1. 此时就可以访问 http://127.0.0.1:8000/ ,不出意外你将会看到一下界面：[查看](https://github.com/Sam-Mey/some_project/blob/main/React-Django_dev-env/img/Django.png)
> 2. 接下来可以开始你的项目开发了！
