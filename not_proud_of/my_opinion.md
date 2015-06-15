## Why I'm Not Proud Of It

Overall I'm relatively proud of this code sample, but there are definetely some areas where I think it should be improved upon.  Namely: 

- Not sure it is necessary/wise to be using an `initialize` method to initially create the empty array and its associated instance variable in this case.  The empty array is needed, but perhaps it could have been created and assigned in a private method.
- The `sequence_dictionary` method is a bit long.  Perhaps it could have been further broken down into a few single purpose, private methods.
- Calling the `output_results` method at the end of the `sequence_dictionary` method.  Perhaps this could be a public method, called on its own, allowing the `sequence_dictionary` method to have more of a single, actionable focus.