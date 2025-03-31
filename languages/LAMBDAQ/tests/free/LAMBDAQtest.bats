#!/usr/bin/env bats

load '../../../../bin/relocate.bash'

@test "LAMBDAQ occurs_free" {
  relocate
  plccmk -c grammar > /dev/null
  RESULT="$(rep -n < ./tests/free/LAMBDAQ.input)"

  expected_output=$(< "./tests/free/LAMBDAQ.expected")
  [[ "$RESULT" == "$expected_output" ]]

}
