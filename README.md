awk '{
    cmd = "date -j -f \"%Y-%m-%d %H:%M:%S\" \"" $1 " " $2 "\" +%s";
    cmd | getline ts; 
    close(cmd);
    if (NR > 1 && ts - prev > 5)
        print "Gap detected:", prev_time, "->", $1, $2, "(Gap:", ts - prev, "seconds)";
    prev = ts;
    prev_time = $1 " " $2;
}' log.txt