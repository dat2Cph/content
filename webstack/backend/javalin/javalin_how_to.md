# Javalin how-to

Begin creating a new project from scratch using this [tutorial](./setup.md). Then you might need to know how to ...

## [Javalin](#javalin-1)

1. [How to organize files](#1-how-to-organize-files)
2. [How to add more routes](#2-how-to-add-more-routes)
3. [How to add a database](#3-how-to-add-a-database)

## [Thymeleaf](#thymeleaf-1)

1. [How to re-use fragments in templates](#1-how-to-re-use-fragments-in-templates)
2. [How to use fragments with parameters](#2-how-to-use-fragments-with-parameters)
3. [How to add an image](#3-how-to-add-an-image)
4. [How to iterate through a list (each ....)](#4-how-to-iterate-through-a-list-each)
5. [How to use conditionals (if ...)](#5-how-to-use-conditionals-if)

## [Javalin & Thymeleaf](#javalin--thymeleaf-1)

1. [How to transfer data between frontend and backend](#1-how-to-transfer-data-between-frontend-and-backend)
   - [From backend to frontend](#1a-from-backend-to-frontend)
   - [From frontend to backend](#1b-from-frontend-to-backend)
2. [How to work with forms](#2-how-to-work-with-forms)



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

Add a connection pool with 3 JDBC Postgresql connections:

Add to beginning of Main-class:

```Java
private static final String USER = "postgres";
private static final String PASSWORD = "postgres";
private static final String URL = "jdbc:postgresql://localhost:5432/startcode?currentSchema=public";

private static final ConnectionPool connectionPool = ConnectionPool.getInstance(USER, PASSWORD, URL);
```

Then the database can be accessed like this:

```Java
public static List<User> getAllUsers(ConnectionPool connectionPool) throws DatabaseException
    {
        List<User> userList = new ArrayList<>();
        String sql = "select * from \"user\"";
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

## Thymeleaf

### 1. How to re-use fragments in templates

### 2. How to use fragments with parameters

### 3. How to add an image

### 4. How to iterate through a list (each ....)

### 5. How to use conditionals (if ...)

## Javalin & Thymeleaf

### 1. How to transfer data between frontend and backend

To make the website dynamic means to adapt the html pages to user-input.

#### 1.a From backend to frontend

Use a hashmap to add objects you want to transfer to a Thymeleaf template. Either add to the built-in maps in the `ctx` object:

`ctx` maps:

- Application scope:

```Java 
app.attribute("counter", count);
```

- Session Scope
```Java
ctx.sessionAttribute("userList", userList);
```

- Request Scope
```Java
ctx.attribute("totalSum", 1025);
```

Or use your own hashmap (model):

```Java
Map<String, Object> model = new HashMap<>();
model.put("totalSum", 1025);
```

and add it to the render method:

```Java
ctx.render("index.html", model)
```

If you don't use your own model object, then there is no need for adding to the render method. It will all be contained in `ctx`:

```Java
ctx.render("index.html");
```

#### 1.b From frontend to backend

### 2. How to work with forms
