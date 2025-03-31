#!/usr/bin/env bats

load '../../../../bin/relocate.bash'

@test "RANDSCONT letrec" {
  relocate
  plccmk -c grammar > /dev/null
  RESULT="$(rep -n < ./tests/letrec/RANDSCONT.input)"

  expected_output=$(< "./tests/letrec/RANDSCONT.expected")
  [[ "$RESULT" == "$expected_output" ]]

}
