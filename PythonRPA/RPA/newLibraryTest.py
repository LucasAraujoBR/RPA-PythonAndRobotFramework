from  iBot.browser_activities  import  *
# undetectable = True para tornar o navegador indetectável para sistemas
AntiBot PathDriver  =  "path_to_chrome_driver.exe"
Browser  =  ChromeBrowser ( PathDriver , undetectable = True )
Navegador . open ()
Browser . get ( 'https://google.com' )