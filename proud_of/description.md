## Project Description
Imagine that you have just acquired a new company.  Unfortunately, the company has never stored their data in a database and instead uses a plain text file.  We need to create a way for the new subsidiary to import their data into a database.

Here's what the web-based application must do:

1. The app must accept (via a form) a tab delimited file with the following columns: purchaser name, item description, item price, purchase count, merchant address, and merchant name.  You can assume the columns will always be in that order, that there will always be data in each column, and that there will always be a header line.  An example input file named example_input.tab is included in this repo.
2. The app must parse the given file, normalize the data, and store the information in a relational database.
3. After upload, the application should display the total amount gross revenue represented by the uploaded file.


## Code Samples

I have supplied two of the files from the web-based application that I built, the primary model and associated controller for importing uploaded data into the database:

- `file_upload.rb`
- `file_uploads_controller.rb`


