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
   a. [From backend to frontend](#1a-from-backend-to-frontend)
   b. [From frontend to backend](#1b-from-frontend-to-backend)
2. [How to work with forms](#2-how-to-work-with-forms)



## Javalin

### 1. How to organize files

### 2. How to add more routes 

### 3. How to add a database

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


