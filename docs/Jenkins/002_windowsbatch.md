# Windows Batch Example


``` bat
cd %WORKSPACE%\BMD_Api 
dotnet build --configuration Release  
msdeploy.exe -verb:sync -source:contentPath="%WORKSPACE%\BMD_Api\bin\Release\net6.0" -enableRule:AppOffline -dest:contentPath="C:\inetpub\wwwroot\BMD_Api" -allowUntrusted -setParam:kind=ProviderPath,scope=contentPath,value=BMD_Api
```

