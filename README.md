awk '{
    cmd = "date -d \"" $1 " " $2 "\" +%s";
    cmd | getline ts;
    close(cmd);
    if (NR > 1 && ts - prev != 1)
        print "Gap detected between", prev, "and", ts;
    prev = ts;
}' log.txt