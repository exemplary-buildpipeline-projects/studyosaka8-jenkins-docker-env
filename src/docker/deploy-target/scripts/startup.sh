#!/bin/bash

# デタッチ時に走ることを期待したスクリプト。
# 「最初に一回」の処理に対しては冪等性を考慮し、記述すること。
# author : kazuhito_m

# サービス開始(二回目以降はリスタート)
service ssh restart

# MySql再起動

# DBが行方不明だっつーエラーを吐きやがるので、事前に教ええる
mysql_install_db --datadir=/var/lib/mysql --user=mysql
service mysql restart

# Dockerfileサイドで「root:rootをパスワードに設定」ってやってるはずなのに…rootをnonpassで通しやがる。TODOや

# mysqlに外から入れるよう設定(二回目以降も権限系だけはふり直す)
mysql --user=root --password=root -e 'CREATE DATABASE IF NOT EXISTS odf_edit_sample;
  GRANT ALL PRIVILEGES ON *.* TO databaseuser@"%.%.%.%" IDENTIFIED BY "databasepassword";
  GRANT ALL PRIVILEGES ON *.* TO databaseuser@"localhost" IDENTIFIED BY "databasepassword";
  GRANT ALL PRIVILEGES ON *.* TO root@"%.%.%.%" IDENTIFIED BY "root";
  GRANT ALL PRIVILEGES ON *.* TO root@"localhost" IDENTIFIED BY "root";'

# Dockerの外をマウントしているのを期待しているディレクトリ `/tmp/app_import` から、SpringBootのJarを取得する。
mkdir -p /tmp/deploy
cp /tmp/app_import/*.jar /tmp/deploy/app.jar

# SpringBootアプリ起動(エンドレス挙動兼ねる)
java -jar /tmp/deploy/app.jar
