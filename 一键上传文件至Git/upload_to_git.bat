@echo off
call :print %1
:print
set filename=%~n1%~x1
set newfilename=%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%%~x1
set "newfilename=%newfilename: =0%"

rem vvvvvvv自定义vvvvvvv
set tuchuang_dir=E:\document\tuchuang\resource\
set url_base=https://raw.githubusercontent.com/Hareric/tuchuang/master/resource/
E:
cd %tuchuang_dir%
rem ^^^^^^^自定义^^^^^^^

copy /b %1 %tuchuang_dir%%newfilename%
git add .
git commit -m "%filename%->%newfilename%"
git push origin master

rem 上传成功后的文件url复制进粘贴板
echo %url_base%%newfilename% |clip
