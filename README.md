# Skillable Integration Service

## Enable Scoring, Life Cycle Actions and Activity Based Assessments

To enable scoring, Life Cycle Actions (LCA) and Activity Based Assessments (ABA), the Skillable integration service must be installed on all Windows-based virtual machines that will use these features.

These features are enabled by installing the Skillable Integration Service by executing a PowerShell script in the VM. 

### Copy Integration Service Files and Run Configuration Script 

Before installing the integration service, there must not be any previous version of the service installed on the VM. 

1. Ensure there are no previous versions of the integration service installed on the VM: 
	1. Navigate to **Programs and Features** in the Control Panel and ensure there is no integration service listed in the installed list. 
1. Navigate to [Skillable Integration Service GitHub page](https://github.com/LearnOnDemandSystems/Skillable-Integration-Service) and download the contents of the repository. This repository contains a PowerShell script and a folder that contains the integration service. 
    >[!note] You can download the repository contents by selecting the green **_Code_** button and then selecting **_Download ZIP_**. 
1. Copy the **downloaded files to the Virtual Machine**, using your preferred method to transfer files into the VM. 
1. In the VM, move the downloaded **VmIntegrationService folder** to the **root of the VM's C drive**. 
1. Navigate back to the downloaded files, and **run the `install.ps1` PowerShell script**, as an administrator, by right-clicking and selecting the option to run as administrator. 
1. After the script is executed, **reboot the VM**.
1. Once the VM is rebooted, the integration service may take a few minutes to start. **Scoring, LCA and ABA will not function correctly until the integration service is running**. 
    >[!knowledge] Subsequent launches of this VM will have the same delayed start with the integration service. It is recommended to configure a delay to any Life Cycle Actions that are configured on lab profiles that use this VM. 

### Verify Integration Service is Running 

You can verify the service is running by following the steps below. 

1. Open a web browser in the VM. 
1. Navigate to the following URL: `localhost:2724`

    If a page is displayed with _Skillable Integration Service_ on the page, the service is running. Scoring, LCA and ABA will now function correctly.

