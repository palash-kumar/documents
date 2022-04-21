#!/bin/expect -f

set timeout -1

# It prints same as echo in bash
send_user "@ Fetching Remote.\r"

set username "support"
set pass "bbone29sp"

set pd [lindex $argv 0];
puts "Current Working Directory: $pd\r"

spawn git branch

spawn git fetch

#expect "*sername*" {send -- "$username\n"}
#send "$username"
#expect_user -re "(.*)\n" {send -- "$pass\r";  exp_continue}
#expect "*assword*" {send -- "$pass\r"; exp_continue}

expect "*unable to access*" {puts "Could Not Resolve Host"}

puts "Fetch Done\r"
#send_user "$expect_out(Login Done,string)\n"
EXPECTEND
#expect eof
