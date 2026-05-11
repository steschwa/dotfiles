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

def generate_hook_by_event [event: string, status: string] {
  let command_path = $HOOKS_DIR | path join set-kitty-status.nu

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

let idle_hooks = $IDLE 
  | each { generate_hook_by_event $in 'idle' } 
  | reduce --fold {} {|it, acc| $acc | merge $it }

let working_hooks = $WORKING 
  | each { generate_hook_by_event $in 'working' } 
  | reduce --fold {} {|it, acc| $acc | merge $it }

let blocked_hooks = $BLOCKED 
  | each { generate_hook_by_event $in 'blocked' } 
  | reduce --fold {} {|it, acc| $acc | merge $it }

let hooks_file_path = $HOOKS_DIR | path join hooks.json

$idle_hooks 
| merge $working_hooks 
| merge $blocked_hooks
| wrap hooks
| to json
| save -f $hooks_file_path
