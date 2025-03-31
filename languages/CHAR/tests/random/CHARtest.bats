#!/usr/bin/env bats

load '../../../../bin/relocate.bash'

@test "CHAR scan" {
  relocate
  plccmk -c grammar > /dev/null
  RESULT="$(scan < ./tests/random/CHAR.input)"

  expected_output=$(< "./tests/random/CHAR.expected")
  [[ "$RESULT" == "$expected_output" ]]

}
