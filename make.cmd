@ECHO OFF

:: The name of the presentation file
SET FILENAME=prezentacia

CLS
COLOR 0a

ECHO === Compile of '%FILENAME%.tex' has started ===
pdflatex %FILENAME%.tex

IF %errorlevel% NEQ 0 (
    ECHO !!! Compilation failed !!!
    EXIT /B %errorlevel%
)

DEL %FILENAME%.aux %FILENAME%.out %FILENAME%.log %FILENAME%.nav %FILENAME%.snm %FILENAME%.vrb >NUL 2>&1

pdflatex %FILENAME%.tex

IF %errorlevel% NEQ 0 (
    ECHO !!! Compilation failed !!!
    EXIT /B %errorlevel%
)
DEL %FILENAME%.aux %FILENAME%.out %FILENAME%.log %FILENAME%.nav %FILENAME%.snm %FILENAME%.toc %FILENAME%.vrb >NUL 2>&1

ECHO Compilation was successful

ECHO File %FILENAME%.pdf has been created
