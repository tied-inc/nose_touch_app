
# Generate the schema for the database
make-migrations:
	dart run drift_dev schema dump lib/backend/models/database.dart drift_schemas/

build-runner-watch:
	dart run build_runner watch --delete-conflicting-outputs

build-runner-build:
	dart run build_runner build --delete-conflicting-outputs