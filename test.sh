#!/bin/bash

file1="scriptOutput.txt"
file2="testCase1.txt"


printf "Test 1: No input arguments \n"
python3 cli.py > scriptOutput.txt
if cmp -s "$file1" "$file2"; then
  printf "Test 1 passed.\n"
else
  printf "Test 1 failed.\n"
fi

file2="testCase2.txt"
printf "\nTest 2: cli.py --sourceUrl=https://raw.githubusercontent.com/peaudecastor/data-converter-take-home-test/main/sample.json \n"
python3 cli.py --sourceUrl="https://raw.githubusercontent.com/peaudecastor/data-converter-take-home-test/main/sample.json" > scriptOutput.txt
if cmp -s "$file1" "$file2"; then
    printf "Test 2 passed.\n"
else
    printf "Test 2 failed.\n"
fi

file2="testCase3.txt"
printf "\nTest 3: cli.py --sourceUrl=https://raw.githubusercontent.com/peaudecastor/data-converter-take-home-test/main/sample.json --class=injection \n"
python3 cli.py --sourceUrl=https://raw.githubusercontent.com/peaudecastor/data-converter-take-home-test/main/sample.json --class=injection> scriptOutput.txt
if cmp -s "$file1" "$file2"; then
    printf "Test 3 passed.\n"
else
    printf "Test 3 failed.\n"
fi

file2="testCase4.txt"
printf "\nTest 4: cli.py --sourceUrl=https://raw.githubusercontent.com/peaudecastor/data-converter-take-home-test/main/sample.json --repo=github.com/myorg/c \n"
python3 cli.py --sourceUrl=https://raw.githubusercontent.com/peaudecastor/data-converter-take-home-test/main/sample.json --repo=github.com/myorg/c > scriptOutput.txt
if cmp -s "$file1" "$file2"; then
    printf "Test 4 passed.\n"
else
    printf "Test 4 failed.\n"
fi

file2="testCase5.txt"
printf "\nTest 5: cli.py --sourceUrl=https://raw.githubusercontent.com/peaudecastor/data-converter-take-home-test/main/sample.json --repo=github.com/myorg/c --type==weak-crypto \n"
python3 cli.py --sourceUrl=https://raw.githubusercontent.com/peaudecastor/data-converter-take-home-test/main/sample.json --repo=github.com/myorg/c --type==weak-crypto > scriptOutput.txt
if cmp -s "$file1" "$file2"; then
    printf "Test 5 passed.\n"
else
    printf "Test 5 failed.\n"
fi

file2="testCase6.txt"
printf "\nTest 6: cli.py --sourceUrl=https://raw.githubusercontent.com/peaudecastor/data-converter-take-home-test/main/sample.json --class=injection --type==command-injection \n"
python3 cli.py --sourceUrl=https://raw.githubusercontent.com/peaudecastor/data-converter-take-home-test/main/sample.json --class=injection --type=command-injection> scriptOutput.txt
if cmp -s "$file1" "$file2"; then
    printf "Test 6 passed.\n"
else
    printf "Test 6 failed.\n"
fi
