cd ..
cd bc-framework
echo "--------bc-framework"
git status
git pull origin master --tags
mvn install -DskipTests=true
cd ..
cd bc-workflow
echo "--------bc-workflow"
git status
git pull origin master --tags
mvn install -DskipTests=true
cd ..
cd bc-business
echo "--------bc-business"
git status
git pull origin master --tags
mvn install -DskipTests=true
cd ..
cd bc-business-workflow
echo "--------bc-business-workflow"
git status
git pull origin master --tags
cd ..
cd bc-system
echo "--------bc-system"
git status
git pull origin master --tags
ant build
cd src/main/webapp/bc
echo "--------bc-system/src/main/webapp/bc"
git status
git pull origin master --tags
cd ..
cd bc-workflow
echo "--------bc-system/src/main/webapp/bc-workflow"
git status
git pull origin master --tags
cd ..
cd bc-business
echo "--------bc-system/src/main/webapp/bc-business"
git status
git pull origin master --tags
cd ..
cd bc-business-workflow
echo "--------bc-system/src/main/webapp/bc-business-workflow"
git status
git pull origin master --tags
cd ..
cd bc-test
echo "--------bc-system/src/main/webapp/bc-test"
git status
git pull origin master --tags
cd ..
cd ui-libs
echo "--------bc-system/src/main/webapp/ui-libs"
git status
git pull origin master --tags
cd ..
cd ui-libs-demo
echo "--------bc-system/src/main/webapp/ui-libs-demo"
git status
git pull origin master --tags

cd ..
cd ..
cd ..
cd ..
mvn clean package -Pbctest