#!/usr/bin/env bats

load '../../../../bin/relocate.bash'

@test "LIST chooser" {
  relocate
  plccmk -c grammar > /dev/null
  RESULT="$(rep -n < ./tests/chooser/LIST.input)"

  expected_output=$(< "./tests/chooser/LIST.expected")
  [[ "$RESULT" == "$expected_output" ]]

}
