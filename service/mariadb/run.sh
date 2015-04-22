#!/bin/bash

VOLUME_HOME="/var/lib/mysql"

if [[ ! -d $VOLUME_HOME/mysql ]]; then
    echo "=> 选择了一个数据卷为空或未初始化的目录 $VOLUME_HOME"
    echo "=> 正在安装 MariaDB ..."
    mysql_install_db --user=mysql> /dev/null 2>&1
    echo "=> 安装完成!"  
    ./create_mariadb_admin_user.sh
else
    echo "=> 使用一个已经存在的 MariaDB 数据卷"
fi

exec mysqld_safe