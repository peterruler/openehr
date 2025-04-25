# OpenEHR - Opensource

## Online Resources

- [Medblocks YouTube Playlist](https://www.youtube.com/watch?v=kOU2HGqK23o&list=PLUr-PTsPYKV4Cl7gUe5sPoCQEfRJ3FpWW) by Sidarth Ramesh
- [Clinical Knowledge Manager (CKM)](https://ckm.openehr.org/ckm/)
- [openEHR Designer](https://tools.openehr.org/designer/#)
- [EHRbase Documentation](https://docs.ehrbase.org/docs/EHRbase/openEHR-Introduction/Template)
- [EHRbase GitHub Repository](https://github.com/ehrbase/ehrbase/)
- [EHRbase Docker Hub](https://hub.docker.com/r/ehrbase/ehrbase)

---

## Steps to Set Up and Use EHRbase

### Step 1: Prepare Archetypes and Templates
1. Download archetypes from the [Clinical Knowledge Manager (CKM)](https://ckm.openehr.org/ckm/).
2. Use the [openEHR Designer](https://tools.openehr.org/designer/#) to create a template:
   - Deactivate all properties except systolic and diastolic blood pressure.
   - Export the template as `.opt` file (e.g., `petetest.opt`).
3. Generate a UUID for the template.

### Step 2: Upload the Template
1. Use a REST client (e.g., [Postman](https://www.postman.com/) or [Insomnia](https://insomnia.rest/)) to upload the `.opt` file.
2. Endpoint: `http://localhost:8080/ehrbase/rest/openehr/v1/definition/template/adl1.4`
3. Use Basic Authentication with credentials from `.env.ehrbase`:
   - Username: `ehrbase-user`
   - Password: `SuperSecretPassword`

Example `curl` command:
```bash
curl -X POST \
  -u ehrbase-user:SuperSecretPassword \
  -H "Content-Type: application/xml" \
  --data-binary @petetest.opt \
  http://localhost:8080/ehrbase/rest/openehr/v1/definition/template/adl1.4
```

### Step 3: Create an EHR Record
1. Use the composition endpoint to create an EHR record:
   - Endpoint: `http://localhost:8080/ehrbase/rest/openehr/v1/ehr/`
2. Retrieve the EHR ID from the response.

### Step 4: Upload Data via Medblocks
1. Configure the Medblocks All-Forms app:
   - Set required URLs, UUID (EHR ID), and authentication credentials from `.env.ehrbase`.
2. Use the blood pressure form in the app.
3. Fill out the form and save. A success message should appear.

![success](/success.png?raw=true "success")

---

## Software

### Clinical Knowledge Manager (CKM)
- [CKM](https://ckm.openehr.org/ckm/)

### Archetype Designer
- [openEHR Designer](https://tools.openehr.org/designer/#)

### EHRbase Server
- Clone the repository: `git clone https://github.com/ehrbase/ehrbase/`
- create a `.env.ehrbase` file (copy it from this repo) in the root of the ehrbase-directory
- Install via `docker-compose.yml` (recommended):
  - Ensure [Docker Desktop](https://www.docker.com/products/docker-desktop/) is installed.
  - Run:
    ```bash
    cd ehrbase
    docker compose up
    ```
- Alternatively, download [EHRbase](https://www.ehrbase.org/download).

### Medblocks
- Clone the repository: `git clone https://github.com/medblocks/all-forms`
- Run:
  ```bash
  cd all-forms
  docker compose up
  ```
- Access the app at `http://localhost:3000`.

![medblocks](/medblocks.png?raw=true "medblocks")

---

## Additional Resources

### Docker Resources
- [EHRbase Docker Hub](https://hub.docker.com/r/ehrbase/ehrbase)
- [Postgres Docker Hub](https://hub.docker.com/_/postgres)

### Authentication
- Basic Authentication:
  - Username: `ehrbase-user`
  - Password: `SuperSecretPassword`
- Admin Authentication:
  - Username: `ehrbase-admin`
  - Password: `EvenMoreSecretPassword`

### REST Endpoints
- Upload Template: `http://localhost:8080/ehrbase/rest/openehr/v1/definition/template/adl1.4`
- Create EHR Record: `http://localhost:8080/ehrbase/rest/openehr/v1/ehr/`
- Retrieve Template: `http://localhost:8080/ehrbase/rest/openehr/v1/definition/template/adl1.4/petetest`

### Postgres Documentation
- [Postgres Docker Hub](https://hub.docker.com/_/postgres)

### EHR Tools
- [Cabolabs Toolkit](https://toolkit.cabolabs.com/)

### EHRbase SDK
- [EHRbase SDK](https://github.com/ehrbase/openEHR_SDK)
