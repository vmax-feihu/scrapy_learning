# scrapy_learning
scrapy学习

# 安装
## windows安装

依次安装如下软件

* python-2.7.11.amd64.msi
* VCForPython27.msi
* lxml-3.5.0.win-amd64-py2.7.exe
* pywin32-220.win-amd64-py2.7.exe

然后使用pip安装scrapy。

```shell
pip install scrapy
```

同时抓取多个项目，需要安装scrapyd
```shell
pip install scrapyd scrapyd-client
```

升级scrapy
```shell
pip install scrapy scrapyd scrapyd-client --upgrade
```

## Linux安装
### RHEL 7系列安装
```shell
sudo yum -y install epel-release
sudo yum -y install python-devel openssl-devel libxml2-devel libxslt-devel libffi-devel cpp gcc python-six python-lxml python-cssselect python-cffi python-enum34 python-cffi python-zope-interface python-ipaddress python-cryptography python-pyasn1 python-pyasn1-modules python-idna python-ipython
sudo pip install scrapy
sudo pip install scrapyd scrapyd-client
```

升级scrapy
```shell
sudo pip install scrapy scrapyd scrapyd-client --upgrade
```

### CentOS 6系列安装
CentOS 6默认是python2.6版本，需要安装python2.7版本以安装scrapy
```shell
yum -y install scl-utils centos-release-scl-rh
yum -y install python27 python27-python-devel python27-python-pip python27-python-six
```

安装完成后，就可以通过scl enable python27使用python2.7

```shell
scl enable python27 "python -V"
```

安装scrapy
```shell
yum -y install openssl-devel libxml2-devel libxslt-devel libffi-devel cpp gcc python-cffi
scl enable python27 "pip install scrapy"
scl enable python27 "pip install scrapyd scrapyd-client"
```

升级scrapy
```shell
yum -y install openssl-devel libxml2-devel libxslt-devel libffi-devel cpp gcc python-cffi
scl enable python27 "pip install scrapy scrapyd scrapyd-client --upgrade"
```

安装scrapy结束后查看scrapy版本
```shell
scl enable python27 "scrapy version -v"
```

## Docker安装

### 使用docker hub上的centos/python-27-centos7安装scrapy
```shell
FROM centos/python-27-centos7
MAINTAINER tanyaobin "tan.yaobin@hotmail.com"
RUN yum -y install python-devel openssl-devel libxml2-devel libxslt-devel libffi-devel cpp gcc python-six python-lxml python-cssselect python-cffi python-enum34 python-cffi python-zope-interface python-ipaddress python-cryptography python-pyasn1 python-pyasn1-modules python-idna python-ipython; \
    yum clean all; \
    pip install scrapy
    pip install scrapyd scrapyd-client
```

### 使用docker hub上的centos 7，基于python35安装scrapy
```shell
FROM centos:7
MAINTAINER tanyaobin "tan.yaobin@hotmail.com"
RUN yum install -y centos-release-scl gcc openssl-devel && yum install -y rh-python35 && scl enable rh-python35 "pip install --upgrade pip; pip install scrapy"
```

# 命令
| 名称 | 作用域 | 含义 | 示例 |
|-----|--------|------|------|
| bench | 全局 | Run quick benchmark test | ```scrapy bench``` |
| check | 项目 | Check spider contracts | ```scrapy check [options] <spider>``` |
| crawl | 项目 | 运行spider | ```scrapy crawl [options] <spider>``` |
| edit | 项目 | Edit a spider using the editor defined in EDITOR setting | ```scrapy edit <spider>``` |
| fetch | 全局 | Fetch a URL using the Scrapy downloader and print its content to stdout | ```scrapy fetch [options] <url>``` |
| genspider | 项目 | 使用预定义模板创建spider | ```scrapy genspider [options] <name> <domain>``` |
| list | 项目 | 列出可用的spider | ```scrapy list``` |
| parse | 项目 | Parse URL (using its spider) and print the results | ```scrapy parse [options] <url>``` |
| runspider | 全局 | Run the spider defined in the given file | ```scrapy runspider [options] <spider_file>``` |
| settings | 全局 | 获取设置的数据 | ```scrapy settings [options]``` |
| shell | 全局 | 交互式操作 | ```scrapy shell [url or file]``` |
| startproject | 全局 | 创建scrapy项目 | ```scrapy startproject <project_name>``` |
| version | 全局 | 打印scrapy版本 | ```scrapy version [-v]``` |
| view | 全局 | Fetch a URL using the Scrapy downloader and show its contents in a browser | ```scrapy view [options] <url>``` |

# 部署
https://github.com/scrapy/scrapyd-client
