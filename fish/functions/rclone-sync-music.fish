function rclone-sync-music --description "Back up my music archive to B2."
    if test ! -e /mnt/bulk/Music
        echo '"bulk" drive not mounted'
        exit 1
    end

    rclone sync /mnt/bulk/Music b2:vanguard-music-archive --bwlimit "08:00,3M 12:00,6M 13:00,3M 22:00,off" --progress $argv
end
