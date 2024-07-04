# get the device's ipv4 address
export def ip [] {
    ifconfig en0 
    | lines 
    | str trim 
    | find -r 'inet\s' 
    | parse --regex 'inet (?<ip>[\d\.]+)' 
    | first 
    | get ip
}

# check if a given port is open (listening for connections)
export def "port open" [
    port: int # port to scan
    --host = "localhost" # host to connect to
] {
    nc -vz $host $port
}

# check if the given port is in use
export def "port used" [
    port: int # port to scan
] {
    lsof -ni $":($port)" | parse-lsof | uniq-by pid
}

# kill the processes that use the given port with the signal specified by --signal
export def "port kill" [
    port: int # port to kill
    --signal (-s) = 9 # signal to send (default 9 => SIGKILL)
] {
    let pids = (lsof -ni $":($port)" | parse-lsof | get pid  | uniq)

    for pid in ($pids | enumerate) {
        let prefix = $"pid:($pid.item) - "

        try {
            kill -s $signal ($pid.item | into int)
            print $"(ansi green)($prefix)killed(ansi reset)"
        } catch { |err|
            print $"(ansi red)($prefix)($err.msg)(ansi reset)"
        }
    }
}

def parse-lsof [] {
    lines
    | skip 1
    | split column --regex '\s+' command pid user fd type 
    | reject fd
}
