function rclone-sync-music --description "Back up my music archive to B2."
    if test ! -e /mnt/rust/Music
        echo '"rust" drive not mounted'
        exit 1
    end

    rclone sync /mnt/rust/Music b2:vanguard-music-archive --bwlimit "08:00,1M 12:00,2M 13:00,1M 22:00,off" --progress $argv
end
