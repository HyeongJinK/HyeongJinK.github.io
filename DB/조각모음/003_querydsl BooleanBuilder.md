---
sort: 3
---

# querydsl BooleanBuilder

```java
BooleanBuilder builder = new BooleanBuilder();

if (code.equals("NOTICE_FLAG")) {
    builder.and(gcm.noticeFlag.eq("Y"));
} else if (code.equals("EVENT_FLAG")) {
    builder.and(gcm.eventFlag.eq("Y"));
} else if (code.equals("TOKEN_FLAG")) {
    builder.and(gcm.tokenFlag.eq("Y"));
} else if (code.equals("COMMUNITY_FLAG")) {

} else if (code.equals("COUPON_FLAG")) {

}
```