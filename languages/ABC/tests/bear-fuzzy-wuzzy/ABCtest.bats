#!/usr/bin/env bats

load '../../../../bin/relocate.bash'

@test "ABC bear-fuzzy-wuzzy" {
  relocate
  plcc grammar
  javac -cp abcdatalog.jar Java/*.java
  RESULT="$(java -cp abcdatalog.jar:Java Rep -n < ./tests/bear-fuzzy-wuzzy/ABC.input)"
  expected_output=$(< "./tests/bear-fuzzy-wuzzy/ABC.expected")
  expected_output2=$(< "./tests/bear-fuzzy-wuzzy/ABC.expected2")
  [[ "$RESULT" == "$expected_output" || "$RESULT" == "$expected_output2" ]]
}
