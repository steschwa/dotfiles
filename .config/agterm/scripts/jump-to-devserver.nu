#!/opt/homebrew/bin/nu

const FILE = "/tmp/reonic-devserver-agterm-session"

if ($FILE | path exists) {
  agtermctl session select --target (open --raw $FILE | str trim) --socket $env.AGT_SOCKET
}
