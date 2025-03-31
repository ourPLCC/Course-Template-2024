#!/usr/bin/env bats

load '../../../../bin/relocate.bash'

@test "PROP class-property" {
  relocate
  plccmk -c grammar > /dev/null
  RESULT="$(rep -n < ./tests/class-property/PROP.input)"

  expected_output=$(< "./tests/class-property/PROP.expected")
  [[ "$RESULT" == "$expected_output" ]]

}
