#!/usr/bin/env bats

load '../../../../bin/relocate.bash'

@test "REFCONT odd_even" {
  relocate
  plccmk -c grammar > /dev/null
  RESULT="$(rep -n < ./tests/odd_even/REFCONT.input)"

  expected_output=$(< "./tests/odd_even/REFCONT.expected")
  [[ "$RESULT" == "$expected_output" ]]

}
