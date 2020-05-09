export RESOURCEGROUP=resource-group-teste
export STORAGEACCOUNT=storagestates
export SKU=Standard_LRS

# Get resource group Location to place Storage account in the same Location
export LOCATION=$(az group show --name $RESOURCEGROUP --query location -o tsv)
export STORAGE_EXIST=$(az storage account list --query "[?contains(name '$STORAGEACCOUNT')].name" -o tsv)
if [ ! -z $STORAGE_EXIST ]
then
    echo 'Storage Account já existe'
    exit 0
fi
az storage account create --resource-group $RESOURCEGROUP --name $STORAGEACCOUNT --sku $SKU --location $LOCATION
