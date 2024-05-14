# Network with java
## Learning objectives
1. Explain the tcp/ip protocol
2. Explain the client/server principle
  - The server is listening for incoming connections on a specific port
  - The client connects to the server on a specific port
  - Java ServerSocket and Socket classes are used to implement the server and client respectively
3. Explain and demonstrate use of port numbers
4. Explain and demonstrate ServerSocket and (Client) Socket
5. Explain and demonstrate the http protocol
  - `curl -v -H "Accept: application/json" https://icanhazdadjoke.com/`
6. Explain and demonstrate the http request and response
7. Explain and demonstrate http headers in requests and responses
8. Explain and demonstrate http status codes
9. Explain and demonstrate http methods
  - Look at the browser developer tools

## Agenda wednesday
1. Quiz on the topics from yesterday
  - quiz on networking in groups of 2-3 with presentations
2. Look at how RequestFileServer reacts when we remove the response headers and make a browser request.
3. write a unit test that can start a file server and test that it can serve a file (try not to look at the demo code)
4. Show how to make an html file with a form and submit it to a server
5. Work on the exercise creating an html page with a form that can send a POST request to a server and get a response

## Before class
- [TCP handshake video: (4:16)](https://www.youtube.com/watch?v=xMtP5ZB3wSk&ab_channel=SunnyClassroom)
- [HTTP video (9:52)](https://www.youtube.com/watch?v=M7nO5Sw1esU&ab_channel=Testopic)
- [Java Socket article (10 min read)](https://www.baeldung.com/a-guide-to-java-sockets)

## Resources
- [Powerpoint](https://docs.google.com/presentation/d/1vaKk_JFHWjoO-LlVAu_zMDQK3_vhEdDjEMbFqIZdp5Y/edit?usp=sharing)
- [Demo project](https://github.com/HartmannDemoCode/NetworkDemo.git)

## Quiz
- What is a socket in Java networking?
- What are the two types of sockets in Java?
- How can you create a TCP server socket in Java?
- How can you create a TCP client socket in Java?
- What is a network protocol?
- What are the most important protocols in networking?
- What are the accronyms of IP, TCP, HTTP?
- What is an IP address?
- What is a port number?
- What is a DNS server?
- What is a DHCP server?
- In the EchoServer of our demo code, why can we only make one request from the client to the server?
- What is the purpose of the while loop in the start method of the RequestDataServer?
- What is an inputStream?
- How can we write to an OutputStream?
- What is GET and POST in HTTP?
- What are HTTP headers for?
- In RequestFileServer, there is a statement: 'RequestDTO requestDTO = generateRequestObject(in);'. Where does the generateRequestObject method come from? and what does it do?
- When do we need Input- or OutputStreams?