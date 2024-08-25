# Freifunk GSoC Wizard

## Introduction

The **Freifunk GSoC Wizard** is a modular assistant designed to simplify the initial setup of OpenWrt devices. This wizard provides a user-friendly web interface using the LuCI framework, allowing users to easily configure their devices without needing advanced knowledge of router configurations.

## Documentation

### Project Structure

The project repository contains the following elements:

- **`files/`**: Directory containing all necessary files for the wizard, including scripts, configuration files, and static resources.
  - **`rpcd.sh`**: Script for router configuration, responsible for applying user-entered configurations.
  - **`htmlview.js`**: JavaScript script for the user interface.
  - **`form.js`**: JavaScript script for handling configuration forms.
  - **`styles.css`**: CSS stylesheet for the web interface.
  - **`config-uci.conf`**: Configuration file used to store user settings.

- **`Makefile`**: File used to build and install the package on OpenWrt. Ensure that this file is correctly configured to include all necessary files in the final package.

- **`README.md`**: Document that provides an overview of the project and instructions for development, installation, and use of the wizard.

### Installation and Execution

1. **Prepare the Environment**:
   - Ensure that the `rpcd.sh` file has execution permissions:
     ```sh
     chmod +x files/rpcd.sh
     ```

2. **Configure the Makefile**:
   - Verify that the `Makefile` is configured to include the `rpcd.sh` file and other necessary files in the installation package.

3. **Build the Package**:
   - Run the following command to build the package in OpenWrt:
     ```sh
     make package/falter-packages-GSoC-wizard/compile
     ```

4. **Install and Test**:
   - Install the package on your OpenWrt device and verify the functionality of the wizard through the provided web interface.
