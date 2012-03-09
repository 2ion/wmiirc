#!/usr/bin/lua
-- For use with the wmii window manager
-- Prints a formatted MPD playlist
--
-- CAVEATS:
-- If you're running a libmpdclient application like ncmpcpp, it will make
-- most requests to the daemon fail because it doesn't think of cutting its
-- TCP/IP connection that often.

local p=io.popen("echo 'status' | nc 127.0.0.1 6600 | grep '^song:' | cut -d' ' -f2")
local n=p:read("*l")

n = n and (n + 1) or 0
if n > 0 then
    local l=io.popen("mpc playlist | sed '/./=' | sed '/./N; s/\\n/ /' | sed '" .. n .. "s/.*/\\n&\\n/'")
    print(l:read("*a"))
    l:close()
else
    print("[mpd @ 127.0.0.1:6600] Playlist is empty")
end

p:close()
