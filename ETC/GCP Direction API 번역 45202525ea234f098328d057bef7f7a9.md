---
sort: 1
---


# GCP Direction API 번역

태그: GCP, GCP Map, 번역

Directions API를 사용하여 다음을 수행 할 수 있습니다.

- 대중 교통, 운전, 도보, 자전거 등 여러 가지 교통 수단에 대한 길 찾기를 검색합니다.
- 일련의 경유지를 사용하여 여러 부분으로 된 길 찾기를 반환합니다.
- 출발지, 목적지 및 경유지를 텍스트 문자열 (예 : "Chicago, IL"또는 "Darwin, NT, Australia"), 장소 ID 또는 위도 / 경도 좌표로 지정

API는 길 찾기를 계산할 때 가장 효율적인 경로를 반환합니다. 이동 시간은 최적화 된 주요 요소이지만 API는 가장 효율적인 경로를 결정할 때 거리, 회전 수 등과 같은 다른 요소도 고려할 수 있습니다.

## 시작하기 전에

Directions API 사용을 시작하기 전에 결제 계정과 Directions API가 사용 설정된 프로젝트가 필요합니다. 자세한 내용 [은 Cloud Console에서 설정을](https://developers.google.com/maps/documentation/embed/cloud-setup) 참조하세요 .

## Directions API 요청 작성

Directions API 요청은 다음 형식을 취합니다.

```bash
https://maps.googleapis.com/maps/api/directions/**outputFormat**?**parameters**
```

여기서 **`outputFormat`**다음 값 중 하나 일 수 있습니다 :

- **`json`:** (권장) 출력을 JSON (JavaScript Object Notation)으로 나타냅니다.
- **`xml`:** XML로 출력을 나타냅니다.

**참고** : URL 이 유효 [하려면 올바르게 인코딩](https://developers.google.com/maps/documentation/directions/web-service-best-practices#BuildingURLs) 되어야 하며 모든 웹 서비스에 대해 8192 자로 제한됩니다. URL을 구성 할 때 이 제한에 유의하십시오.

### HTTPS 또는 HTTP

HTTPS는 API 키를 사용하는 요청에 필요하며 클라이언트 ID를 사용하는 요청에 권장됩니다. HTTPS는 요청에 사용자 위치와 같은 민감한 사용자 데이터를 포함하는 애플리케이션에도 필요합니다.

### 요청 매개 변수

특정 매개 변수는 필수이고 다른 매개 변수는 선택 사항입니다. URL의 표준에 따라 모든 매개 변수는 앰퍼샌드 ( **`&`**) 문자를 사용하여 구분됩니다 . 예약 된 모든 문자 (예 : 더하기 기호 "+")는 [URL로 인코딩](https://developers.google.com/maps/documentation/directions/web-service-best-practices#BuildingURLs) 되어야합니다 . 매개 변수 목록과 가능한 값은 아래에 열거되어 있습니다.

### 필수 매개 변수

- **`origin`**

    — 길 찾기를 계산할 장소 ID, 주소 또는 텍스트 위도 / 경도 값입니다.

    - 장소 ID는 접두사로 시작해야합니다 **`place_id:`**Geocoding API 및 Places API (Place Autocomplete 포함)에서 장소 ID를 검색 할 수 있습니다. 장소 자동 완성에서 장소 ID를 사용하는 예는 장소 자동 [완성 및 길 찾기를](https://developers.google.com/maps/documentation/javascript/examples/places-autocomplete-directions) 참조하세요 . 장소 ID에 대한 자세한 내용은 장소 ID 개요를 참조하세요 .

        `origin=**place_id:ChIJ3S-JXmauEmsRUcIaWtf4MzE**`

    - 주소를 전달하면 길 찾기 서비스에서 문자열을 지오 코딩하고 이를 위도 / 경도 좌표로 변환하여 길 찾기를 계산합니다. 이 좌표는 Geocoding API에서 반환 된 좌표와 다를 수 있습니다 (예 : 중앙이 아닌 건물 입구).

        `origin=24+Sussex+Drive+Ottawa+ON`

        참고 : 주소 또는 위도 / 경도 좌표를 사용하는 것보다 장소 ID를 사용하는 것이 좋습니다. 좌표를 사용하면 항상 해당 좌표에 가장 가까운 도로에 지점이 스냅됩니다. 이는 재산에 대한 접근 지점이 아닐 수도 있고 목적지까지 빠르고 안전하게 연결되는 도로 일 수도 있습니다.

    - 좌표를 전달하면 지점이 가장 가까운 도로로 스냅됩니다. 장소 ID를 전달하는 것이 좋습니다. 좌표를 전달하는 경우 위도와 경도 값 사이에 공백이 없는지 확인하십시오.

        `origin=41.43206,-81.38992`

- **`destination:`길 찾기를 계산할 장소 ID, 주소 또는 텍스트 위도 / 경도 값입니다. destination매개 변수에 대한 옵션 origin은 위에서 설명한 매개 변수에 대한 옵션 과 동일 합니다.**
- **`key`**— 애플리케이션의 API 키. 이 키는 할당량 관리를 위해 애플리케이션을 식별합니다.

### 선택적 매개 변수

- **`mode`** — 길 찾기를 계산할 때 사용할 운송 모드를 지정합니다. (기본값 : **`driving`**)
    - **`driving`**(기본값)은 도로망을 사용하는 표준 운전 경로를 나타냅니다.
    - **`walking`**보행자 경로 및 인도를 통한 도보 경로를 요청합니다 (사용 가능한 경우).
    - **`bicycling`**자전거 경로 및 선호하는 거리 (사용 가능한 경우)를 통해 자전거 경로를 요청합니다.
    - **`transit`**대중 교통 경로를 통해 길 찾기를 요청합니다 (사용 가능한 경우). 당신이 transit모드를 설정하면  departure_time 또는 arrival_time  중 하나를 지정할 수 있습니다  . 시간이 지정되지 않은 경우 departure_time기본값은 지금입니다. 또한 선택적으로 transit_mode 또는 transit_routing_preference
- **`waypoints`**[경유지](https://developers.google.com/maps/documentation/directions/get-directions#Waypoints)— 통과 또는 경유지로 출발지와 목적지 사이의 경로를 따라 포함 할 중간 위치 배열을 지정합니다. 웨이 포인트는 지정된 위치를 통과하도록 경로를 변경합니다. API는 운전, 걷기 및 자전거 타기와 같은 이동 모드에 대한 경유지를 지원합니다. 환승이 아닙니다. 다음 값을 사용하여 경유지를 지정할 수 있습니다.
    - 장소 ID : 위치에 고유 한 값입니다.  ( **`ChIJGwVKWe5w44kRcr4b9E25-Go`)**
    - 주소 문자열 ( **`Charlestown, Boston,MA`**)
    - 위도 / 경도 좌표 ( **`lat/lng`**) : 명시적 값 쌍. (**`34.92788%2C138.60008`** 쉼표, 공백 없음)

    경유지에 대한 예와 자세한 내용은 아래 안내를 참조 하세요.

- **`alternatives`**—**`true`**로 설정된 경우, 길 찾기 서비스가 응답에서 둘 이상의 대체 경로를 제공 할 수 있음을 지정합니다. 대체 경로를 제공하면 서버의 응답 시간이 늘어날 수 있습니다. 중간 경유지가 없는 요청에만 사용할 수 있습니다.
- **`avoid`**— 계산된 경로가 표시된 기능을 피해야 함을 나타냅니다. 이 매개 변수는 다음 인수를 지원합니다.
    - **`tolls`**계산 된 경로가 유료 도로 / 다리를 피해야 함을 나타냅니다.
    - **`highways`**계산 된 경로가 고속도로를 피해야 함을 나타냅니다.
    - **`ferries`**계산 된 경로가 페리를 피해야 함을 나타냅니다. 수송운송 수단
    - **`indoor`**계산 된 경로가 도보 및 대중 교통 길 찾기를 위한 실내 걸음을 피해야 함을 나타냅니다. API 키 또는 Google Maps Platform Premium Plan 클라이언트 ID가 포함 된 요청만 기본적으로 실내 단계를 수신합니다.
- **`language`**— 결과를 반환 할 언어입니다.
    - [지원되는 언어 목록](https://developers.google.com/maps/faq#languagesupport)
- **`units`**— 결과를 표시 할 때 사용할 단위 체계를 지정합니다.
    - **`metric`**미터법 사용을 지정합니다. 텍스트 거리는 킬로미터와 미터를 사용하여 반환됩니다.
    - **`imperial`**영국식 (영어) 시스템의 사용을 지정합니다. 텍스트 거리는 마일과 피트를 사용하여 반환됩니다.
- **`region`**[지역 바이어스](https://developers.google.com/maps/documentation/directions/get-directions#RegionBiasing)— ccTLD ( "최상위 도메인") 2 자 값으로 지정된 지역 코드를 지정합니다.
- **`arrival_time`**— 1970 년 1 월 1 일 자정 (UTC) 이후로 원하는 대중 교통 길 찾기 도착 시간을 초 단위로 지정합니다. departure_time 또는 arrival_time 둘 중 하나만 지정할 수 있습니다 . 참고 arrival_time 정수로 지정해야 합니다
- **`departure_time`**— 원하는 출발 시간을 지정합니다. 1970 년 1 월 1 일 자정 (UTC) 이후 시간을 정수로 지정할 수 있습니다. 경우 departure_time나중에 9999-12-31T23보다 : 59 : 59.999999999Z를 지정, API는 다시 떨어질 것 departure_time: 59 : 9999-12-31T23에 59.999999999Z합니다. 또는 값을 지정 now하여 출발 시간을 현재 시간 (가장 가까운 초로 수정)으로 설정합니다. 출발 시간은 두 가지 경우에 지정 될 수 있습니다.
    - 이동 모드가 대중 교통 인 요청의 경우 : **`departure_time`**또는 **`arrival_time`**중 하나를 선택적으로 지정할 수 있습니다. 시간이 지정되지 않은 경우**`departure_time`**기본값은 지금입니다.
    - 이동 모드가 운전중인 요청의 경우 departure_time: duration_in_traffic교통 상황을 고려한 경로 및 이동 시간 (응답 필드 :)을 수신하도록 지정할 수 있습니다 . 이 옵션은 요청에 유효한 API 키 또는 유효한 Google Maps Platform Premium Plan 클라이언트 ID 및 서명이 포함 된 경우에만 사용할 수 있습니다. 은 departure_time현재 시간 또는 미래의 어떤 시간으로 설정해야합니다. 과거 일 수 없습니다.
- **`traffic_model`**(기본값 :**`best_guess`**)— 트래픽 시간을 계산할 때 사용할 가정을 지정합니다. 이 설정은 응답의 **`duration_in_traffic`**필드에 반환 된 값에 영향을 줍니다. 여기에는 과거 평균을 기반으로 트래픽의 예측 시간이 포함됩니다.
    - **`best_guess`**(기본값)은 과거 교통 상황과 실시간 교통에 대해 알려진 정보를 고려할 때 반환 된 시간이 이동 시간의 가장 좋은 추정치 여야 함을 나타냅니다 . 실시간 트래픽은 지금에 가까울수록 더욱 중요해집니다 .
    - **`pessimistic`**특히 교통 상황이 특히 나쁜 날이 이 값을 초과 할 수 있지만 대부분의 날 에는 반품 된 시간이 실제 이동 시간보다 길어야 함을 나타냅니다 .
    - **`optimistic`**특히 교통 상황이 특히 좋은 날이이 값보다 빠를 수 있지만, 대부분의 날에 반환 된 시간이 실제 이동 시간보다 짧아야 함을 나타냅니다 .
- **`transit_mode`**— 선호하는 운송 모드를 하나 이상 지정합니다. 이 매개 변수는 대중 교통 길 찾기에 대해서만 지정 될 수 있으며 요청에 API 키 또는 Google Maps Platform Premium Plan 클라이언트 ID가 포함 된 경우에만 지정할 수 있습니다. 매개 변수는 다음 인수를 지원합니다.
    - **`bus`**계산 된 경로가 버스 여행을 선호해야 함을 나타냅니다.
    - **`subway`**계산 된 경로가 지하철을 선호 함을 나타냅니다.
    - **`train`**계산 된 경로가 기차 여행을 선호해야 함을 나타냅니다.
    - **`tram`**계산 된 경로가 트램 및 경전철을 선호해야 함을 나타냅니다.
    - **`rail`**계산 된 경로가 기차, 트램, 경전철 및 지하철을 선호해야 함을 나타냅니다. 이것은**`transit_mode=train|tram|subway`**

- **`transit_routing_preference`**— 대중 교통 경로에 대한 기본 설정을 지정합니다. 이 매개 변수는 대중 교통 길 찾기에 대해서만 지정 될 수 있으며 요청에 Google Maps Platform Premium Plan 클라이언트 ID가 포함 된 API 키 경우에만 지정할 수 있습니다.
    - **`less_walking`**계산 된 경로가 제한된 도보 량을 선호해야 함을 나타냅니다.
    - **`fewer_transfers`**계산 된 경로가 제한된 수의 환승을 선호해야 함을 나타냅니다.

### 길 찾기 요청 예시

다음 요청은 온타리오 주 토론토에서 퀘벡 주 몬트리올까지의 운전 경로를 반환합니다.

```bash
https://maps.googleapis.com/maps/api/directions/json?origin=Toronto&destination=Montreal&key=YOUR_API_KEY
```

**`mode`**및 **`avoid`**매개 변수를 변경하여 주요 고속도로를 피하는 경치 좋은 자전거 여행에 대한 길 찾기를 반환하도록 초기 요청을 수정할 수 있습니다.

```bash
https://maps.googleapis.com/maps/api/directions/json?origin=Toronto&destination=Montreal**&avoid=highways &mode=bicycling**&key=YOUR_API_KEY
```

다음 요청은 뉴욕 브루클린에서 뉴욕 퀸즈까지의 대중 교통 길 찾기를 검색합니다. 요청이 **`departure_time`**을 지정하지 않으므로 출발 시간은 기본적으로 현재 시간으로 설정됩니다.

```bash
https://maps.googleapis.com/maps/api/directions/json?origin=Brooklyn&destination=Queens**&mode=transit**&key=YOUR_API_KEY
```

다음 환승 요청에는 특정 출발 시간이 포함됩니다.

```bash
https://maps.googleapis.com/maps/api/directions/json?origin=Brooklyn&destination=Queens**&departure_time=1343641500**&mode=transit&key=YOUR_API_KEY
```

다음 요청은 플러스 코드를 사용하여 인도 콜카타의 H8MW + WP에서 GCG2 + 3M까지의 운전 경로를 반환합니다.

```bash
https://maps.googleapis.com/maps/api/directions/json?origin=H8MW%2BWP%20Kolkata%20India&destination=GCG2%2B3M%20Kolkata%20India&key=YOUR_API_KEY
```

다음 요청은 장소 ID를 사용하여 영국 글래스고에서 영국 퍼스까지 운전 경로를 반환합니다.

```bash
https://maps.googleapis.com/maps/api/directions/json?origin=**place_id:ChIJ685WIFYViEgRHlHvBbiD5nE**&destination=**place_id:ChIJA01I-8YVhkgRGJb0fW4UX7Y**&key=YOUR_API_KEY
```

## 웨이 포인트

Directions API를 사용하여 경로를 계산할 때 중간 위치의 경유 또는 경유지를 포함하는 경로를 반환하는 경유지 를 지정할 수 있습니다. 운전, 도보 또는 자전거 경로에 경유지를 추가 할 수 있지만 대중 교통 경로는 추가 할 수 없습니다.