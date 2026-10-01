Microsoft Fabric Capacity Creation Process
1. Exemption
  •	Check whether an exemption is required.
  •	If exemption is not necessary, proceed to the next step.
  •	If an existing exemption/reservation is being used, verify whether it is still active/valid or expired.
  •	If it has expired, create a new one only after getting confirmation on:
    o	The new reservation requirements.
    o	The Fabric deployment requirements.

2. Reservation
  •	The subscription owner needs to complete/approve the reservation.
  •	Current status: Not completed / pending.
  •	This is a mid-process activity and needs to be followed up with the subscription owner.

3. Resource Group
  •	Check whether an appropriate existing resource group is available.
  •	If an existing resource group can be used:
    o	Use the existing resource group.
    o	Confirm with Derek before proceeding.
  •	If a new resource group is required:
    o	Create the resource group.
    o	Apply the required tags.

4. Entra ID Group
•	Create or identify the appropriate Microsoft Entra ID group for managing the Fabric Capacity.
•	Add the required members to the group.
•	Assign the appropriate Contributor role/permissions to the group, based on the organization's access requirements.
•	Verify that the required users are members of the group before deployment.

5. Fabric Capacity Deployment
•	Once the prerequisite steps are confirmed:
  o	Verify the subscription.
  o	Verify the reservation status.
  o	Verify the resource group and required tags.
  o	Verify the Entra ID group and permissions.
•	Proceed with the Microsoft Fabric Capacity deployment.
•	After deployment, validate that the capacity is created successfully and that the required users/groups have the expected access.
