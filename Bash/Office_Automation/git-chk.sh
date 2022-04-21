#!/bin/bash
#!/usr/bin/expect -f

set pass "bbone29sp"
set username "support"

spawn git fetch
expect "Username " {send "$username\r"}
#send "$username"
expect "Password " {send "$pass\r"}

set WORKTREE /home/maestro/maXimErp-production

set CHANGED [exec git --work-tree=${WORKTREE} status --porcelain]
puts "\n$CHANGED\n"

if {$CHANGED ne ""} {
  puts "\n# UPDATE REQUIRED";
  spawn git pull; 
  expect "Username " {send "$username\r"}
  expect "Password " {send "$pass\r"}

 # puts "\n$GIT"
  #if {$GIT} {
#	expect "Username " {send "$username\r"}
#	expect "Password " {send "$pass\r"}

    	puts "\n##UPDATE COMPLETE##"
 # } else {
  #  	puts "\n#CONFLICT#"
 # }

} else {
  puts "\n##UP-TO-DATE##";
}

