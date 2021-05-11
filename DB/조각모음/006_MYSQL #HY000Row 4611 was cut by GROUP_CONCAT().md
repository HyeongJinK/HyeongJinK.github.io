---
sort: 6
---

# MYSQL #HY000Row 4611 was cut by GROUP_CONCAT()

```
MYSQL #HY000Row 4611 was cut by GROUP_CONCAT()

MySQL “Row 30153 was cut by GROUP_CONCAT()” error
```

group_concat 되는 문자열이 너무 길 때 발생

```sql
SET group_concat_max_len=150000;
```