REM @echo off
if exist %1 goto Make
echo Usage: make ThesisFile.tex
goto End
:Make
latex %1
bibtex8 -H -c cp1251 %~dpn1.aux
latex %1
latex %1
dvips %~dpn1.dvi
mgs -sDEVICE=pdfwrite -DNOPAUSE -DBATCH -sOutputFile=%~dpn1.pdf %~dpn1.ps
:End