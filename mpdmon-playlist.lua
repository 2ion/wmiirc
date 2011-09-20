#!/usr/bin/lua
-- For use with the wmii window manager
-- Prints a formatted MPD playlist

local p=io.popen("echo 'status' | nc 127.0.0.1 6600 | grep '^song:' | cut -d' ' -f2")
local n=p:read("*l")

n = n and (n + 1) or 0
if n > 0 then
    l=io.popen("mpc playlist | sed '/./=' | sed '/./N; s/\\n/ /' | sed '" .. n .. "s/.*/\\n&\\n/'")
    print(l:read("*a"))
    l:close()
else
    print("mpdmon: Playlist empty or connection error.")
end

p:close()
