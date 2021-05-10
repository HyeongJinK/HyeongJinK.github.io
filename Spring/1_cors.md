---
sort: 1
---

# cors 처리

```java
@CrossOrigin("*")
@GetMapping
public String cors(String value) {
    return value;
}
```

```java
@Bean
public WebMvcConfigurer webMvcConfigurer() {
    return new WebMvcConfigurer() {
        @Override
        public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/crm/**")
                    .allowedOrigins("*")
                    .allowedMethods(HttpMethod.GET.name())
                    .allowedMethods(HttpMethod.POST.name())
                    .allowedMethods(HttpMethod.PUT.name())
                    .allowedMethods(HttpMethod.DELETE.name())
                    .allowCredentials(false)
                    .maxAge(3600);
        }
    };
}
```