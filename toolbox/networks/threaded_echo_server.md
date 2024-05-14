# This shows how to handle multiple clients

In Java, you can create a new thread to handle each client connection to allow multiple clients to connect and be served at the same time. Here’s an example using `ServerSocket` and handling each client connection in a separate thread:

```java
import java.io.*;
import java.net.*;

public class Server {
    public static void main(String[] args) throws IOException {
        int portNumber = 9090; // or any port number you wish to use

        try (ServerSocket serverSocket = new ServerSocket(portNumber)) {
            while (true) {
                Socket clientSocket = serverSocket.accept();
                new Thread(new ClientHandler(clientSocket)).start();
            }
        } catch (IOException e) {
            System.out.println("Exception caught when trying to listen on port "
                + portNumber + " or listening for a connection");
            System.out.println(e.getMessage());
        }
    }
}

class ClientHandler implements Runnable {
    private final Socket clientSocket;

    public ClientHandler(Socket socket) {
        this.clientSocket = socket;
    }

    public void run() {
        try (
            PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
            BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
        ) {
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                // process input
                out.println(inputLine); // echo back the input
            }
        } catch (IOException e) {
            System.out.println("Exception caught when trying to listen on port or listening for a connection");
            System.out.println(e.getMessage());
        } finally {
            try {
                clientSocket.close();
            } catch (IOException e) {
                // log exception, do nothing, or handle it
            }
        }
    }
}
```

Here's what happens in the code:

1. **Server Socket**: The `ServerSocket` listens for incoming client connections on a specified port. `serverSocket.accept()` blocks and waits for a client connection. When a client connects, it returns a `Socket` for communicating with this client.

2. **Handling Client Connection**: When a client connects, the server creates a new `ClientHandler` (a `Runnable`) to handle the client's requests and passes the client's socket to it. Then, it starts a new thread with this `ClientHandler`.

3. **ClientHandler**:
    - The `ClientHandler` class implements `Runnable` and overrides the `run` method, which contains the code for interacting with the client.
    - Inside the `run` method, it sets up input and output streams for communicating with the client. In this example, it reads input from the client and echoes it back until the client stops sending data (detected by `readLine()` returning null).
    - Finally, it closes the client socket.

4. **Multi-threading**: Each client is handled in a separate thread, allowing the server to handle multiple clients simultaneously.

Remember, in a real-world application, you should handle exceptions and edge cases properly and possibly implement a thread pool or use a framework that handles connections asynchronously to efficiently manage resources.
