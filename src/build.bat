@echo off
     set PARALLEL=%NUMBER_OF_PROCESSORS%
     if "%TRAVIS_OS_NAME%" NEQ "" (
        call "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\Common7\Tools\VsDevCmd.bat"
     )
     if "%ORANGEC_HOME%" NEQ "" (
         del /Q ..\bin\*.*
         del /Q ..\lib\*.*
         del /Q ..\include\*.*
         del /Q ..\include\win32\*.*
         del /Q ..\include\sys\*.*
         del /Q omake.exe
         mingw32-make -DCOMPILER=MS clean -j:%NUMBER_OF_PROCESSORS%
         set BUILD_PROFILE=MS
         set TESTS=TRUE
         set PARALLEL=%NUMBER_OF_PROCESSORS%
     )
              cd c:\omake\src
              mkdir lib > NUL
              mingw32-make -j %PARALLEL%
                  IF %ERRORLEVEL% NEQ 0 (
                      goto error;
                  )
              copy c:\omake\src\omake\omake.exe .\
              omake -j %PARALLEL%
                  IF %ERRORLEVEL% NEQ 0 (
                      goto error;
                  )
              copy c:\omake\src\omake\omake.exe c:\omake
                  omake zip
                  IF %ERRORLEVEL% NEQ 0 (
                      goto error;
                  )
                  echo succeeded
                  goto done
:error
     echo failed
     goto done
:done
     if "%TRAVIS_OS_NAME%" NEQ "" ( exit %ERRORLEVEL% )
