#!/usr/bin/env nu

const PLUGIN_ROOT_DIR = path self | path dirname | path join .. | path expand
const HOOKS_DIR = $PLUGIN_ROOT_DIR | path join hooks | path expand

const IDLE = [
    'SessionStart',
    'Stop',
    'SessionEnd'
]

const WORKING = [
    'PreToolUse',
    'PostToolUse',
    'PostToolUseFailure',
    'PostToolBatch',
    'PreCompact',
    'PostCompact',
    'SubagentStart',
    'SubagentStop',
    'TaskCreated',
    'TaskCompleted',
    'UserPromptSubmit',
    'WorktreeCreate',
    'WorktreeRemove'
]

const BLOCKED = [
    'PermissionRequest',
    'PermissionDenied',
    'UserPromptExpansion'
]

def generate_hooks [events: list<string>, status: string] {
  let command_path = $HOOKS_DIR | path join set-kitty-status.nu

  $events
  | each {|event|
    let hook = [
      {
        hooks: [
          {
            type: command,
            command: $'($command_path) ($status)'
          }
        ]
      }
    ]  

    { $event: $hook } 
  }
  | reduce --fold {} {|it, acc| $acc | merge $it }
}

let idle_hooks = generate_hooks $IDLE 'idle'
let working_hooks = generate_hooks $WORKING 'working'
let blocked_hooks = generate_hooks $BLOCKED 'blocked'

$idle_hooks 
| merge $working_hooks 
| merge $blocked_hooks
| wrap hooks
| to json
| save -f ($HOOKS_DIR | path join hooks.json)
