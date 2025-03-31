#!/usr/bin/env bats

load '../../../../bin/relocate.bash'

@test "THREADCONT concurrent" {
  relocate
  plccmk -c grammar > /dev/null
  RESULT="$(rep -n < ./tests/concurrent/THREADCONT.input)"

  expected_output=$(< "./tests/concurrent/THREADCONT.expected")
  [[ "$RESULT" == "$expected_output" ]]

}
