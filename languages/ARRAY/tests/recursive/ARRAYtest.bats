#!/usr/bin/env bats


load '../../../../bin/relocate.bash'

@test "ARRAY recursive" {
  relocate
  plccmk -c grammar > /dev/null
  RESULT="$(rep -n < ./tests/recursive/ARRAY.input)"

  expected_output=$(< "./tests/recursive/ARRAY.expected")
  [[ "$RESULT" == "$expected_output" ]]

}
