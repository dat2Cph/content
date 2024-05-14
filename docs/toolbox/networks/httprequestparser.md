# This is a simple version

Creating a Java class to handle and parse HTTP requests involves several steps. We will define a class `HTTPRequest` that can parse a string with a full HTTP request. This class will handle both `GET` and `POST` methods, query strings, and a request body. Here's a basic outline of what we'll do:

1. **Define the Class Structure**: Create the class and define the fields to store various parts of the request like the method, path, headers, query parameters, and body.
2. **Constructor**: Initialize the object.
3. **Parsing Method**: A method to parse the raw HTTP request string.
4. **Helper Methods**: For parsing individual components of the HTTP request (like the method, headers, query parameters, and body).

Here's how you can write the class:

```java
import java.util.HashMap;
import java.util.Map;

public class HTTPRequest {
    private String method;
    private String path;
    private Map<String, String> headers;
    private Map<String, String> queryParams;
    private String body;

    public HTTPRequest(String rawRequest) {
        headers = new HashMap<>();
        queryParams = new HashMap<>();
        parseRequest(rawRequest);
    }

    private void parseRequest(String rawRequest) {
        String[] requestLines = rawRequest.split("\r\n");
        parseRequestLine(requestLines[0]);
        int i = 1;
        while (i < requestLines.length && !requestLines[i].isEmpty()) {
            parseHeader(requestLines[i]);
            i++;
        }
        if (method.equals("POST") && i < requestLines.length && !requestLines[i].isEmpty()) {
            body = requestLines[i + 1];
        }
    }

    private void parseRequestLine(String requestLine) {
        String[] parts = requestLine.split(" ");
        method = parts[0];
        String[] pathAndParams = parts[1].split("\\?");
        path = pathAndParams[0];
        if (pathAndParams.length > 1) {
            parseQueryParams(pathAndParams[1]);
        }
    }

    private void parseHeader(String headerLine) {
        String[] headerParts = headerLine.split(": ");
        if (headerParts.length == 2) {
            headers.put(headerParts[0], headerParts[1]);
        }
    }

    private void parseQueryParams(String queryParamsLine) {
        String[] pairs = queryParamsLine.split("&");
        for (String pair : pairs) {
            String[] keyValue = pair.split("=");
            if (keyValue.length == 2) {
                queryParams.put(keyValue[0], keyValue[1]);
            }
        }
    }

    // Getters
    public String getMethod() {
        return method;
    }

    public String getPath() {
        return path;
    }

    public Map<String, String> getHeaders() {
        return headers;
    }

    public Map<String, String> getQueryParams() {
        return queryParams;
    }

    public String getBody() {
        return body;
    }
}
```

This class doesn't handle every edge case (like multi-line headers or POST with `application/x-www-form-urlencoded` or `multipart/form-data` which can have parameters in the body), but it provides a strong starting point.

To use this class, you would construct an `HTTPRequest` object with a raw HTTP request string. The constructor parses the request and you can then use the getter methods to access individual parts of the request.

Please note that this implementation is quite basic and assumes well-formed input. Real-world HTTP parsing can be much more complex due to the need to handle a wide variety of edge cases, malformed input, and security considerations like header injection attacks. In a production environment, it's usually best to use a robust, well-tested library for parsing HTTP requests.
