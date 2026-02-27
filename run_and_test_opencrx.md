# How to Run and Test OpenCRX

OpenCRX is a Java enterprise application that runs on **Apache TomEE** and typically uses **HSQLDB** for its default database.

## 1. How to Run the Application

The project includes an installer image that contains the necessary server components.

### Prerequisites
- Java 21 (already configured in `gradle.properties`)
- The project must be built (`.\gradlew build`) to generate the `core-6.0.3.ear` file.

### Setup Steps
1. **Server Location**: The base server is located at:
   `d:\ai\research\opencrx\installer\image\opencrx-server\installer\files\apache-tomee-plus-10.1.2.zip`
2. **Configuration**:
   - Extract the TomEE zip.
   - Copy the configuration files from `installer\image\opencrx-server\installer\files\` to the TomEE directory:
     - `tomee.xml`, `server.xml`, `tomcat-users.xml` -> `conf/`
     - `opencrx.bat`, `setenv.bat`, `catalina-openmdx.jar` -> `bin/`
3. **Database**: 
   - OpenCRX uses HSQLDB by default. The pre-configured data is in `installer\image\opencrx-server\data\hsqldb`.
   - You need to start the HSQLDB server so it's available at `jdbc:hsqldb:hsql://127.0.0.1:9001/CRX` (port can vary based on config).
4. **Deployment**:
   - Copy the built EAR file: `d:\ai\research\opencrx\core\build\libs\core-6.0.3.ear`
   - To the TomEE deployment directory (usually `apps/` as per `tomee.xml`).
5. **Start Server**:
   - Run `bin\opencrx.bat run` from the TomEE directory.
6. **Access UI**:
   - Open browser to: `http://localhost:8080/opencrx-core-CRX`
   - **Login Credentials**:
     - guest / guest
     - admin-Standard / admin-Standard
     - admin-Root / admin-Root

## 2. How to Test the Application

### Automated Tests (Unit & Integration)
The project uses JUnit 5 for testing.

- **Run all tests**:
  ```powershell
  .\gradlew test
  ```
- **Run core module tests**:
  ```powershell
  .\gradlew :core:test
  ```
- **View Test Reports**:
  After running tests, you can find the HTML reports at:
  `d:\ai\research\opencrx\core\build\reports\tests\test\index.html`

### Manual Testing
- Use the **Workflow Controller** available in the UI (Admin -> Wizards -> openCRX Workflow Controller) to test background services.
