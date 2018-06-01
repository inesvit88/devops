ps -aux | awk '{print $2}' | xargs -0 echo > pids && for i in $(cat ./pids); do sudo lsof -p $i 2> /dev/null; done | grep -i "ipv4\|ipv6"
