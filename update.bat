@echo off
REM Simple Git automation batch file

REM Go to your project folder (palitan ang path sa repo mo)
cd /d "C:\Users\Administrator\Desktop\update"

REM Add all changes
echo Running: git add *
git add *
if %ERRORLEVEL% neq 0 (
    echo Error during git add
    pause
    exit /b %ERRORLEVEL%
)

REM Commit with current date and time
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do set DATE=%%a-%%b-%%c
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set TIME=%%a-%%b
set MSG=%DATE% %TIME%

echo Running: git commit -m "%MSG%"
git commit -m "%MSG%"
if %ERRORLEVEL% neq 0 (
    echo Error during git commit
    pause
    exit /b %ERRORLEVEL%
)

REM Push to remote
echo Running: git push
git push
if %ERRORLEVEL% neq 0 (
    echo Error during git push
    pause
    exit /b %ERRORLEVEL%
)

echo All Git commands completed successfully!
pause
