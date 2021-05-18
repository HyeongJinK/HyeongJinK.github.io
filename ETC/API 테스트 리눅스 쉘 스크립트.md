---
sort: 3
---


```bash
#!/usr/bin/env bash
# https://curl.haxx.se/download.html
# https://stedolan.github.io/jq/download/
# 위에 두개 설치 필요

: ${HOST=localhost}
: ${PORT=7101}

function assertCurl() {
  local expectedHttpCode=$1
  local curlCmd="$2 -w \"%{http_code}\""
  local result=$(eval $curlCmd)
  local httpCode="${result:(-3)}"
  RESPONSE='' && (( ${#result} > 3 )) && RESPONSE="${result%???}"

  if [ "$httpCode" = "$expectedHttpCode" ]
  then
    if [ "$httpCode" = "200" ]
    then
      echo "Test OK (HTTP Code: $httpCode)"
    else
      echo "Test OK (HTTP Code: $httpCode, $RESPONSE)"
    fi
  else
      echo  "Test FAILED, EXPECTED HTTP Code: $expectedHttpCode, GOT: $httpCode, WILL ABORT!"
      echo  "- Failing command: $curlCmd"
      echo  "- Response Body: $RESPONSE"
      exit 1
  fi
}

function assertEqual() {
  local expected=$1
  local actual=$2

  if [ "$actual" = "$expected" ]
  then
    echo "Test OK (actual value: $actual)"
  else
    echo "Test FAILED, EXPECTED VALUE: $expected, ACTUAL VALUE: $actual, WILL ABORT"
    exit 1
  fi
}
set -e

echo "HOST=${HOST}"
echo "PORT=${PORT}"


assertCurl 200 "curl http://$HOST:$PORT/company/user/-11 -s"
echo $RESPONSE
assertEqual "\"None_Company\"" $(echo $RESPONSE | jq .message)
assertEqual "\"-11\"" $(echo $RESPONSE | jq .userIdx)

echo $(echo $RESPONSE | jq .message)
```