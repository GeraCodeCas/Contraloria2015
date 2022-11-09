REM Deployment in Apache WWW server...
xcopy /R /Y siere.jar \oracle\ora92\Apache\Apache\htdocs\WEB-INF\lib
xcopy /R /Y siere.jar \oracle\ora92\Apache\Apache\htdocs\siere\Gobierno\WEB-INF\lib
REM Deployment in IIS WWW server...
REM xcopy /R /Y siere.jar \inetpub\wwwroot\siere\

REM Los directorios siguientes deben crearse, JBuilder no permite
REM que un archivo bat tenga fallas para poder ejecutar un proyecto.
REM por lo tanto estan comentadas las lineas de md siguientes porque
REM al no poder se crear porque ya han sido creadas marca error, ;).

REM md C:\GobiernoData\Attachment
REM md C:\GobiernoData\History
REM md C:\GobiernoData\Imagenes
REM md C:\GobiernoData\Temp
REM md C:\GobiernoData\XCargaMasiva
REM md C:\GobiernoData\Attachment\WEB-INF
REM md C:\GobiernoData\Attachment\WEB-INF\tmp
REM md C:\GobiernoData\History\WAttachment
REM md C:\GobiernoData\History\WEB-INF
REM md C:\GobiernoData\History\WOAttachment
REM md C:\GobiernoData\History\WEB-INF\tmp
REM md C:\GobiernoData\Imagenes\WEB-INF
REM md C:\GobiernoData\Imagenes\WEB-INF\tmp
REM md C:\GobiernoData\Temp\WEB-INF
REM md C:\GobiernoData\Temp\WEB-INF\tmp

