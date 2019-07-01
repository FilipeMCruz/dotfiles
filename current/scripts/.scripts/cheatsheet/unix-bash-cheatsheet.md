# TOC
###### [Basic](#Basic)
###### [Shortcuts](#Shortcuts)
###### [File & Folder Manipulation](#File%20&%20Folder%20Manipulation)
###### [Directory & Navigation](#Directory%20&%20Navigation)
###### [Jobs](#Jobs)
###### [I/O Redirection](#I/O%20Redirection)
###### [SSH](#SSH)
###### [Network](#Network)
###### [User and Group](#User%20and%20Group)
###### [System](#System)
###### [Storage](#Storage)
###### [History](#History)
###### [Other Shell Features](#Other%20Shell%20Features)





# Basic
## At start of line, indicates a comment.
    #
## Run cmd1, then if cmd1 successful run cmd2, otherwise skip.
cmd1 && cmd2
## Run cmd1, then if cmd1 not successful run cmd2, otherwise skip.
cmd1 || cmd2
## Do cmd1 and then cmd2.
cmd1; cmd2
## Do cmd1, start cmd2 without waiting for cmd1 to finish.
cmd1 & cmd2
## clears content on window (hide displayed lines)
clear
## shows the manual for specified command
man <command>

# Shortcuts
## halts the current command
Ctrl+C
## stops the current command, resume with fg in the foreground or bg in the background
Ctrl+Z
## Delete the current word / argument left of the cursor
Ctrl+W
## cuts everything before the cursor
Ctrl+U
## search previous typed commands
Ctrl+R
## log out of current session
exit
Ctrl+D
## full window program
cmd+up
## not full window program
cmd+down
## undo
ctrl+_
## swap two characters
ctrl+t
## swap two words
ALT+t
## prints last argument from previous command
ALT+.
## expand glob/star
ctrl+x+*
## move forward a word
ctrl+arrow
## move forward a word
ALT+f
## move backward a word
ALT+b
## opens the command string in an editor so that you can edit it before execution
ctrl+x+ctrl+e
## move to the opposite end of the line
ctrl+xx
## cuts everything after the cursor
ctrl+k
## pastes from the buffer
ctrl+y
## clears screen and redisplay the line
CTRL+L
## same as RETURN
CTRL+J
## same as RETURN
CTRL+M
## next line in command history
CTRL+N
## same as RETURN, then displays next line in history file
CTRL+O
## previous line in command history
CTRL+P
## searches forward
CTRL+S
## lists the possible filename completefions of the current word
CTRL+X
## Move to beginning of line
Ctrl+A
## Move to end of line
Ctrl+E

# Directory & Navigation
## create a new directory
mkdir <dirname>
## changes to home
cd
## changes directory
cd <dirname>
## tells you where you currently are
pwd
## Go to previous directory
cd -
## delete directory dir
sudo rm -r dir
## force remove directory dir *
sudo rm -rf dir
## copy dir1 to dir2; create dir2 if it doesn't exist
cp -r dir1 dir2
## Finds a file/directory
find filename dir
Find files from root rirectory
  find / -name wordToFind*
List files that match the reg. exp. from current folder
  find . -name wordToFInd
## Shows the location of a file
whereis filename
## Shows the location of a file if it is in your PATH
which filename


# Jobs
  Step 1, write in the terminal:  at <timeOfExecution> ENTER  ex --> at 16:45 or at 13:43 7/23/11 (to be more precise)  or after a certain delay:  at now +5 minutes (hours, days, weeks, months, years)   Step 2: <ENTER COMMAND> ENTER  repeat step 2 as many times you need  Step 3: CTRL D to close input  atq = show a list of jobs waiting to be executed  atrm = delete a job n.<x>  ex (delete job #42) --> atrm 42  sleep = pause between commands  with ";" you can chain commands, ex:  touch file; rm file  you can make a pause between commands (minutes, hours, dys)  ex --> touch file; sleep 10; rm file <-- 10 seconds
## execute a command regularly
crontab
## modify the crontab
crontab -e
## view current crontab
crontab -1
## delete you crontab
crontab -r
## Crontab syntax
<Minutes> <Hours> <Day of month> <Day of week (0-6, 0 = Sunday)> <COMMAD>
## ex, create the file movies.txt every day at 15:47
47 15 * * * touch /home/bob/movies.txt
## every minute
* * * * *
## at 5:30 in the morning,from the 1st to 15th each month:
30 5 1-15 * *
## at midnight on Mondays, Wednesdays and Thursdays:
0 0 * * 1,3,4
## Execute programs in the background
## Add a '&' at the end of a command
cp bigMovieFile.mp4 &
## nohup: ignores the HUP signal when closing the console (process will still run if the terminal is closed)
nohup cp bigMovieFile.mp4
## lists all jobs / what is running in the background (use with -l to see associated PID)
jobs
## put a background process to foreground
fg (process 1), f%2 (process 2) f%3, ...
## lists stopped or background jobs ; resume a stopped job in the background
bg
## brings the most recent job in the foreground
fg
## brings job to the foreground
fg <job>
  To suspend a job, type CTRL+Z while it is running. You can also suspend a job with CTRL+Y.
  This is slightly different from CTRL+Z in that the process is only stopped when it attempts to read input from terminal.
  Of course, to interupt a job, type CTRL+C.
## runs job in the background and prompts back the shell
myCommand &
## brings most recently invoked background job
fg %+
## brings second most recently invoked background job
fg %-
## brings job number N
fg %N
## brings job whose command begins with string
fg %string
## brings job whose command contains string
fg %?string
## removes the process from the list of jobs
disown <PID|JID>
## waits until all background jobs have finished
wait
## brings job n to the foreground
fg n
## Scheduling a shutdown
### wait 60 mins before starting the shutdown
  sudo shutdown -P +60
### shutdown at 1 AM
  sudo shutdown -P 1:00
### Cancel a pending shutdown
  sudo shutdown -c
## Run command at specific time
echo "ls -l" | at 07:00


# I/O Redirection
## Output of pgm is redirected to file.
pgm > file
python hello.py > output.txt
## Program pgm reads its input from file. (takes standard input from file)
pgm < file
## feed foo.txt to stdin for python
python hello.py < foo.txt
## Output of pgm is appended to file.
pgm >> file
python hello.py >> output.txt
## Output of pgm1 is piped into pgm2 as the input to pgm2.
pgm1 | pgm2
## Standard input comes from here through next tag at start of line.
<< tag
## Note that file descriptor 0 is normally standard input, 1 is standard output, and 2 is standard error output.
## forces standard output to file even if noclobber is set
>|file
## forces output to file from file descriptor n even if noclobber is set
n>|file
## uses file as both standard input and standard output
<> file
## uses file as both input and output for file descriptor n
n<>file
## Merge output from stream n with stream m.
n >& m
## Merge input from stream n with stream m.
n <& m
## duplicates standard output to file descriptor n
n>&
## duplicates standard input from file descriptor n
n<&
## directs standard output and standard error to file
&>file
## closes the standard input
<&-
## closes the standard output
>&-
## closes the ouput from file descriptor n
n>&-
## closes the input from file descripor n
n<&-
## stderr to (file)
python hello.py 2> error.log
python hello.py 2>/dev/null
## stderr to stdout
python hello.py 2>&1
## stdout and stderr to (null)
python hello.py &>/dev/null

# SSH
## connects to host as user
ssh user@host
## connects to host on specified port as user
ssh -p <port> user@host
## adds your ssh key to host for user to enable a keyed or passwordless login
ssh-copy-id user@host

# Network
## displays whois online
w
## pings host and outputs results
ping <host>
## gets whois information for domain
whois <domain>
## gets DNS information for domain
dig <domain>
## reverses lookup host
dig -x <host>
## downloads file
wget <file>
## ping host and output results
ping host
## continue a stopped download
wget -c file


# User and Group
## who you are logged in as
whoami
## lets you change your password
passwd
## displays information about user
finger <user>
    Example: Display information about the user ch. Output will appear similar to the following:
      finger -p ch
      Login name: admin In real life: Computer Hope On since Feb 11 23:37:16 on pts/7 from domain.computerhope.com 28 seconds Idle Time Unread mail since Mon Feb 12 00:22:52 2001
## lists your last logins
last <yourUsername>
## User and Group Quotas
Definition
  The user and group quotas provide the mechanisms by which the amount of space used by a single user or all users within a specific group can be limited to a value defined by the administrator.
        - Soft Limit − If the user exceeds the limit defined, there is a grace period that allows the user to free up some space.
        - Hard Limit − When the hard limit is reached, regardless of the grace period, no further files or blocks can be allocated.
## Displays disk usage and limits for a user of group
quota
## This is a quota editor. Users or Groups quota can be edited using this command
edquota
## Scans a filesystem for disk usage, creates, checks and repairs quota files
quotacheck
## This is a command line quota editor
setquota
## This announces to the system that disk quotas should be enabled on one or more filesystems
quotaon
## This announces to the system that disk quotas should be disabled for one or more filesystems
quotaoff
## This prints a summary of the disc usage and quotas for the specified file systems
repquota
## list all users available
who
## root creates new user
sudo adduser bob
## change a user's password
sudo passwd <AccountName>
## Delete an account
sudo deluser <AccountName>
## reate a new user group
addgroup friends
## delete a user group
delgroup friends
## add user to a group
usermod -g friends <Account>
## change account name
usermod -g bob boby
## add groups to a user without loosing the ones he's already in
usermod -aG friends bob


# System
## shows kernel information
uname -a
## Memory & Process Management
### cpu information
  cat /proc/cpuinfo
### memory information
  cat /proc/meminfo
### show memory and swap usage
  free
### process's from current user
  ps -u yourusername
### kill all processes with the name
  killall <processname>
### displays your currently active processes dinamically
  top
### prints process ID of the current shell
  echo $$
### prints process ID of the most recently invoked background job
  echo $!
### returns a list of all signals on the system, by name and number
  kill -l
### terminates process with specified PID
  kill <PID>
### selects all processes with a tty except session leaders
  ps -a
### executes a command when a signal is received by the script
  trap cmd sig1 sig2
### ignores that signals
  trap "" sig1 sig2
### resets the action taken when the signal is received to the default
  trap - sig1 sig2
### display your currently active processes
  ps
### List processes sorted
  ps aux --sort -rss
### display all running processes
  top
### select all processes
  ps -e
### kill process
  killall UnResponsiveProg
### Kill all processes matching the string "unresponsiveprog" (ignoring the difference between upper- ## lowercase letters)
  killall -I unresponsiveprog
### violent kill
  kill -9 <PID>
### graphic representation of system load average (quit with CTRL C)
  tload
### View and Manage Processes
  htop
### Suspend and send to background
  Ctrl + z
  Then
    bg
### Get a process back to the foreground again
  fg
## Date & Time
### shows the current date and time
  date
### shows current uptime
  uptime
### show this month's calendar
  cal
### show current uptime
  uptime
### List current day Events (calendar)
  calendar
### Output date
  ex: 12-Mar-2004
    date +%d-%b-%Y
  today=$(date +%d-%b-%Y) && echo $today
  If it's 9 am, then it will show 09
    date “+%H”
## Applications
### show possible locations of app
  whereis app
### show which app will be run by default
  which app
### list all directories were installation script might added files
  grep -P '("|/)\S+/\S+' setup.sh
### run a program/app
  sudo %program%
  sudo program -l
### remove application
  sudo apt-get remove <application_name>
### When software is available in the repositories:
  sudo apt-get install <nameOfSoftware>
  ex
    sudo apt-get install aptitude
### downloaded package
  sudo dpkg --install
  ex
    sudo dpkg --install megasync-xUbuntu_17.04_amd64.deb
### If you download it from the Internets in .gz format
  (or bz2) - “Compiling from source”
  Step 1, create a folder to place the file:
  mkdir /home/username/src <-- then cd to it
  Step 2, with 'ls' verify that the file is there
  (if not, mv ../file.tar.gz /home/username/src/)
  Step 3, decompress the file (if .zip: unzip <file>)
  Step 4, use 'ls', you should see a new directory
  Step 5, cd to the new directory
  Step 6.1, use ls to verify you have an INSTALL file,
  then: more INSTALL
  If you don't have an INSTALL file:
  Step 6.2, execute./configure <-- creates a makefile
  Step 6.2.1, run make <-- builds application binaries
  Step 6.2.2 : switch to root --> su
  Step 6.2.3 : make install <-- installs the software
  Step 7, read the readme file
### Install from source
  ./configure
  make
  make install
  install a package (Debian)
    dpkg -i pkg.deb
  install a package (RPM)
    rpm -Uvh pkg.rpm
## shutdown
sudo shutdown -h now
## restart
sudo shutdown -r now
## system update and upgrade
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get update && sudo apt-get upgrade
## system cleanup
sudo apt-get autoclean
sudo apt-get clean
sudo apt-get autoremove
sudo apt autoremove && sudo apt clean
## When system freezes / stops working
Alt + F2, type xkill
## firewall
### To enable the firewall
  sudo ufw enable
### disable firewall
  sudo ufw disable
### Managing UFW via GUI
  sudo apt install gufw
## Prevent system from sleeping
systemd-inhibit
## Return to normal policies after program execute
systemd-inhibit myProgram

# Storage
## Disk usage of folders, human readable
du -h
## Disk usage of files & folders, Human readable
du -ah
## Only show disc usage of folders
du -sh
## shows what your disk quota is
quota -v
## shows the disk usage of the files and directories in filename (du -s give only a total)
du <filename>
du -s
## show disk usage
df
## show directory space usage
du
The -h option makes the output easier to comprehend
du -h /etc
## (disk free) displays the disk space usage in kilobytes
df -k

# History
## Commands
### Show history
history
### Don’t execute expanded result immediately
shopt -s histverify
## Expansions
### Expand last parameter of most recent command
!$
### Expand all parameters of most recent command
!*
### Expand nth most recent command
!-n
### Expand nth command in history
!n
### Expand most recent invocation of command <command>
!<command>
## Operations
### Execute last command again
!!
    sudo !!
### Replace first occurrence of <FROM> to <TO> in most recent command
!!:s/<FROM>/<TO>/
### Replace all occurrences of <FROM> to <TO> in most recent command
!!:gs/<FROM>/<TO>/
### Expand only basename from last parameter of most recent command
!$:t
### Expand only directory from last parameter of most recent command
!$:h
  *Note: !! and !$ can be replaced with any valid expansion.*
## Slices
### Expand only nth token from most recent command (command is 0; first argument is 1)
!!:n
### Expand first argument from most recent command
!^
### Expand last token from most recent command
!$
### Expand range of tokens from most recent command
!!:n-m
### Expand nth token to last from most recent command
!!:n-$
*!! can be replaced with any valid expansion i.e. !cat, !-2, !42, etc.*
## Easily search and use the commands that you had used in the past
ctrl+r search_term


# Other Shell Features
## Command-Line Processing Cycle.
The default order for command lookup is functions, followed by built-ins, with scripts and executables last.
There are three built-ins that you can use to override this order: `command`, `builtin` and `enable`.
### removes alias and function lookup. Only built-ins and commands found in the search path are executed
      command
### looks up only built-in commands, ignoring functions and commands found in PATH
      builtin
### enables and disables shell built-ins
      enable
### takes arguments and run them through the command-line processing steps all over again
      eval
## Create command alias
cd; nano .bash_profile
> alias gentlenode='ssh admin@gentlenode.com -p 3404'  # add your alias in .bash_profile
Using alias to fix typos
  alias gerp=grep
## To quickly go to a specific directory
cd; nano .bashrc
> shopt -s cdable_vars
> export websites="/Users/mac/Documents/websites"
source .bashrc
cd websites


