## Why I'm Proud Of It

I'm proud of these code samples because:

- The controller is skinny, with all of the logic extracted into the model
- All but one of the methods are five lines or less, with a single, actionable purpose
- Only two of the methods are public (the two that are called in the controller).  The remaining supporting methods are all private.
- All variable assignments are used and purposeful.
- The method and variable names are relevant and explanatory.
- Only the current user's ID is passed as a parameter, not an entire active record object
- There are very few database calls