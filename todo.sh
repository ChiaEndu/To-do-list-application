#!/bin/bash

# Identify tasks file 
TASK_FILE="tasks.txt"

case "$1" in
add)
if [ -z "$2" ]; then       # -z means string is empty
echo "no task added"
exit 1

fi
# Add task

echo "$2" >> "$TASK_FILE"      # "$2" is the second argument
echo "task added: $2"
;;
# list task
list) 
if [ ! -s "$TASK_FILE" ]; then
echo "no tasks"
else
echo "to do list"
fi
nl -w1 -s". " "$TASK_FILE"       # nl is the number line, w1 is the width
;;
# remove tasks

delete)
if [ -z "$2" ]; then
echo "task number"
exit 1                             # exit 1 = if condition is true, the script terminates with status 1
fi
sed -i'' "${2}d" "$TASK_FILE"
echo "deleted task: $2"               # ${2}d  sed command for delete
;;
*)
echo "usage: ./todo.sh add \"task description\""
    echo "   ./todo.sh to do list"
    echo "   ./todo.sh delete"
;;
esac
