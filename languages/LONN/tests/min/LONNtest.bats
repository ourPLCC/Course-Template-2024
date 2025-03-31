#!/usr/bin/env bats

load '../../../../bin/relocate.bash'

@test "LONN min" {
  skip "Intentionally not implemented"
  relocate
  plccmk -c grammar > /dev/null
  RESULT="$(rep -n < ./tests/min/LONN.input)"

  expected_output=$(< "./tests/min/LONN.expected")
  [[ "$RESULT" == "$expected_output" ]]

}
