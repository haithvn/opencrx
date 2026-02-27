rem Run/Stop database
rem -----------------

if ""%1"" == ""run"" goto run
if ""%1"" == ""run-hsqldb"" goto run-hsqldb
if ""%1"" == ""stop"" goto stop
goto end

:run
start "HSQLDB (9001)" "d:\ai\research\opencrx\server\data\hsqldb\db.bat" run-hsqldb
goto end

:run-hsqldb
set JAVA_HOME=D:/dev/devtool/jdk/jdk-21.0.1
set JAVA_HOME=%JAVA_HOME:/=\%
set PATH=%JAVA_HOME%\bin;%PATH%
cd d:\ai\research\opencrx\server\data\hsqldb
"%JAVA_HOME%\bin\java.exe" -Xmx800M -cp .\hsqldb-2.7.4.jar org.hsqldb.server.Server --port 9002 --acl acl.txt --database.0 file:crx --dbname.0 CRX --trace true
goto end

:stop
set JAVA_HOME=D:/dev/devtool/jdk/jdk-21.0.1
set JAVA_HOME=%JAVA_HOME:/=\%
set PATH=%JAVA_HOME%\bin;%PATH%
cd d:\ai\research\opencrx\server\data\hsqldb
java -jar ./sqltool.jar --sql "shutdown;" --rcFile=sqltool.rc CRX
goto end

:end

exit
