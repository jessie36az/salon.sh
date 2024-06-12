-- Create the salon database
CREATE DATABASE salon;

-- Connect to the salon database
\c salon;

-- Create the customers table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR,
    phone VARCHAR UNIQUE
);

-- Create the services table
CREATE TABLE services (
    service_id SERIAL PRIMARY KEY,
    name VARCHAR
);

-- Create the appointments table
CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    service_id INT REFERENCES services(service_id),
    time VARCHAR
);

-- Insert at least three rows into the services table
INSERT INTO services (name) VALUES
    ('cut'),
    ('color'),
    ('perm');

  build:
    # The type of runner that the job will run on
    runs-on: ubuntu-latest

    # Steps represent a sequence of tasks that will be executed as part of the job
    steps:
      # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
      - uses: actions/checkout@v4

      # Runs a single command using the runners shell
      - name: Run a one-line script
        run: echo Hello, world!

      # Runs a set of commands using the runners shell
      - name: Run a multi-line script
        run: |
          echo Add other actions to build,
          echo test, and deploy your project.
