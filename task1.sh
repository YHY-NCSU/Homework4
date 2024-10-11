pid=$(pgrep -f infinite.sh) 


if [ -n "$pid" ]; then
    kill $pid
    echo "Process infinite.sh (PID: $pid) has been killed."
else
    echo "Process infinite.sh is not running."
fi
