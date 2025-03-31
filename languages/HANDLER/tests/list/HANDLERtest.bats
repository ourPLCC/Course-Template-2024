#!/usr/bin/env bats

load '../../../../bin/relocate.bash'

@test "HANDLER list" {
  relocate
  plccmk -c grammar > /dev/null
  RESULT="$(rep -n < ./tests/list/HANDLER.input)"

  expected_output=$(< "./tests/list/HANDLER.expected")
  [[ "$RESULT" == "$expected_output" ]]

}
