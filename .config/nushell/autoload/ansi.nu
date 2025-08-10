def "ansi table" [] {
    print --no-newline "Standard:\t"
    print --raw --no-newline $"\e[40;37m   0 (ansi reset)"
    print --raw --no-newline $"\e[41;30m   1 (ansi reset)"
    print --raw --no-newline $"\e[42;30m   2 (ansi reset)"
    print --raw --no-newline $"\e[43;30m   3 (ansi reset)"
    print --raw --no-newline $"\e[44;30m   4 (ansi reset)"
    print --raw --no-newline $"\e[45;30m   5 (ansi reset)"
    print --raw --no-newline $"\e[46;30m   6 (ansi reset)"
    print --raw $"\e[47;30m   7 (ansi reset)"

    print ""

    print --no-newline "Bright:\t\t"
    print --raw --no-newline $"\e[100;37m   8 (ansi reset)"
    print --raw --no-newline $"\e[101;30m   9 (ansi reset)"
    print --raw --no-newline $"\e[102;30m  10 (ansi reset)"
    print --raw --no-newline $"\e[103;30m  11 (ansi reset)"
    print --raw --no-newline $"\e[104;30m  12 (ansi reset)"
    print --raw --no-newline $"\e[105;30m  13 (ansi reset)"
    print --raw --no-newline $"\e[106;30m  14 (ansi reset)"
    print --raw $"\e[107;30m  15 (ansi reset)"

    print ""
    
    print --no-newline "Grays:\t\t"
    for i in 232..239 {
        print --raw --no-newline $"\e[48;5;($i)m\e[37m ($i) (ansi reset)"
    }
    print --no-newline "\n\t\t"
    for i in 240..247 {
        print --raw --no-newline $"\e[48;5;($i)m\e[37m ($i) (ansi reset)"
    }
    print --no-newline "\n\t\t"
    for i in 248..255 {
        print --raw --no-newline $"\e[48;5;($i)m\e[30m ($i) (ansi reset)"
    }
}
