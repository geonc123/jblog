# hi JBLOG

This jblog is Building REST services with Spring Boot 

## Jpa Repository , H2 Databases , Lombok 

there's POJOs (Plain Old Java Objects) in a memory-based database.


includes Mysql (Unimplemented)

### Load Data in memory 


## HATEOAS (Unimplemented)


## Add Exception (incomplete)
### Not Found Data Exception 
Just throw an exception when data cannot be found

[source, java]
---
public class BlogNotFoundAdvice {

	@ResponseBody
	@ExceptionHandler(BlogNotFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	String blogNotFoundHandler(BlogNotFoundException exception) {
		return exception.getMessage();
	}
}
---

[source, java]
---
public class BlogNotFoundException extends RuntimeException {
	
	public BlogNotFoundException(Long id){
		super("Could not find Blog" + id);
	}
	
}
---
## Web Security and OAuth2 (Unimplemented)

