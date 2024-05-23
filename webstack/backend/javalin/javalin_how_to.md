---
title: Javalin Cookbook
description: Javalin opslagsværk
layout: default
nav_order: 2
parent: Backend
grand_parent: Webstack
permalink: /webstack/backend/javalin-cookbook
---

![Javalin Logo](./images/javalinlogo.svg){: width="100" .float-right}

# Javalin Cookbook

Begin creating a new project from scratch using this [tutorial](./setup.md). Then you might need to know how to ...

## [Javalin](#javalin-1)

1. [How to organize files](#1-how-to-organize-files)
2. [How to add more routes](#2-how-to-add-more-routes)
3. [How to add a database](#3-how-to-add-a-database)
4. [How to export and import a Postgres database](#4-how-to-export-and-import-a-database)

## [Thymeleaf](#thymeleaf-1)

1. [How to re-use fragments in templates](#1-how-to-re-use-fragments-in-templates)
2. [How to use fragments with parameters](#2-how-to-use-fragments-with-parameters)
3. [How to add an image](#3-how-to-add-an-image)
4. [How to iterate through a list (each ....)](#4-how-to-iterate-through-a-list-each-)
5. [How to use conditionals (if ...)](#5-how-to-use-conditionals-if-)
6. [How to add a link](#6-how-to-add-a-link)

## [Javalin & Thymeleaf](#javalin--thymeleaf-1)

1. [How to transfer data between frontend and backend](#1-how-to-transfer-data-between-frontend-and-backend)
   - [From backend to frontend](#1a-from-backend-to-frontend)
   - [From frontend to backend](#1b-from-frontend-to-backend)

## Javalin

### 1. How to organize files

It's generally a good idea to organize the Java App into meaningful packages. Suggested packages are:

- config (configuration files, Thymeleaf etc)
- controllers (first stop for each route, these can call service methods, facade DB methods etc)
- services (domain / business logic and methods, can also call facade DB methods)
- entities (domain classes that mirrors the DB)
- exceptions (custom exceptions)
- persistence (database related mapper classes and database facade classes)
- resources
  - public
    - css
    - images
  - templates

### 2. How to add more routes

GET og POST request can be added like this:

```Java
app.get("/users", ctx -> UserController.showUserList(ctx, connectionPool));
app.post("/login", ctx -> UserController.login(ctx, connectionPool));
```

In this example a Class `UserController` has been created to organize the code. The methods `showUserList` and `login`
are made static for ease of use.

### 3. How to add a database

Add a connection pool with 3 JDBC Postgresql connections. Create a package called `persistence` and drop the ConnectionPool class and the rest of DB classes into it:

```java
package app.persistence;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/***
 * Singleton pattern applied to handling a Hikari ConnectionPool
 */
public class ConnectionPool
{

    public static ConnectionPool instance = null;
    public static HikariDataSource ds = null;

    /***
     * Empty and private constructor due to single pattern. Use getInstance methods to
     * instantiate and get a connection pool.
     */
    private ConnectionPool()
    {
    }

    /***
     * Getting a singleton instance of a Hikari Connection Pool with specific credentials
     * and connection string. If an environment variable "DEPLOYED" exists then local
     * environment variables will be inserted with user credentials and DB connection string
     * @param user for Postgresql database user
     * @param password for Postgresql database user
     * @param url connection string for postgresql database. Remember to add currentSchema to string
     * @param db database name for connection
     * @return A ConnectionPool object
     */
    public static ConnectionPool getInstance(String user, String password, String url, String db)
    {
        if (instance == null)
        {
            if (System.getenv("DEPLOYED") != null)
            {
                ds = createHikariConnectionPool(
                        System.getenv("JDBC_USER"),
                        System.getenv("JDBC_PASSWORD"),
                        System.getenv("JDBC_CONNECTION_STRING"),
                        System.getenv("JDBC_DB"));
            } else
            {
                ds = createHikariConnectionPool(user, password, url, db);
            }
            instance = new ConnectionPool();
        }
        return instance;
    }

    /***
     * Getting a live connection from a Hikari Connection Pool
     * @return a database connection to be used in sql requests
     * @throws SQLException
     */
    public synchronized Connection getConnection() throws SQLException
    {
        return ds.getConnection();
    }

    /***
     * Closing a Hikari Connection Pool after use.
     */
    public synchronized void close()
    {
        Logger.getLogger("web").log(Level.INFO, "Shutting down connection pool");
        ds.close();
    }

    /***
     * Configuring a Hikari DataSource ConnectionPool. Default pool size is 3.
     * @param user for Postgresql database user
     * @param password for Postgresql database user
     * @param url connection string for postgresql database. Remember to add currentSchema to string
     * @param db database name for connection
     * @return a Hikari DataSource
     */
    private static HikariDataSource createHikariConnectionPool(String user, String password, String url, String db)
    {
        Logger.getLogger("web").log(Level.INFO,
                String.format("Connection Pool created for: (%s, %s, %s, %s)", user, password, url, db));
        HikariConfig config = new HikariConfig();
        config.setDriverClassName("org.postgresql.Driver");
        config.setJdbcUrl(String.format(url, db));
        config.setUsername(user);
        config.setPassword(password);
        config.setMaximumPoolSize(3);
        config.setPoolName("Postgresql Pool");
        config.addDataSourceProperty("cachePrepStmts", "true");
        config.addDataSourceProperty("prepStmtCacheSize", "250");
        config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
        return new HikariDataSource(config);
    }
}
```

Add to beginning of Main-class:

```java
private static final String USER = "postgres";
private static final String PASSWORD = "postgres";
private static final String URL = "jdbc:postgresql://localhost:5432/%s?currentSchema=public";
private static final String DB = "databasename";

private static final ConnectionPool connectionPool = ConnectionPool.getInstance(USER, PASSWORD, URL, DB);

```

Then the database can be accessed like this:

```java
public static List<User> getAllUsers(ConnectionPool connectionPool) throws DatabaseException
    {
        List<User> userList = new ArrayList<>();
        String sql = "select * from users";
        try (Connection connection = connectionPool.getConnection())
        {
            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ResultSet rs = ps.executeQuery();

                while (rs.next())
                {
                    String userName = rs.getString("username");
                    String password = rs.getString("password");
                    String role = rs.getString("role");
                    User user = new User(userName, password, role);
                    userList.add(user);
                }
            }
        }
        catch (SQLException ex)
        {
            throw new DatabaseException(ex, "Could not get users from database");
        }
        return userList;
    }
```

### 4. How to export and import a database

This is how you share a database between team members (when not having a shared database in the cloud):

1. Right-click your database in PG-Admin and choose `Backup ...`
2. Find a filename. Use same name as database `cupcake`
3. Format: Custom (the most efficient)
4. Encoding: UTF8
5. Data Option Tab: select `Pre-data`, `Data`, and `Post-data`. These three ensure that everything is copied.
6. Once the backup is done. Go to the topmenu, and choose: `Tools -> Store manager ...`
7. Pick the backup file you just created in click the download button.
8. Find the backup file in your `download` folder on disk, and copy it to your team members.

This is how you import / restore the file on another machine

1. Create a new database in PG-Admin with the same name as the back-up'ed version
2. Right-click the new database and choose `Restore ...`
3. Choose `Custom or tar` as Format
4. Click the folder icon in the `Filename` to open the file picker
5. Click the 3 small dots in the upper right corner to open a local menu, and then click `Upload`
6. Drop the cupcake file into the file picker to upload - cancel to get back to the file list, and then mark the `cupcake` file
7. Click `Restore` to import
8. Refresh the database to see the newly imported database and data

## Thymeleaf

### 1. How to re-use fragments in templates

Re-use html fragments like this:

- Create a html-file in the `templates`-folder to contain all the fragments. One file to rule them all. Call it `fragments.html`
This is an example with a re-usable `<head>` fragment, a header-fragment, and a footer-fragment:

```html
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">

<head th:fragment="head(title)">
    <title th:text="${title}"></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../public/css/styles.css" th:href="@{/css/styles.css}" rel="stylesheet"/>
</head>

<body>

    <header th:fragment="header" style="width:100%;border-bottom:1px solid black;">
        <img src="../public/images/fourthingsplus.png" th:src="@{/images/fourthingsplus.png}" width="100%"/>
    </header>

    <footer th:fragment="footer" style="width:100%;border-top:1px solid black;">
        Dette er så en footer.
    </footer>

</body>
</html>
```

These fragments can replace html-elements in another document like this:

```html
<div th:replace="~{fragments :: head('Frontpage')}"></div>
<div th:replace="~{fragments :: header}"></div>
<div th:replace="~{fragments :: footer}"></div>
```

> **OBS!** Use the fragments wisely. The upside of fragments is adhering to the [DRY principle](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself). The downside is destroying the Thymeleaf principle of [Natural Templating](https://www.thymeleaf.org/#natural-templates). Natural Templating means that you can show your template in a normal browser. The browser cannot interpret fragments, so they spoil the party. You need to run the template through the Thymeleaf engine for fragments to work. And you need to compile and run your Javalin project to make that happen. This takes extra time, and makes it hard to delegate template building to frontend staff. A compromise could be to keep the `<head>` section on each template and then stuff menus, footers etc in fragments. If you put the `<head>` section in a fragment, you will miss importing stylesheets etc. Think about it. You might also reade this [comment by one of the developers](https://stackoverflow.com/questions/22114657/how-to-deal-with-code-duplication-when-natural-templating-e-g-thymeleaf) of Thymeleaf.

### 2. How to use fragments with parameters

In the fragment-example above - notice how the text 'Frontpage' is passed as an argument to the fragment.
Also notice how the parameter is used in the fragment: `<title th:text="${title}"></title>`

### 3. How to add an image

To insert an image do like this:

```html
 <img src="../public/images/fourthingsplus.png" th:src="@{/images/fourthingsplus.png}" width="100%"/>
```

Note: place the image file in the `/public/images` folder. The `th:src="@{/images/fourthingsplus.png}"` attribute
is used by Thymeleaf. The other attribute: `src="../public/images/fourthingsplus.png"` will be applied in case you open the file directly in a browser instead of through the Thymeleaf template engine.

### 4. How to iterate through a list (each ....)

This example assumed that a list of user objects are passed from Javalin:

```html
 <h1>Users</h1>
<table>
   <thead>
   <tr>
   <th>username</th>
   <th>password</th>
   <th>role</th>
   </tr>
   </thead>
   <tbody>
   <tr th:each="user : ${userList}">
      <td th:text="${user.username}">username</td>
      <td th:text="${user.password}">password</td>
      <td th:text="${user.role}">role</td>
   </tr>
   </tbody>
</table>
```

That's how the `th:each` attribute works. It's is important that you spell the attribute names correctly. `username`,
`password`, and `role` should be attributes in the Java User class.

### 5. How to use conditionals (if ...)

Check for details in the [Thymeleaf docs](https://www.thymeleaf.org/doc/tutorials/3.1/usingthymeleaf.html#simple-conditionals-if-and-unless).

An example of how to apply `if`:

```html
  <p th:if="${not #lists.isEmpty(userList)}">Listen er ikke tom</p>
```

Another way is to use the ternary operator `If-then-else: (if) ? (then) : (else)` like this:

```html
<p th:text="${not #lists.isEmpty(userList) ? userList.size + ' in list' : 'Den er tom' }">Ikke tom</p>
```

### 6. How to add a link

The link (url/route) should be given in the th:href attribute. In this example as `th:href="@{/createuser}"`. It means
that the navigation will be forwarded to /createuser. However, if you want to open the html document in a browser directly, then the first link will work: `href="createuser.html"`.

```html
<a href="createuser.html" th:href="@{/createuser}">Create account</a>
```

## Javalin & Thymeleaf

### 1. How to transfer data between frontend and backend

To make the website dynamic means to adapt the html pages to user-input.

#### 1.a From backend to frontend

Use a hashmap to add objects you want to transfer to a Thymeleaf template. Add to the built-in maps in the `ctx` object:

`ctx` maps:

- Session Scope

```Java
ctx.sessionAttribute("userList", userList);
```

- Request Scope

```Java
ctx.attribute("totalSum", 1025);
```

And then render the template including your attributes:

```Java
ctx.render("index.html");
```

From HTML and Thymeleaf, the hashmaps are accessible in various ways.

- Session Scope

```html
<p th:text="${session.email}"></p>
```

- Request Scope

```html
<p th:text="${name}"></p>
```

Note: unfortunately, IntelliJ is not able to provide autocompletion and name resolution for scope and model variables.
Luckily it works anyway. A work-a-round is to define the variables as Thymeleaf variables in the beginning of the body block:

```html
<body>
   <!--@thymesVar id="hello" type="String"-->
   <div th:text="${hello}"></div>
</body>
```

In this way we get autocompletion. But it's probably not worth it.

#### 1.b From frontend to backend

There are two ways to send values from a html page to the Javalin backend:

1. As query parameters (GET link)

In the html page:

```html
<a href="/users?usergroup=1&page=2">view users</a>
```

The two query parameters `usergroup` and `page` is sent to the backend route `/users`. When arrived you can
retrieve the parameters like this:

```Java
int usergroup = Integer.parseInt(ctx.queryParam("usergroup"));
int page = Integer.parseInt(ctx.queryParam("page"));
```

Note: In an ideal world we should wrap the conversions in a try-catch block, since `ctx.queryParam("usergroup")` and
`ctx.queryParam("page")` return a `String` - hopefully with a value.

2. As form parameters (GET or POST )

In the html page:

```html
<form method="post">
    <input type="text" name="username" placeholder="username">
    <input type="password" name="password" placeholder="password">
    <button formaction="/login" type="submit" value="login">Login</button>
</form>
```

The two form parameters `username` and `password` are sent along the http POST request to Javalin and lands at the route "/login".
Then the values can be retrieved like this:

```Java
String userName = ctx.formParam("username");
String password = ctx.formParam("password");
```

Note: it is easy to spell the name attribute wrong in the form element. In the `<input type="text" name="username" placeholder="username">` element `name="username"` is the form parameter that we expect on the Javalin side.
