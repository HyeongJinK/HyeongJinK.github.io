---
sort: 1
---

# MySQL, H2의 DATE_SUB 및 DATE_ADD

MySQL을 데이터베이스로 테스트를 h2를 사용

```sql
SELECT *
FROM subscriptions
WHERE active_until >= (DATE_SUB(CURDATE(), INTERVAL 3 DAY))
AND active_until <= (DATE_ADD(CURDATE(), INTERVAL 1 DAY))

-- 아래로 변경

SELECT *
FROM subscriptions
WHERE active_until >= (TIMESTAMPDIFF(DAY, 3, CURRENT_DATE))
AND active_until <= (TIMESTAMPADD(DAY, 1, CURRENT_DATE))
```

* [h2 함수](http://www.h2database.com/html/functions.html)
* [MySQL 시간함수](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#f)