# What does it do?
This script performs a login into an iserv account to show you the number of unread emails, the subjects and an link directing to them.

Usage
-----

For using this script you need to prepare it first. Therefore some changes need to be made in the beginning:
* `iservhost="ISERVHOST"` where ISERVHOST is like: https://demo-iserv.de/idesk/
* `lact="ACCOUNT"` where ACCOUNT is the users account like: bjoern.mueller
* `lpwd="PASSWORD"` where PASSWORD is the users password.

<b>DO NOT SAVE YOUR PASSWORD IN THIS SCRIPT IF SOMEONE ELSE COULD READ THAT, OR IF IT IS REACHABLE FROM THE INTERNET</b>

The output will be visible running `./iserv_email.sh` in the console, but before the output we see the STD-OUT from cURL. [link](http://superuser.com/questions/879581/curl-should-be-quit-but-it-returns-ever-something)

If you want the output in another script, do `emailoutput=$(./iserv_email.sh)`
To get the output into a seperate file, uncomment line 51.

Future
------

When iserv 3 is released offically and maybe has an API that will make it possible to store passwords as hash like md5. Also it could be much easier to get these information like email-data,...
<b>UPDATE</b>: Since iserv3 is available now, i am working to use their API (even if there's no documentation about :P) and build a new script to perform these tasks. It is a lot easier now; be patient :D
