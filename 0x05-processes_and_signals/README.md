# 0x05. Processes and signals

## About Bash projects

Unless stated, all your projects will be auto-corrected with Ubuntu 20.04 LTS.

---
**_ Resources Read or watch:_**

[Linux PID](http://www.linfo.org/pid.html)
[Linux process](https://www.thegeekstuff.com/2012/03/linux-processes-environment/)
[Linux signal](https://www.educative.io/answers/what-are-linux-signals)
[Process management in linux](https://www.digitalocean.com/community/tutorials/process-management-in-linux)

**man or help:**
_ ps
_ pgrep
_ pkill
_ kill
_ exit
_ trap

## Learning Objectives
At the end of this project, you are expected to be able to explain to anyone, without the help of Google:

## General

    * What is a PID
    * What is a process
    * How to find a process’ PID
    * How to kill a process
    * What is a signal
    * What are the 2 signals that cannot be ignored

## Tasks

[0. What is my PID](./0-what-is-my-pid)
Write a Bash script that displays its own PID.

[1. List your processes](./1-list_your_processes)
Write a Bash script that displays a list of currently running processes.

Requirements:
_ Must show all processes, for all users, including those which might not have a TTY
_ Display in a user-oriented format \* Show process hierarchy

[2. Show your Bash PID](./2-show_your_bash_pid)
Using your previous exercise command, write a Bash script that displays lines containing the bash word, thus allowing you to easily get the PID of your Bash process.

Requirements:
You cannot use pgrep
The third line of your script must be # shellcheck disable=SC2009 (for more info about ignoring shellcheck error)

[3. Show your Bash PID made easy](./3-show_your_bash_pid_made_easy)
Write a Bash script that displays the PID, along with the process name, of processes whose name contain the word bash.

Requirements:
You cannot use ps

[4. To infinity and beyond](./4-to_infinity_and_beyond)
Write a Bash script that displays To infinity and beyond indefinitely.

Requirements:
\*In between each iteration of the loop, add a sleep 2

[5. Don't stop me now!](./5-dont_stop_me_now)
We stopped our 4-to_infinity_and_beyond process using ctrl+c in the previous task, there is actually another way to do this.

Write a Bash script that stops 4-to_infinity_and_beyond process.

Requirements: \* You must use kill

[6. Stop me if you can](./6-stop_me_if_you_can)
Write a Bash script that stops 4-to_infinity_and_beyond process.

Requirements:
You cannot use kill or killall


[7. Highlander](./7-highlander)
Write a Bash script that displays:
_ To infinity and beyond indefinitely
_ With a sleep 2 in between each iteration \* I am invincible!!! when receiving a SIGTERM signal
Make a copy of your 6-stop_me_if_you_can script, name it 67-stop_me_if_you_can, that kills the 7-highlander process instead of the 4-to_infinity_and_beyond one.

[8. Beheaded process](./8-beheaded_process)
Write a Bash script that kills the process 7-highlander.

---

**Author** - Loyo Enock
