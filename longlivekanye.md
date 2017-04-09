### 🏁Built-In Type Methods

Briefly, there is a String (capital S) object wrapper form, typically called a "native," that pairs with the primitive string type; it's this object wrapper that defines the toUpperCase() method on its prototype.



### 🏁Truthy & Falsy

The specific list of "falsy" values in JavaScript is as follows:

- "" (empty string)
- 0, -0, NaN (invalid number)
- null, undefined
- false

Any value that's not on this "falsy" list is "truthy."



### 🏁Hoisting

Wherever a var appears inside a scope, that declaration is taken to belong to the entire scope and accessible everywhere throughout.

Metaphorically, this behavior is called hoisting, when a var declaration is conceptually "moved" to the top of its enclosing scope.



### 🏁Function Scope and Block Scope

``var`` will be hoisted in block scope, but ``let`` won't



### 🏁Switch Case

If you omit break from a case, and that case matches or runs, execution will continue with the next case's statements regardless of that case matching. This so called "fall through" is sometimes useful/desired

```javascript
switch (a) {
    case 2:
    case 10:
        // some cool stuff
        break;
    case 42:
        // other stuff
        break;
    default:
        // fallback
}
```

if a is either 2 or 10, it will execute the "some cool stuffff" code statements.



### 🏁Modules

The most common usage of **closure** in JavaScript is the **module** pattern. Modules let you define **private** implementation details (variables, functions) that are hidden from the outside world, as well as a public API that is accessible from the outside.



### 🏁Prototypes

When you reference a property on an object, if that property doesn't exist, JavaScript will automatically use that object's internal prototype reference to find another object to look for the property on. You could think of this almost as a fallback if the property is missing.

The most common way this feature is used -- and I would argue, abused -- is to try to emulate/fake a "class" mechanism with "inheritance."



### 🏁NaN

**NaN** value is the only one that would make x !== x be true.

