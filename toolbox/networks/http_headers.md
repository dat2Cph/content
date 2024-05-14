# HTTP headers

## Request header

An HTTP request header sent to `http://localhost:9090/` might look like this:

```
GET / HTTP/1.1
Host: localhost:9090
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
Connection: keep-alive
```

Here's a breakdown of each part:

- **Request Line**: `GET / HTTP/1.1`
  - `GET` is the method indicating the action to be performed. In this case, it's retrieving data from the server.
  - `/` is the path of the resource on the server. Here, it refers to the root.
  - `HTTP/1.1` is the version of the HTTP protocol being used.

- **Headers**:
  - `Host`: The domain name or IP address (and optional port) of the server. Here it's `localhost:9090`.
  - `User-Agent`: Information about the client software making the request.
  - `Accept`: The MIME types that the client can handle.
  - `Accept-Language`: The language(s) preferred by the client.
  - `Accept-Encoding`: The content codings that the client can handle (e.g., `gzip` for compressed content).
  - `Connection`: Options desired for the connection (e.g., `keep-alive` to keep the connection open for further requests).

This header is sent by the client to the server when making a request to `http://localhost:9090/`, and it informs the server about the nature of the request and the capabilities of the client. The actual header might vary based on the client's configuration, the specific software used, and the requirements of the request.

## Response header

A simple HTTP response header consists of the status line and various header fields detailing the server's response to a client's request. Here's an example of what it might look like:

```
HTTP/1.1 200 OK
Date: Mon, 23 May 2022 22:38:34 GMT
Server: Apache/2.4.1 (Unix)
Content-Type: text/html; charset=UTF-8
Content-Length: 1234
Connection: close
```

Here's a breakdown of each part:

- **Status Line**: `HTTP/1.1 200 OK`
  - `HTTP/1.1` is the HTTP version.
  - `200` is the status code indicating that the request was successful.
  - `OK` is the reason phrase associated with the status code.

- **Headers**:
  - `Date`: The date and time the response was sent.
  - `Server`: Information about the software used by the origin server.
  - `Content-Type`: The media type of the resource (e.g., `text/html` for HTML documents).
  - `Content-Length`: The size of the response body in bytes.
  - `Connection`: Options desired for the connection (e.g., `close` to indicate that the server will close the connection after completing the request).

These headers provide essential information for the client to handle the response properly. Headers can vary based on the server's configuration and the specifics of the request and response.
