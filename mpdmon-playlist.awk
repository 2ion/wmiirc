{
    if( $0 ~ /^OK MPD 0\..+$/ )
        is_status = 1
    else
        if( $0 ~ /^OK$/ )
            is_status = 0
        else
            if( is_status == 0 )
                if ( ++track == current_song )
                    print "\n",track < 10 ? "0" track : track, "\t", $0, "\n"
                else
                    print track  < 10 ? "0" track: track, "\t", $0
            else
                if( $0 ~ /^song:/ )
                    current_song = $2 + 1
}
