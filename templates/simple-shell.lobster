name: example-shell-workflow
description: Example workflow for simple shell command migration

steps:
  - id: run_script
    command: bash /path/to/script.sh
    capture: output
    
  - id: check_result
    command: test -n "$run_script.output" && echo "has_output" || echo "empty"
    
  - id: notify
    command: "message.send --channel telegram --text 'Script completed'"
    condition: "$check_result.output == 'has_output'"
    approval: required
