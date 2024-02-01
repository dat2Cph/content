# What is a socket in Java?

In Java, `ServerSocket` and `Socket` are classes used for network communication, but they serve different purposes and operate in distinct roles within a client-server paradigm.

1. **ServerSocket (java.net.ServerSocket):**
    - **Role**: A `ServerSocket` is used on the server side of a client-server network communication. Its primary role is to listen for incoming client connections.
    - **Operation**:
        - It waits for incoming requests (listens on a specific port).
        - When a client requests a connection, `ServerSocket` accepts the request and creates a `Socket` to handle the client-server communication.
        - It's like a receptionist in an office waiting for phone calls. When a call comes in, the receptionist directs it to the appropriate person (the `Socket`).
    - **Methods**: Common methods include `.accept()`, which waits for a client to connect and returns a `Socket` for communicating with the client.
    - **Usage**: Typically used in server applications to create a point of communication for clients to connect to.

2. **Socket (java.net.Socket):**
    - **Role**: A `Socket` is used on both the server and client sides, representing an endpoint for communication between two machines.
    - **Operation**:
        - On the client side, it's used to initiate a connection to the server (`ServerSocket`).
        - On the server side, it's created by the `ServerSocket` upon a client's connection request. It represents the server's side of the client-server connection.
        - It's like the telephone on each end of a call. One `Socket` on the client side and another `Socket` on the server side, facilitating the conversation between the client and the server.
    - **Methods**: Provides input and output streams for sending and receiving data over the network. Common methods include `.getInputStream()`, `.getOutputStream()`, `.connect()`, `.close()`, etc.
    - **Usage**: Used for both server-side and client-side to send and receive data once a connection is established.

In summary, `ServerSocket` is all about waiting for and accepting incoming connections, acting as a fixed point for clients to connect to. In contrast, `Socket` is about establishing a connection and facilitating communication (sending and receiving data) between the client and the server once the connection is established.
