## Enable Scoring, Life Cycle Actions, and Activity Based Assessments in Linux-based AWS VMs

To enable scoring, Life Cycle Actions (LCA) and Activity Based Assessments (ABA), the Skillable integration service must be installed on all AWS hosted Linux-based virtual machines that will use these features.

These features are enabled by installing the Skillable Integration Service by executing a shell script in the VM.

## Copy Integration Service Files and Run Configuration Script
Before installing the integration service, there must not be any previous version of the service installed on the VM.

1.  Ensure there are no previous versions of the integration service installed on the VM.
1. Download the installation script from the repository.

    i. ```sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ChadSpears/Skillable-Integration-Service/main/Linux/install.sh)"```

1. After script has executed, reboot the VM. ```sudo shutdown -r now```
1. Once the VM is rebooted, the integration service may take a few minutes to start. Scoring, LCAs, and ABAs will not function correctly until the integration service is running.

## Verify Integration Service is Running
You can verify the service is running by following these steps:

1. Open a web browser in the VM
1. Navigate to the following URL: `localhost:2724`

You can verify the service can be reached by following these steps:

1. From a web browser on a external internet connected machine.
1. You may navigate to the following URL to ensure the service is reachable: 'http://PublicIP:2724'

If a page displays with the _Skillable Integration Service_ on the page, the service is running. Scoring, LCAs, and ABA will now function correctly.

You may also Start, Stop, Restart, and check the Status of the service with SystemCtl.