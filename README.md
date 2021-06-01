# 事前準備

```
git config --global user.email your-email@example.local
git config --global user.name "Your Name"
mkdir ~/.m2
mkdir ./backend/src
cd ./backend/src
git clone git@github.com:clap-and-whistle/cd-test-for-spring-boot-demo.git spring-boot-demo
cd spring-boot-demo
git checkout staging
cd ../../..
cp ./.env.example ./.env
echo "OWNER_USER_ID=`id -u`" >> ./.env
echo "M2_DIR=${HOME}/.m2" >> ./.env
```

# 実行


## 1. 初期化

```
make init
make log-tomcat-watch
...
Ctrl-C
```

## 2. デプロイ

### ビルド済みWarファイルを展開する場合

```
docker cp ./backend/src/spring-boot-demo/target/demo.war tomcat-mysql-on-docker_tomcat_1:/usr/local/tomcat/webapps/demo.war
```

### 手動でWarのビルドからやる場合

1. まずはDBのバックアップを取る
2. 以下にてビルドを実行する
    ```
    make builder
    git checkout staging
    git pull
    # TODO: 下記のprofile指定は暫定。staging用profileを用意でき次第直す。
    mvn package spring-boot:repackage -Dmaven.test.skip -Pdevelopment
    exit
    ```
3. 以下にてWarファイルをtomcatコンテナへ展開する
    ```
    docker cp ./backend/src/spring-boot-demo/target/demo.war tomcat-mysql-on-docker_tomcat_1:/usr/local/tomcat/webapps/demo.war
    ```
