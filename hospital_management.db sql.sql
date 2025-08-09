BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Departments" (
	"department_id"	INTEGER,
	"department_name"	TEXT NOT NULL,
	PRIMARY KEY("department_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Employees" (
	"employee_id"	INTEGER,
	"first_name"	TEXT NOT NULL,
	"last_name"	TEXT NOT NULL,
	"role"	TEXT NOT NULL,
	"department_id"	INTEGER,
	PRIMARY KEY("employee_id" AUTOINCREMENT),
	FOREIGN KEY("department_id") REFERENCES "Departments"("department_id")
);
CREATE TABLE IF NOT EXISTS "Operations" (
	"operation_id"	INTEGER,
	"patient_id"	INTEGER,
	"doctor_id"	INTEGER,
	"operation_date"	DATE,
	"description"	TEXT,
	PRIMARY KEY("operation_id" AUTOINCREMENT),
	FOREIGN KEY("doctor_id") REFERENCES "Employees"("employee_id"),
	FOREIGN KEY("patient_id") REFERENCES "Patients"("patient_id")
);
CREATE TABLE IF NOT EXISTS "Patients" (
	"patient_id"	INTEGER,
	"first_name"	TEXT NOT NULL,
	"last_name"	TEXT NOT NULL,
	"date_of_birth"	DATE,
	"gender"	TEXT,
	"phone"	TEXT,
	PRIMARY KEY("patient_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Reservations" (
	"reservation_id"	INTEGER,
	"patient_id"	INTEGER,
	"clinic_name"	TEXT NOT NULL,
	"reservation_date"	DATE,
	PRIMARY KEY("reservation_id" AUTOINCREMENT),
	FOREIGN KEY("patient_id") REFERENCES "Patients"("patient_id")
);
CREATE TABLE IF NOT EXISTS "Rooms" (
	"room_id"	INTEGER,
	"room_type"	TEXT NOT NULL,
	"department_id"	INTEGER,
	PRIMARY KEY("room_id" AUTOINCREMENT),
	FOREIGN KEY("department_id") REFERENCES "Departments"("department_id")
);
INSERT INTO "Departments" VALUES (1,'Cardiology');
INSERT INTO "Departments" VALUES (2,'Neurology');
INSERT INTO "Departments" VALUES (3,'Orthopedics');
INSERT INTO "Employees" VALUES (1,'John','Smith','Doctor',1);
INSERT INTO "Employees" VALUES (2,'Emily','Davis','Nurse',1);
INSERT INTO "Employees" VALUES (3,'Robert','Brown','Doctor',2);
INSERT INTO "Operations" VALUES (1,1,1,'2025-08-01','Heart Surgery');
INSERT INTO "Operations" VALUES (2,2,3,'2025-08-05','Brain Surgery');
INSERT INTO "Patients" VALUES (1,'Michael','Johnson','1985-06-12','Male','555-1234');
INSERT INTO "Patients" VALUES (2,'Sarah','Williams','1990-03-25','Female','555-5678');
INSERT INTO "Reservations" VALUES (1,1,'Cardio Clinic','2025-08-10');
INSERT INTO "Reservations" VALUES (2,2,'Neuro Clinic','2025-08-15');
INSERT INTO "Rooms" VALUES (1,'ICU',1);
INSERT INTO "Rooms" VALUES (2,'General',2);
INSERT INTO "Rooms" VALUES (3,'Operation Theater',3);
COMMIT;
