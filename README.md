# Skillable Integration Service

## Overview

To enable scoring, Life Cycle Actions (LCA) and Activity Based Assessments (ABA), the Skillable integration service must be installed on all Cloud hosted virtual machines that will use these features.

## Table of Contents

  * [Windows Virtual Machines](#windows-virtual-machines)
    + [Copy Integration Service Files and Run Configuration Script](#copy-integration-service-files-and-run-configuration-script)
    + [Verify Integration Service is Running](#verify-integration-service-is-running)
  * [Linux Virtual Machines](#linux-virtual-machines)
    + [Copy Integration Service Files and Run Configuration Script](#copy-integration-service-files-and-run-configuration-script-1)
    + [Verify Integration Service is Running](#verify-integration-service-is-running-1)

## Windows Virtual Machines

These features are enabled by installing the Skillable Integration Service by executing a PowerShell script in the VM. 

### Copy Integration Service Files and Run Configuration Script 

Before installing the integration service, there must not be any previous version of the service installed on the VM. 

1. Ensure there are no previous versions of the integration service installed on the VM: 
	1. Navigate to **Programs and Features** in the Control Panel and ensure there is no integration service listed in the installed list. 
1. Download the contents of this repository. This repository contains a PowerShell script and a folder that contains the integration service. You can download the repository contents by selecting the green **_Code_** button and then selecting **_Download ZIP_**.
    >[!note] The simplest method to get these files into the VM is to access this repository from the VM and download the files.
1. Copy the **downloaded VmIntgegrationService.zip** and **install.ps1** files to the virtual machine, using your preferred method to transfer files to the VM.
1. In the VM, move the downloaded **VmIntegrationService folder** to the **root of the VM's C drive**. 
1. Navigate back to the downloaded files, and **run the `install.ps1` PowerShell script**, as an administrator, by right-clicking and selecting the option to run as administrator. 
1. After the script is executed, **reboot the VM**.
1. Once the VM is rebooted, the integration service may take a few minutes to start. **Scoring, LCA and ABA will not function correctly until the integration service is running**. 
    >[!knowledge] Subsequent launches of this VM will have the same delayed start with the integration service. It is recommended to configure a delay to any Life Cycle Actions that are configured on lab profiles that use this VM. 

### Verify Integration Service is Running 

You can verify the service is running by following the steps below. 

1. Open a web browser in the VM. 
1. Navigate to the following URL: `localhost:2724`

If a page displays with the _Skillable Integration Service_ on the page, the service is running. Scoring, LCAs, and ABA will now function correctly.

You can verify the service can be reached externally by following these steps:

1. Open a web browser on a external internet connected machine.
1. Navigate to the following URL to ensure the service is reachable: `PublicIP:2724`

    If a page is displayed with _Skillable Integration Service_ on the page, the service is running. Scoring, LCA and ABA will now function correctly.

## Linux Virtual Machines

These features are enabled by installing the Skillable Integration Service by executing a Bash script in the VM using sudo or root.

### Copy Integration Service Files and Run Configuration Script

Before installing the integration service, there must not be any previous version of the service installed on the VM.
Steps provided are for use with operating systems using Systemd Initialization Service. 

1. Ensure there are no previous versions of the integration service installed on the VM.
1. Download and execute the installation script from the repository.

    ```sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/LearnOnDemandSystems/Skillable-Integration-Service/main/Linux/install.sh)"```

1. After script has executed, reboot the VM.

    ```sudo shutdown -r now```

1. Once the VM is rebooted, the integration service may take a few minutes to start. Scoring, LCAs, and ABAs will not function correctly until the integration service is running.

### Verify Integration Service is Running

You can verify the service is running by following these steps:

1. Open a web browser in the VM
1. Navigate to the following URL: `localhost:2724`

If a page displays with the _Skillable Integration Service_ on the page, the service is running. Scoring, LCAs, and ABA will now function correctly.

You can verify the service can be reached externally by following these steps:

1. Open a web browser on a external internet connected machine.
1. Navigate to the following URL to ensure the service is reachable: `PublicIP:2724`

If a page displays with the _Skillable Integration Service_ on the page, the service is running. Scoring, LCAs, and ABA will now function correctly.

You may also Start, Stop, Restart, and check the Status of the service with SystemCtl.

- **Start:**  `sudo systemctl start skillable.service`
- **Stop:** `sudo systemctl stop skillable.service`
- **Restart:** `sudo systemctl restart skillable.service`
- **Status:** `systemctl status skillable.service`