INSTRUCTIONS
============

Just drop into your **modules** folder or use the box-cli to install

`box install cbvalidation`

The module will register several objects into WireBox using the `@cbvalidation` namespace.  The validation manager is registered as `ValidationManager@cbvalidation`

## Mixins
The module will also register two methods in your handlers/interceptors/layouts/views

```js
/**
* Validate an object or structure according to the constraints rules.
* @target An object or structure to validate
* @fields The fields to validate on the target. By default, it validates on all fields
* @constraints A structure of constraint rules or the name of the shared constraint rules to use for validation
* @locale The i18n locale to use for validation messages
* @excludeFields The fields to exclude in the validation
* 
* @return cbvalidation.model.result.IValidationResult
*/
function validateModel()

/**
* Retrieve the application's configured Validation Manager
*/
function getValidationManager()
```

## Settings
Here are the module settings you can place in your `ColdBox.cfc` by using the `validation` settings structure:

```js
validation = {
    // The third-party validation manager to use, by default it uses CBValidation.
	manager = "class path",
    // You can store global constraint rules here with unique names
	sharedConstraints = {
		name = {
			field = { constraints here }
		}
	}

}
```

You can read more about ColdBox Validation here: http://wiki.coldbox.org/wiki/Validation.cfm