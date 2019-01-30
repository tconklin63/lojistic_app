# Lojistic Project

## Models
In addition to the `Invoice` and `Package` models, I have a `Report` model and corresponding `reports` table in the database. The Report class holds common information such as date filters, path to CSV file, and `report_type`. The column `report_type` contains string with the underscore version of the specific `Report` class to allow easy conversion to the class in the controller for generating the specific report. Each `report_type` will have its own model class that inherits from the base Report class and implements the `generate` method inherited from the base class. If the base class `generate` method is called, it raises a `NotImplementedError` exception to mimic the behavior of abstract methods in other languages such as Java.

## Controllers
The only controller I have included is the reports controller, which has a method, `generate_report`. The UI sends the parameters `start_date`, `end_date`, and `report_type` and the controller uses these parameters generate the report asychronously using `sidekiq`. The controller also has an `index` method to send to the front end all reports of a given type that are completed and not soft deleted, and a `delete_report` method to soft delete a report by setting the `deleted` field to true.

Other controllers would need to be added for maintaining the `Invoice` and `Package` data which would have the standard methods: `index`, `show`, `new`, `create`, `edit`, `update`, and `delete`.

## Additional Features
To flesh out this application, we would need to add user auth using a gem such as `devise`, and permissions using a gem such as `pundit`.
