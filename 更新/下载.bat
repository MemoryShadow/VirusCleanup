@echo off 
(echo Set xPost = CreateObject^("Microsoft.XMLHTTP"^)
echo xPost.Open "GET","%1",0
echo xPost.Send^(^)
echo Set sGet = CreateObject^(^"ADODB.Stream^"^)
echo sGet.Mode = 3
echo sGet.Type = 1
echo sGet.Open^(^)
echo sGet.Write^(xPost.responseBody^)
echo sGet.SaveToFile "%2",2 )>downit.vbs 
call downit.vbs 
::del downit.vbs 