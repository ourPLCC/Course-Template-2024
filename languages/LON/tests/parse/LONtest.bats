#!/usr/bin/env bats

load '../../../../bin/relocate.bash'

@test "LON parse" {
  relocate
  plccmk -c grammar > /dev/null
  RESULT="$(parse -n < ./tests/parse/LON.input)"

  [[ "$RESULT" =~ .*OK.* ]]

}
