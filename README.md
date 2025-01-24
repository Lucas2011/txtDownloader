curl -w "Time_Namelookup: %{time_namelookup}s\nTime_Connect: %{time_connect}s\nTime_StartTransfer: %{time_starttransfer}s\nTime_Total: %{time_total}s\nSpeed_Download: %{speed_download} bytes/sec\nSize_Download: %{size_download} bytes\n" -o /dev/null -s <URL>

Time_Namelookup: 0.010s
Time_Connect: 0.020s
Time_StartTransfer: 0.050s
Time_Total: 0.100s
Speed_Download: 200000 bytes/sec
Size_Download: 20000 bytes