# INSTRUCTIONS
Just drop into your **modules** folder or use the box-cli to install

`box install cborm`

Unfortunately, due to the way that ORM is loaded by ColdFusion, if you are using the ORM EventHandler or ActiveEntity or any ColdBox Proxies that require ORM, you must create an Application Mapping in the `Application.cfc` like this:

```js
this.mappings[ "/cborm" ] = COLDBOX_APP_ROOT_PATH & "modules/cborm";
```

## WireBox DSL
The module also registers a new WireBox DSL called `entityservice` which can produce virtual or base orm entity services:

- `entityservice` -  Inject a global ORM service
- `entityservice:{entityName}` - Inject a Virtual entity service according to `entityName`

## Settings
Here are the module settings you can place in your `ColdBox.cfc` under an `orm` structure:

```js
orm = {
    injection = {
        enabled = true, include = "", exclude = ""
    }
}
```

## Validation
We have also migrated the `UniqueValidator` from the **validation** module into our
ORM module.  It is mapped into wirebox as `UniqueValidator@cborm` so you can use in your constraints like so:

```js
{ fieldName : { validator: "UniqueValidator@cborm" } }
```

## Documentation
- http://wiki.coldbox.org/wiki/ORM:BaseORMService.cfm
- http://wiki.coldbox.org/wiki/ORM:ActiveEntity.cfm
- http://wiki.coldbox.org/wiki/ORM:VirtualEntityService.cfm
- http://wiki.coldbox.org/wiki/ORM:ORMEventHandler.cfm
- http://wiki.coldbox.org/wiki/ORM:CriteriaBuilder.cfm
- http://wiki.coldbox.org/wiki/ORM:DetachedCriteriaBuilder.cfm
