**bash** stands for 'Born Again Shell'

View list of shells installed. 

```shell
cat /etc/shells
```
To check which shell is currently being used:

```shell
echo $SHELL
```

Changing shell.

```shell
sudo su - # get into sudo mode

usermod -s /bin/zhs pk # Set the shell you want to use for the user

# than login again.. 
```

To check which user is using which shell 

```shell
grep bash /etc/passwd
```

> File created 1_hello.sh
> Running a bash file can be achieved in two ways. 
> * run using bash 1_hello.sh
> * run using ./1_hello.sh
> But to run './1_hello.sh' it's required to convert the file to bash using *#!/bin/bash* and make the file executable.

To run the file more efficiently add the directory (*where shell scripts are kept and you want to execute just with the file name*) to the path.

```shell
export PATH=$PATH:/mnt/f/GIT_Docs/documents/Bash/scripts
```

> File created cores.sh
> To print number of CPU cores **nproc**

### M-2
**Variables**
> Bash does not have data types.

```shell
➜  scripts git:(master) ✗ age=24
➜  scripts git:(master) ✗ echo $age
24
➜  scripts git:(master) ✗ age='No Idea'
➜  scripts git:(master) ✗ echo $age
No Idea
```
From above example it we can see that the variable *age* is declared and initiated as 24, and later on the same variable was assigned a string value, and provided output without any exception.

**Constant Variables**
In bash a constant variable is declared by using a keyword *readonly*

```shell
➜  scripts git:(master) ✗ readonly pi=3.1416
➜  scripts git:(master) ✗ echo $pi
3.1416
➜  scripts git:(master) ✗ pi=3.14159
zsh: read-only variable: pi
```
As it can be seen that the value of *pi* canot be chaged once it was declared with *readonly* keyword.

**Command Substitution**
We can substitute the command with a variable by declaring the command to a variable. But to declare a command to a variable we have to follow some syntax. The syntax are **$(command)** and **`command`**

```shell
➜  scripts git:(master) ✗ date
Wed Sep 22 13:56:11 +06 2021
➜  scripts git:(master) ✗ today=$(date)
➜  scripts git:(master) ✗ echo $today
Wed Sep 22 13:56:22 +06 2021
➜  scripts git:(master) ✗ calender=`cal 2021`
➜  scripts git:(master) ✗ echo $calender
```

In command substitution it's better to use **$(command)** as it supports nested commands.

**Bash Challenge #2:**
Print Calendar of a given year
Create a bash script named cal.sh that would display the calendar of given year.

The script would prompt the user to enter a year; then, it would display the corresponding year’s calendar.

Hint: Use the cal command.

> File created cal.sh
```shell
#!/bin/bash

echo "Please Enter a Year"

read yr

cal "$yr"
```
### M-3
**Passing one Argument to script**
The following is a general script to count number of lines in a file. Which prompts the user to provide a filename than it counts number of lines in the give filename and echo's the output:

> File created count_lines_prompt.sh

```shell
#!/bin/bash

echo -n "Please Enter a Filename"

read filename

nlines=$(wc -l < $filename)

echo "There are $nlines in $filename"
```

Here is the revised code to read number of lines in the file where insetead of promting the user to provide a filename the filename is actually passed as an argument.

> File created count_lines.sh

```shell
#!/bin/bash

nlines=$(wc -l < $1)

echo "There are $nlines in $1"
```

Here *$1* represents the first argument provided.

**Passing Multiple Argument to script**
Here we will see how to manage multiple arguments, instead of reading the arguments.

> File created count_lines_multiple_args.sh

```shell
#!/bin/bash

n1=$(wc -l < $1)
n2=$(wc -l < $2)
n3=$(wc -l < $3)

echo "There are $n1 in $1"
echo "There are $n2 in $2"
echo "There are $n3 in $3"
```

**Getting creative with arguments**
In this section we will get familier with the usage of shell script command, where we can turn the complex commands to a simple script and make it simple.

> File created find.sh

```shell
#!/bin/bash

find / -iname $1 2> /dev/null
```

In the above script *find* is the command we will be using and */* is the path where it should start finding and *$1* is the argument; and **2> /dev/null** is used to redirect the errors to nowhere.  

**Special Bash Variables**

| Special Variable | Description |
| ----------- | ----------- |
| $0 |The name of the bash script|
| $1, $2, ... $n| The bash script arguments. |
| $$ | The process ID of the current shell |
| $# | The total number of argumnets passed to the script|
| $@ | The value of all arguments passed to the script |
| $? | The exit status of the last executed command |
| $! | The process id of the last executed command |