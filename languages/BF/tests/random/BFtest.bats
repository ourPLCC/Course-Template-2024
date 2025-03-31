#!/usr/bin/env bats

load '../../../../bin/relocate.bash'

@test "BF random" {
  relocate
  plccmk -c grammar > /dev/null
  RESULT="$(rep -n < ./tests/random/BF.input)"

  expected_output=$(< "./tests/random/BF.expected")
  [[ "$RESULT" == "$expected_output" ]]

}
