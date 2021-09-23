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

> File created **hello.sh**
> Running a bash file can be achieved in two ways. 
> * run using bash hello.sh
> * run using ./hello.sh
> But to run './hello.sh' it's required to convert the file to bash using *#!/bin/bash* and make the file executable.

To run the file more efficiently add the directory (*where shell scripts are kept and you want to execute just with the file name*) to the path.

```shell
export PATH=$PATH:/mnt/f/GIT_Docs/documents/Bash/scripts
```

> File created **cores.sh**
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
Create a bash script named *cal.sh* that would display the calendar of given year.

The script would prompt the user to enter a year; then, it would display the corresponding year’s calendar.

Hint: Use the cal command.

> File created **cal.sh**
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

> File created **count_lines.sh**

```shell
#!/bin/bash

nlines=$(wc -l < $1)

echo "There are $nlines in $1"
```

Here *$1* represents the first argument provided.

**Passing Multiple Argument to script**
Here we will see how to manage multiple arguments, instead of reading the arguments.

> File created **count_lines_multiple_args.sh**

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

> File created **find.sh**

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

> File created **special.sh**

```shell 
#!/bin/bash

echo "Name of the bash script is $0"
echo "The number of arguments is $#"
echo "The value of all argument is: $@"
```

**Bash Challenge #2:**
Convert Case
Create a bash script named *upper.sh* that would display a file content in upper case letters.

The file path must be passed to the script as an argument.

Hint: Use the *tr* command.

> File created **upper.sh**

```shell
#!/bin/bash

echo "converted contents in upper case"

tr '[:lower:]' '[:upper:]' < $1
```

### M-4 Bash Arrays

* Creating your first array
* Accessing array elements
* Adding array elements
* Deleting array elements
* creating hybrid arrays

**Creating your first array**
Generally when we are working with multiple variables it becomes cluttered with the variable declaration. Therefore using an array would be a good idea to manage multiple variables without declaring them seperately. example:

> File created **timestamp.sh**

```shell
#!/bin/bash

file1="f1.txt"
file2="f2.txt"
file3="f3.txt"
file4="f4.txt"
```

which can also be declared as an array like this :

```shell
#!/bin/bash

# Declaring an array
files=("f1.txt" "f2.txt" "f3.txt" "f4.txt")

#printing all the elements of an array.
echo ${files[*]}
```

**Accessing array elements**
In bash we access the array elements in this way *${files[0]}*. In the previous section we have created an array (*timestamp.sh*), here we will access the array elements and print them in reverse order.

As in other programming languages an *array* index starts with **0**. For example if there are 10 elements in an array *("a" "b" "c" "d" "e" "f" "g" "h" "i" "j")* so index for the first element *"a"* will be @ 0 and index for the last element will be @ 9 means array index are always *n-1*, where *n* is the total umber of elements in an array, in this case *n=10*.

> File created **reverse.sh**

```shell
#!/bin/bash

# Declaring an array
files=("f1.txt" "f2.txt" "f3.txt" "f4.txt")

# Accessing the array elements
echo ${files[3]} ${files[2]} ${files[1]} ${files[0]}
```

To display total number of elements in an array the following syntax is used *${#files[@]}*

```shell
#!/bin/bash

# Declaring an array
files=("f1.txt" "f2.txt" "f3.txt" "f4.txt")

#printing total number of elements in the array
echo "number of elements: ${#files[@]}"
# Accessing the array elements
echo ${files[3]} ${files[2]} ${files[1]} ${files[0]}
```

Changing an array element value *${files[0]}="a.txt"*

**Adding array elements**
To assign a new array element to the existing array we have to simpy pass it as an array value. 

> File created **distros.sh**
```shell
#!/bin/bash

distros=("Ubuntu" "Red Hat" "Fedora")

echo ${distros[*]}

# Adding new element to the existing array
distros+=("Kali")

echo ${distros[*]}
```

**Deleting array elements**
Deleting or removing an array element is also necessary as adding an element to the array.

> File created **numbers.sh**
```shell
#!/bin/bash

num=(1 2 3 4 5)

echo ${num[*]}

# Deleting an element from specific index
unset num[2]

echo ${num[*]}

# Deleting the whole array
unset num

echo ${num[*]}
```

> using **unset** a variable can also be unset and clear the variable.

**creating hybrid arrays**
In this section we will be creating an hybrid array.

> File created **user.sh**

```shell
#!/bin/bash

user=("Palash" 007 "sudo, developers" "bash")

echo "User Name: ${user[0]}"
echo "User ID: ${user[1]}"
echo "User Groups: ${user[2]}"
echo "User Shell: ${user[3]}"

```

**Bash Challenge #3:**
Sort an Array
Consider the following sorted.sh bash script:

```shell
#!/bin/bash
num=(1 2 3 5 4)
echo "Before sorting array num: "
echo ${num[@]}
You_code_goes_here
echo "After sorting array num: "
echo ${num[@]}
```
You need to edit the sorted.sh script so that the num array becomes sorted as you can see in the following output:

```shell
~/scripts$ ./sorted.sh
Before sorting array num:
1 2 3 5 4
After sorting array num:
1 2 3 4 5
```
Restrictions: You are only allowed to add and delete elements from the array.

Hint: Swap the last two elements of the array; use unset to delete the fourth element of array and then add it back!

> File created **user.sh**

```shell
#!/bin/bash
num=(1 2 3 5 4)
echo "Before sorting array num: "
echo ${num[@]}
num+=${num[3]}
unset num[3]
echo "After sorting array num: "
echo ${num[@]}
```

### M-5 Basic Arethmatic Operations
* Addition and Subtraction
* Multiplication and Division
* Powers and Remainders
* Celsius to Farenheit Calculator

**Addition and Subtraction**

**Multiplication and Division**

**Powers and Remainders**

**Celsius to Farenheit Calculator**

### M-6 Bash Arrays

### M-7 Bash Arrays

### M-8 Bash Arrays

### M-9 Bash Arrays

### M-10 Bash Arrays