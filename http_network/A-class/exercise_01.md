# HTTP protocol and network - exercises monday/tuesday

## Preparation
- Make sure you have watched the videos and read the articles in the [Before class](README.md#before-class) section.
- Git fork and clone the project: https://github.com/HartmannDemoCode/NetworkDemo and open it in IntelliJ.

## Exercise 1.

- Test with Firefox and Chrome what data is send to the server when you enter the URL `http://localhost:8080/` in the browser. What are the differences?

## Exercise 2.

- When starting the SimpleServer we can only send one request to the server. If we try to send another request we get an error. What does the error mean and why do we get it?

## Exercise 3.

- When running the EchoServer we can send multiple requests to the server. Why is that?
- If we try to send a request to the EchoServer from a browser it hangs. Why is that?
- If we try to make a new request from a second client to the server we get an error. What does the error mean and why do we get it?
- If we try to start a new server instance on the same port we get an error. What does the error mean and why do we get it?

## Exercise 4.

- Start the RequestDataServer and access it from a browser. What is the result? What makes the difference between this server and the EchoServer?
- Find a person in the group who can make a wifi-hot-spot with his/her phone, and connect your laptop to this phone.
- Find the IP address of your laptop (if you don't know how to find the IP address of your laptop, then that is a google exercise). It is important that everyone in the group can find their IP address, regardless of whether it is Windows, Mac, Linux (or something else).
- Demonstrate that you can connect to RequestDataServer via your phone.

## Exercise 5.

- When looking at the testRequestDataServerAndClient test in the Demo03RequestDataServerTest class, we can see an example of how to send a POST request to the server. When sending a POST request
- explain what the difference is between the request and the response?
- explain what is parameters and what is headers?
- explain what is the request body?
