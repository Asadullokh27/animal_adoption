CREATE TABLE groups(
    id BIGINT NOT NULL,
    subject_id BIGINT NOT NULL
);
ALTER TABLE
    groups ADD PRIMARY KEY(id);
CREATE TABLE Subject(
    id BIGINT NOT NULL,
    name TEXT NOT NULL
);
ALTER TABLE
    Subject ADD PRIMARY KEY(id);
CREATE TABLE learning_center(
    id BIGINT NOT NULL,
    student_id BIGINT NOT NULL,
    group_id BIGINT NOT NULL
);
ALTER TABLE
    learning_center ADD PRIMARY KEY(student_id,group_id);
CREATE TABLE Student(
    id BIGINT NOT NULL,
    Full_name TEXT NOT NULL,
    age BIGINT NOT NULL
);
ALTER TABLE
    Student ADD PRIMARY KEY(id);
ALTER TABLE
    learning_center ADD CONSTRAINT learning_center_group_id_foreign FOREIGN KEY(group_id) REFERENCES groups(id);
ALTER TABLE
    groups ADD CONSTRAINT groups_subject_id_foreign FOREIGN KEY(subject_id) REFERENCES Subject(id);
ALTER TABLE
    learning_center ADD CONSTRAINT learning_center_student_id_foreign FOREIGN KEY(student_id) REFERENCES Student(id);
