#!/bin/bash

# Identify tasks file
TASK_FILE="tasks.txt"

case "$1" in
add)
if [ -z "$2" ]; then
echo "no task added"
exit 1

fi
# Add task
echo "$2" >> "$TASK_FILE"
echo "task added: $2"
;;
# list task
list) 
if [ ! -s "$TASK_FILE" ]; then
echo "no tasks"
else
echo "to do list"
fi
nl -w1 -s". " "$TASK_FILE"
;;
# remove tasks

delete)
if [ -z "$2" ]; then
echo "task number"
exit 1
fi
sed -i'' "${2}d" "$TASK_FILE"
echo "deleted task: $2"
;;
*)
echo "usage: ./todo.sh add \"task description\""
    echo "   ./todo.sh to do list"
    echo "   ./todo.sh delete"
;;
esac
