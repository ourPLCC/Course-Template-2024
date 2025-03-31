#!/usr/bin/env bats

load '../../../../bin/relocate.bash'

@test "GINGER ginger" {
  relocate
  plccmk -c grammar > /dev/null
  RESULT="$(rep -n < ./tests/ginger/GINGER.input)"

  expected_output=$(< "./tests/ginger/GINGER.expected")
  [[ "$RESULT" == "$expected_output" ]]

}
