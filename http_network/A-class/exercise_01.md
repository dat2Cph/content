# HTTP protocol and network - exercises monday/tuesday

## Preparation
- Make sure you have watched the videos and read the articles in the [Before class](README.md#before-class) section.
- Git clone the project: https://github.com/HartmannDemoCode/NetworkDemo and open it in IntelliJ.

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
- Find the IP address of your laptop (if you don't know how to find the IP address of your laptop, then that is the google exercise). It is important that everyone in the group can find their IP address, regardless of whether it is Windows, Mac, Linux or something else.
- Demonstrate that you can connect to RequestDataServer via your phone.

## Opgave 4. (grøn)

Find en person i gruppen der kan lave et wifi-hot-spot med sin telefon, og kopl jeres laptop på denne telefon.

- Find IP addressen på laptoppen (hvis I ikke ved hvordan man finder IP addressen på jeres laptop, så er det altså det der er google opgaven). Det er vigtigt at alle i gruppen kan finde deres IP addresse, uanset om det er Windows, Mac, Linux eller noget andet.
- (Grøn) Demonstrer at I kan kople på picoserver2 via jeres telefon.
- (Gul) Kopl alle gruppens laptops på samme telefon, og demonstrer hvordan I fra jeres browser kan kople jer på forskellige servere på andres laptops.
- (Rød) Behøver alle serverne at bruge samme port nummer? Demonstrer hvordan man fra en laptop kan have mere end en server kørende, og tilgå dem fra en anden laptop.

## Opgave 5. (grøn)

Er det java eller operativ systemet der har ansvaret for porte, altså er det java eller operativ systemet der brokker sig hvis man prøver at åbne den samme port to gange? Og hvorfor er det et problem med to porte med samme nummer?

## Opgave 6. (rød)

Som en del af den udleverede kode er der en klasse der hedder HttpRequest. Redegør for denne klasse, specielt skal I kunne forklare:

- Hvad er forskellen på parametre og headers?
- Hvad gør de første 7 linjer i konstruktøren?
- I konstruktøren er der en linje der hedder:

`if ("application/x-www-form-urlencoded".equals(getContentType())) {`

Forklar hvorfor denne er smartere end:

`if ( getContentType().equals("application/x-www-form-urlencoded" ) ){`
