use ./net.nu 'port kill'

# free all ports used by the firebase emulator
export def "emu kill" [] {
    let ports = [9099 5001 8080 8085 9199 5001 4400 4500 9150 4000]
    
    for port in $ports {
        port kill $port
    }
}
