
List all open or active ports
```shell
netstat -a

#OUTPUT:
  TCP    127.0.0.1:55628        asimgc:55627           ESTABLISHED
  TCP    127.0.0.1:55640        pk-lappy:0             LISTENING
  TCP    127.0.0.1:55640        asimgc:57232           ESTABLISHED
  TCP    127.0.0.1:55664        pk-lappy:0             LISTENING
  TCP    127.0.0.1:55664        asimgc:57492           ESTABLISHED
```
Filter list using *find* to find specific port
```shell
netstat -a | find /i "8080"

#OUTPUT:
  TCP    0.0.0.0:8080           pk-lappy:0             LISTENING
```
Filter list using flags and *find* to find specific port with PID (Process ID)
```shell
netstat -a -n -o | find /i "8080"

#OUTPUT:
  TCP    0.0.0.0:8080           0.0.0.0:0              LISTENING       21168
  TCP    [::]:8080              [::]:0                 LISTENING       21168
```
Killing the process using the process ID
```shell
taskkill /pid 21168 /F

#OUTPUT:
SUCCESS: The process with PID 21168 has been terminated.
```
