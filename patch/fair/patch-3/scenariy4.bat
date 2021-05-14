@setlocal enabledelayedexpansion
@echo OFF
chcp 1251
echo col spoolname new_value spoolname > install_file.sql
echo select 'insatlldb_'^|^|to_char(sysdate, 'yymmdd')^|^|'.log' spoolname from dual;  >> install_file.sql
echo spool '^&spoolname' >> install_file.sql
echo set define off >> install_file.sql
echo set SQLBLANKLINES ON >> install_file.sql

subst v: "%~dp0"DB
for  /R "v:"  %%A in (*.sql ) do (
  for /F " tokens=1 delims=\@" %%I in ("%%~pnxA") do @echo -- >> install_file.sql
  for /F " tokens=1 delims=\@" %%I in ("%%~pnxA") do @echo -- >> install_file.sql
  for /F " tokens=1 delims=\@" %%I in ("%%~pnxA") do @echo prompt >> install_file.sql
  for /F " tokens=1 delims=\@" %%I in ("%%~pnxA") do @echo prompt %%I >> install_file.sql
  for /F " tokens=1 delims=\@" %%I in ("%%~pnxA") do @echo prompt ========================== >> install_file.sql
  for /F " tokens=1 delims=\@" %%I in ("%%~pnxA") do @echo prompt >> install_file.sql
  for /F " tokens=1 delims=\@" %%I in ("%%~pnxA") do @echo @@DB\%%I >> install_file.sql
)
::@@DB\%%~pnxA^|^|%%I
::/F " tokens=1 delims=\@"
subst v: /D

if exist file_.txt   del /Q file_.txt
echo spool off >> install_file.sql



