/var/www/example.com/Shared/log {
        size 50m
        copytruncate
        create 700 root root
        dateext
        rotate 5
        compress
}
