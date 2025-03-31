#!/usr/bin/env bats

load '../../../../bin/relocate.bash'

@test "LON2 print" {
  relocate
  plccmk -c grammar > /dev/null
  RESULT="$(rep -n < ./tests/print/LON2.input)"

  expected_output=$(< "./tests/print/LON2.expected")
  [[ "$RESULT" == "$expected_output" ]]

}
