cd ..
cd bc-framework
echo "--------bc-framework"
git status
git pull origin master
mvn install -DskipTests=true
cd ..
cd bc-business
echo "--------bc-business"
git status
git pull origin master
mvn install -DskipTests=true
cd ..
cd bc-business-dataconvert
echo "--------bc-business-dataconvert"
git status
git pull origin master
cd ..
cd bc-business-test
echo "--------bc-business-test"
git status
git pull origin master
cd ..
cd bc-system
echo "--------bc-system"
git status
git pull origin master
ant build
cd src/main/webapp/bc
echo "--------bc-system/src/main/webapp/bc"
git status
git pull origin master
cd ..
cd bc-business
echo "--------bc-system/src/main/webapp/bc-business"
git status
git pull origin master
cd ..
cd bc-test
echo "--------bc-system/src/main/webapp/bc-test"
git status
git pull origin master
cd ..
cd ui-libs
echo "--------bc-system/src/main/webapp/ui-libs"
git status
git pull origin master
cd ..
cd ui-libs-demo
echo "--------bc-system/src/main/webapp/ui-libs-demo"
git status
git pull origin master

cd ..
cd ..
cd ..
cd ..
mvn jetty:run -Djetty.port=8083 -Dapp.debug=true -Pmysql -Ddb.name=bcsystem -Ddb.type=mysql -Ddb.ip=127.0.0.1 -Ddb.username=bcsystem -Ddb.password=bcsystem