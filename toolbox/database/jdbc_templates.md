---
title: JDBC templates
description: Code snippets for jdbc methods
layout: default
parent: Databases
grand_parent: Toolbox
nav_order: 1
permalink: /toolbox/databases/jdbc_snippets/
---

# Diverse DB-CRUD fra Java

Disse beskrivelser er generelle anvisninger i brugen af JDBC. Først vises hvordan vi laver en forbindelse til Postgres fra Java. Senere på semestret skal vi af effektivitetshensyn anvende en såkaldt `ConnectionPool`, men først gør vi det så enkelt som muligt - og laver en enkelt forbindelse, der åbnes og lukkes hver gang vi skal have fat i databasen.

<!-- TOC tocDepth:2..3 chapterDepth:2..6 -->

- [JDBC driver dependency](#jdbc-driver-dependency)
- [Create script](#create-script)
- [JDBC Connection](#jdbc-connection)
- [Skræddersyet DatabaseException og fejlhåndtering](#skræddersyet-databaseexception-og-fejlhåndtering)
- [UserMapper og getUserById](#usermapper-og-getuserbyid)
- [Eksempel på hvordan man fyrer mapper metoderne af fra Main](#eksempel-på-hvordan-man-fyrer-mapper-metoderne-af-fra-main)
- [getUserByName](#getuserbyname)
- [getAllUsers](#getallusers)
- [createUser](#createuser)
- [updateUser](#updateuser)
- [deleteUser](#deleteuser)

<!-- /TOC -->

## JDBC driver dependency

Tilføj denne til din pom.xml fil:

```xml
 <dependencies>
    <dependency>
        <groupId>org.postgresql</groupId>
        <artifactId>postgresql</artifactId>
        <version>42.6.0</version>
    </dependency>
</dependencies>
```

Og opdater dine Maven dependencies. Så er den rigtige postgres driver klar til brug.

## Create script

Følgende eksempler er bygget på denne Postgres `users` tabel:

```sql
-- DROP TABLE IF EXISTS public.users;

CREATE TABLE IF NOT EXISTS public.users
(
    user_id integer NOT NULL DEFAULT nextval('users_user_id_seq'::regclass),
    user_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    password character varying(50) COLLATE pg_catalog."default" NOT NULL,
    role character varying(10) COLLATE pg_catalog."default" NOT NULL DEFAULT USER,
    CONSTRAINT users_pkey PRIMARY KEY (user_id)
)
```

## JDBC Connection

For at få adgang til databasen skal der oprettes en connection.

Denne Java klasse, kaldet `DatabaseConnector` kan man evt. instantiere, og så anvende `getConnection` metoden i sine datamappere:

```java
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnector
{
    private Connection connection;
    private final String USERNAME;
    private final String PASSWORD;
    private final String URL;

    public DatabaseConnector(String username, String password, String url) throws DatabaseException
    {
        this.USERNAME = username;
        this.PASSWORD = password;
        this.URL = url;
        try
        {
            Class.forName("org.postgresql.Driver");
        }
        catch (ClassNotFoundException e)
        {
            throw new DatabaseException("Could not find the database driver");
        }
    }

    public Connection getConnection() throws SQLException
    {
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            return connection;
    }
}
```

OBS! `Class.forName` er normalt ikke nødvendig. Den fyres af for at Postgres-driveren kan findes af vores JVM på runtime. Det kan være et problem når koden kører på f.eks. en webserver. Men efter JDBC 4.0 skulle det være løst. Den er taget med her, så det helt sikkert kører. Hvis vi fx. glemmer at tilføje Postgres driveren som dependency i `pom.xml` smides en exception når koden når til:

```java
Class.forName("org.postgresql.Driver");
```

Så på den måde er metoden nyttig uanset om den er strengt nødvendig.

## Skræddersyet DatabaseException og fejlhåndtering

Når vi skal tilgå en database kan der opstå alverdens fejl. Sådan er det altid med I/O. Derfor skal mange metoder omsluttes af try/catch for at kunne håndtere fejl. I catch-delen vil vi gerne kunne angive en fejlmeddelelse, der er så specifik som muligt. Derfor kan det være en fordel at lave sin egen exception-klasse. Vi kalder den for `DatabaseException` og den kan se således ud:

```Java
import java.sql.SQLException;

public class DatabaseException extends Exception
{
    public DatabaseException(String errorMessage)
    {
        super(errorMessage);
    }

    public DatabaseException(String errorMessage, SQLException exception)
    {
        super(errorMessage, exception);
    }
}
```

Hvis man anvender constructor'en med to parametre, kan man både angive sin egen hjemmestrikkede fejlmeddelelse og samtidig sende det oprindelige exception objekt videre. Det oprindelige object er af typen SQLException. Herfra kan man grave en detaljeret fejl ud, som kan lede udvikleren på sporet. Den besked som er indeholdt i `errorMessage`, er den som vi selv finder på hvor fejlene opstår. De beskeder er tiltænkt brugergrænsefladen. Altså en brugervenlig besked.

## UserMapper og getUserById

Denne klasse indeholder en række CRUD methoder, der har med `users` tabellen at gøre. Ofte har man en række entiteter i Java med en tilsvarende tabel i Postgres. For at gøre vores kode så overskuelig som muligt, kan vi oprette en såkaldt "Mapper Class" til hver entitet/tabel par. Det er dog ikke muligt at gøre det helt stringent. F.eks. laver vi ofte blandede sql-sætninger, hvor vi ved hjælp af joins blander data fra mange tabeller. I de tilfælde er det op til ens egen fantasi at placere metoderne.

Herunder ses en struktur for en `UserMapper`. Objekter instantieret med en DatabaseConnector, der skydes ind udefra. Det kaldes for `dependency injection` og gør at vi kan ændre på databaseforbindelse som vi har lyst. F.eks. når vi skal lave integrationstests etc.

```java
import dat.entities.User;
import dat.exceptions.DatabaseException;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserMapper
{
    private final DatabaseConnector databaseConnector;

    public UserMapper(DatabaseConnector databaseConnector)
    {
        this.databaseConnector = databaseConnector;
    }

    public User getUserById(int userId) throws DatabaseException
    {
        String sql = "SELECT * FROM users WHERE user_id = ?";
        try (var connection = databaseConnector.getConnection())
        {
            try (var prepareStatement = connection.prepareStatement(sql))
            {
                prepareStatement.setInt(1, userId);
                var resultSet = prepareStatement.executeQuery();

                if (resultSet.next())
                {
                    String userName = resultSet.getString("user_name");
                    String password = resultSet.getString("password");
                    String role = resultSet.getString("role");
                    return new User(userId, userName, password, role);
                } else
                {
                    return null;
                }
            }
        }
        catch (SQLException e)
        {
            throw new DatabaseException("Could not get users from the database", e);
        }
    }

    /* Herefter kommer resten af mapper metoderne */
}
```

## Eksempel på hvordan man fyrer mapper metoderne af fra Main

```java
public class Main
{
    private static final String USERNAME = "postgres";
    private static final String PASSWORD = "postgres";
    private static final String URL = "jdbc:postgresql://localhost:5432/databasename?currentSchema=public";
    private static DatabaseConnector databaseConnector;

    static
    {
        try
        {
            databaseConnector = new DatabaseConnector(USERNAME, PASSWORD, URL);
        }
        catch (DatabaseException e)
        {
            System.out.println(e.getMessage());

        }
    }

    public static void main(String[] args)
    {

        UserMapper userMapper = new UserMapper(databaseConnector);
        try
        {
            // Get a user by name
            User user = userMapper.getUserById("jon");
            System.out.println(user);
        }
        catch (DatabaseException e)
        {
            System.out.println(e.getMessage());
            System.out.println(e.getCause().getMessage());
        }
    }
}
```

## getUserByName

```java
public User getUserByName(String userName) throws DatabaseException
{
    String sql = "SELECT * FROM users WHERE user_name = ?";
    try (var connection = databaseConnector.getConnection())
    {
        try (var prepareStatement = connection.prepareStatement(sql))
        {
            prepareStatement.setString(1, userName);
            ResultSet resultSet = prepareStatement.executeQuery();

            if (resultSet.next())
            {
                int userId = resultSet.getInt("user_id");
                String password = resultSet.getString("password");
                String role = resultSet.getString("role");
                return new User(userId, userName, password, role);
            } else
            {
                return null;
            }
        }
    }
    catch (SQLException e)
    {
        throw new DatabaseException("Could not get users from the database", e);
    }
}
```

## getAllUsers

```java
public List<User> getAllUsers() throws DatabaseException
{
    List<User> users = new ArrayList<>();
    String sql = "SELECT * FROM users";
    try (
            var connection = databaseConnector.getConnection();
            var prepareStatement = connection.prepareStatement(sql);
            var resultSet = prepareStatement.executeQuery()
    )
    {
        while (resultSet.next())
        {
            int userId = resultSet.getInt("user_id");
            String userName = resultSet.getString("user_name");
            String password = resultSet.getString("password");
            String role = resultSet.getString("role");
            users.add(new User(userId, userName, password, role));
        }
    }
    catch (SQLException e)
    {
        throw new DatabaseException("Could not get users from the database", e);
    }
    return users;
}
```

## createUser

```java
public int createUser(User user) throws DatabaseException
{
    String sql = "INSERT INTO users (user_name, password, role) VALUES (?, ?, ?)";
    try (var connection = databaseConnector.getConnection())
    {
        try (var prepareStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS))
        {
            prepareStatement.setString(1, user.getUserName());
            prepareStatement.setString(2, user.getPassword());
            prepareStatement.setString(3, user.getRole());
            prepareStatement.executeUpdate();
            var keySet = prepareStatement.getGeneratedKeys();
            if (keySet.next())
            {
                return keySet.getInt(1);
            } else return -1;
        }
    }
    catch (SQLException e)
    {
        throw new DatabaseException("Could not create user in the database", e);
    }
}
```

## updateUser

```java
public void updateUser(User user) throws DatabaseException
{
    String sql = "UPDATE users SET user_name = ?, password = ?, role = ? WHERE user_id = ?";
    try (var connection = databaseConnector.getConnection())
    {
        try (var prepareStatement = connection.prepareStatement(sql))
        {
            prepareStatement.setString(1, user.getUserName());
            prepareStatement.setString(2, user.getPassword());
            prepareStatement.setString(3, user.getRole());
            prepareStatement.setInt(4, user.getUserId());
            prepareStatement.executeUpdate();
        }
    }
    catch (SQLException e)
    {
        throw new DatabaseException("Could not update user in the database", e);
    }
}
```

Her kunne man evt. overveje at returnere en integer med antallet af ændrede rækker (dvs, 1 hvis det går godt, ellers 0)

## deleteUser

```java
public void deleteUser(int userId) throws DatabaseException
{
    String sql = "DELETE FROM users WHERE user_id = ?";
    try (var connection = databaseConnector.getConnection())
    {
        try (var prepareStatement = connection.prepareStatement(sql))
        {
            prepareStatement.setInt(1, userId);
            prepareStatement.executeUpdate();
        }
    }
    catch (SQLException e)
    {
        throw new DatabaseException("Could not delete user from the database", e);
    }
}
```

Her kunne man evt. overveje at returnere en integer med antallet af ændrede rækker (dvs, 1 hvis det går godt, ellers 0)
