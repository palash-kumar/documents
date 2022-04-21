#!/bin/expect -f

set timeout -1

# It prints same as echo in bash
# send "@ PULL\n"


set username "support"
set pass "bbone29sp"

set pd [lindex $argv 0];
puts "Current Working Directory: $pd\r"

spawn git status -uno

expect "*ahead*" {send -- "PULL: BRANCH IS AHEAD\r"}

# Pulls update from remote
#proc do_something { username pass } {
#    spawn git pull --no-edit

#    expect "*sername*" {send -- "$username\n"}

#    expect "*assword*" {send -- "$pass\r"}
#}

#set running [do_something $username $pass]
#spawn git pull --no-edit

#expect "*sername*" {send -- "$username\n"}

#expect "*assword*" {send -- "$pass\r"}

if { (spawn git pull --no-edit; expect "*sername*" {send -- "$username\n"}; expect "*assword*" {send -- "$pass\r"}) } {
    puts "You have soup!"
else {
    puts "No soup for you!"
}

puts "=>running result: $running"

expect {
    "*Already up-to-date*" {puts "UP-TO-DATE\r"}
    "*CONFLICT*" {puts "CONFLICT\r"}
}
#puts "UPDATE Complete\r"

#expect eof
EXPECTEND

