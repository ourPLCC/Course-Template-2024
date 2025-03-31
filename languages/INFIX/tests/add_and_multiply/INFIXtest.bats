#!/usr/bin/env bats

load '../../../../bin/relocate.bash'

@test "INFIX add_and_multiply" {
  skip "Intentionally not implemented"
  relocate
  plccmk -c grammar > /dev/null
  RESULT="$(rep -n < ./tests/add_and_multiply/INFIX.input)"

  expected_output=$(< "./tests/add_and_multiply/INFIX.expected")
  [[ "$RESULT" == "$expected_output" ]]

}
