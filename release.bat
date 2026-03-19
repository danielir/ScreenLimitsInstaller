@echo off
setlocal

set /p VERSION="Version (e.g. 1.0.0): "
set /p NOTES="Release notes: "

echo.
echo Creating release v%VERSION%...

git tag v%VERSION%
if errorlevel 1 (
    echo Tag already exists or git error.
    exit /b 1
)

git push origin v%VERSION%
if errorlevel 1 (
    echo Push tag failed.
    exit /b 1
)

gh release create v%VERSION% ScreenLimits_Setup.exe --title "v%VERSION%" --notes "%NOTES%"
if errorlevel 1 (
    echo Release creation failed.
    exit /b 1
)

echo.
echo Release v%VERSION% published successfully.
