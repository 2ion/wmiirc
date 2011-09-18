#!/usr/bin/lua
-- For use with the wmii window manager
-- Prints a formatted MPD playlist

-- Get MPD's position
local p=io.popen("echo 'status' | nc 127.0.0.1 6600 | grep '^song:' | cut -d' ' -f2")

-- Read position and add 1, for mpd counts from 0, and mpc counts from 1
local n=tonumber(p:read("*l"))+1

-- Prepare our playlist
l=io.popen("mpc playlist | sed '/./=' | sed '/./N; s/\\n/ /' | sed '" .. n .. "s/.*/\\n&\\n/'")

-- Read playlist and print to stdout
print(l:read("*a"))

-- Clean up the pipes, Watson
p:close()
l:close()
