#!/usr/bin/expect -f

set IP [lindex $argv 0]
set USER root
set Password 123456
set PORT 22


# 根据 IP 段匹配设置密码
if {[string match "10.68.*" $IP]} {
    set Password "admin@1234"
} elseif {[string match "jms.baidu.com" $IP]} {
    set USER kane
    set Password "3456789@1234"
    set PORT 2222
} 

spawn ssh $USER@$IP -p$PORT

expect {
    "*yes/no" {
        send "yes\r"
        exp_continue
    }

    "*assword:" {
        send "$Password\r"
    }
}

interact