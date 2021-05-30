# 事前準備

```
mkdir ~/.m2
mkdir ./backend/src
cd ./backend/src
git clone git clone git@github.com:Kimita/cd-test-for-springboot.git spring-boot-demo
cd spring-boot-demo
git checkout dev
cd ../../..
cp ./.env.example ./.env
echo "OWNER_USER_ID=`id -u`" >> ./.env
echo "M2_DIR=${HOME}/.m2" >> ./.env
```

# 実行

```
make init
make log-tomcat-watch
...
Ctrl-C


# デプロイ

## ビルド済みWarファイルを展開する場合

docker cp ./backend/src/spring-boot-demo/target/demo.war tomcat-mysql-on-docker_tomcat_1:/usr/local/tomcat/webapps/demo.war

## 手動でWarのビルドからやる場合

make builder
mvn package spring-boot:repackage -Pdevelopment
exit
docker cp ./backend/src/spring-boot-demo/target/demo.war tomcat-mysql-on-docker_tomcat_1:/usr/local/tomcat/webapps/demo.war

```
