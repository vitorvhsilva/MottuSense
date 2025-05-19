RESOURCE_GROUP="rg-dotNet"
LOCATION="eastus2"
VM_NAME="vm-dotNet"
SIZE="Standard_D2s_v3"
ADMIN_USERNAME="vitorvhsilva"
ADMIN_PASSWORD="Fiap2TDSPY@2025"
DISK_SKU="StandardSSD_LRS"
IMAGE="Canonical:ubuntu-24_04-lts:server:latest"

az group create --name $RESOURCE_GROUP --location $LOCATION

az vm create \
  --resource-group $RESOURCE_GROUP \
  --name $VM_NAME \
  --image $IMAGE \
  --size $SIZE \
  --authentication-type password \
  --admin-username $ADMIN_USERNAME \
  --admin-password $ADMIN_PASSWORD \
  --storage-sku $DISK_SKU \
  --public-ip-sku Basic


