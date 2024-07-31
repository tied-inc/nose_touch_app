
# Generate the schema for the database
make-migrations:
	dart run drift_dev schema dump lib/infra/database.dart drift_schemas/

watch:
	dart run build_runner watch --delete-conflicting-outputs