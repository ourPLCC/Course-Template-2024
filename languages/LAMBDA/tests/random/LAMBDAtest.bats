#!/usr/bin/env bats

load '../../../../bin/relocate.bash'

@test "LAMBDA random" {
  relocate
  plccmk -c grammar > /dev/null
  RESULT="$(rep -n < ./tests/random/LAMBDA.input)"

  expected_output=$(< "./tests/random/LAMBDA.expected")
  [[ "$RESULT" == "$expected_output" ]]

}
