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

CREATE INDEX idx_medical_histories_patient_id ON medical_histories (patient_id);

CREATE TABLE
    invoices (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        total_amount DECIMAL NOT NULL,
        generated_at TIMESTAMP NOT NULL,
        payed_at TIMESTAMP NOT NULL,
        medical_history_id INT NOT NULL,
        CONSTRAINT fk_medical_histories FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id)
    );

CREATE INDEX idx_invoices_medical_history_id ON invoices (medical_history_id);

CREATE TABLE
    invoice_items (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        unit_price DECIMAL NOT NULL,
        quantity INT NOT NULL,
        total_price DECIMAL NOT NULL,
        invoice_id INT NOT NULL,
        treatment_id INT NOT NULL,
        CONSTRAINT fk_invoices FOREIGN KEY (invoice_id) REFERENCES invoices (id),
        CONSTRAINT fk_treatments FOREIGN KEY (treatment_id) REFERENCES treatments (id)
    );

CREATE TABLE
    treatments (
        id INT GENERATED ALWAYS AS IDENTITY,
        type VARCHAR(20) NOT NULL,
        name VARCHAR(50) NOT NULL,
        PRIMARY KEY (id)
    );

CREATE INDEX idx_invoice_items_invoice_id ON invoice_items (invoice_id);

CREATE INDEX idx_invoice_items_treatment_id ON invoice_items (treatment_id);