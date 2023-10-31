CREATE TABLE
    medical_histories (
        id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        admitted_at TIMESTAMP NOT NULL,
        patient_id INT NOT NULL,
        status VARCHAR(20) NOT NULL,
        CONSTRAINT fk_patient_id FOREIGN KEY (patient_id) REFERENCES patients (id) ON DELETE CASCADE
    );

CREATE TABLE
    patients (
        id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        date_of_birth DATE NOT NULL
    );