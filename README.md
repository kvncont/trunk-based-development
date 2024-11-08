# Trunk Based Development
 
This project uses GitHub Actions to automate the release management workflow. Below is a description of each action involved and the event that triggers it.

## Description of Actions

### Release Drafter 📦
- **Event:** Push to the `main` branch, Pull Request (opened, reopened, synchronized) to the `main` branch.
- **Description:** Updates the release draft with the latest changes to prepare for the next release.
- **File:** [`.github/workflows/release-drafter.yml`](.github/workflows/release-drafter.yml)

### Maven Build 🏗️
- **Event:** Push to the `main` branch, Pull Request, Workflow Dispatch.
- **Description:** Executes the Maven build process, including compilation, testing, static analysis, and packaging.
- **File:** [`.github/workflows/maven-build.yml`](.github/workflows/maven-build.yml)

### Docker Build 🐳
- **Event:** Push with tags matching `v*.*.*`, Pull Request, Workflow Dispatch.
- **Description:** Builds and publishes the Docker image of the application.
- **File:** [`.github/workflows/docker-build.yml`](.github/workflows/docker-build.yml)

### Promote Artifact 🚦
- **Event:** Workflow Dispatch.
- **Description:** Promotes the built artifact to the Development, QA, and Staging environments.
- **File:** [`.github/workflows/promote-artifact.yml`](.github/workflows/promote-artifact.yml)

### Check Issues 📚
- **Event:** Pull Request.
- **Description:** Verifies that related issues are correctly linked in the pull request.
- **File:** [`.github/workflows/check-issues.yml`](.github/workflows/check-issues.yml)

### Veracode Pipeline Scan 🚨
- **Event:** Pull Request.
- **Description:** Performs a security scan to identify potential vulnerabilities in the code.
- **File:** [`.github/workflows/veracode-pipeline-scan.yml`](.github/workflows/veracode-pipeline-scan.yml)

### Project Mapping 🎯
- **Event:** Pull Request, Issues.
- **Description:** Associates the pull request or issue with the corresponding GitHub project.
- **File:** [`.github/workflows/project-mapping.yml`](.github/workflows/project-mapping.yml)

### Veracode Policy Scan 🛡️
- **Event:** Scheduled (Cron: `0 1 * * 1`).
- **Description:** Executes a weekly security policy scan to ensure compliance.
- **File:** [`.github/workflows/veracode-policy-scan.yml`](.github/workflows/veracode-policy-scan.yml)

### Veracode Flaw Importer 📍
- **Event:** Scheduled (Cron: `0 5 * * 1`).
- **Description:** Imports vulnerabilities detected by Veracode and creates GitHub issues for them.
- **File:** [`.github/workflows/veracode-flaw-importer.yml`](.github/workflows/veracode-flaw-importer.yml)
