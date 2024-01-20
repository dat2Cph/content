# HTTP protocol and network wednesday/thursday

## Exercise 1 
- Create a new project in IntelliJ.
- Build from scratch a simple server that can handle a GET request and return a simple html page (find inspiration [here](https://github.com/HartmannDemoCode/NetworkDemo), but write the code your self). 

## Exercise 2
- Add another server that can return an html page, that should contain a form with two input fields and a submit button. The form should be sent to the server using the POST method. The server should return a new html page that contains the sum of the two numbers entered in the form. The server should be able to handle multiple requests.

## Exercise 3 (extra)
- If the previous exercise was easy for you, then try making a server that can receive a GET request with reference to an image file. The server should return the image file to the client. The server should be able to handle multiple requests.
- Hint: You need to read the image file into a byte array and then send the byte array to the client/browser.
- Test that the browser can display the image.