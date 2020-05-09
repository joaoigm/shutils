export RESOURCEGROUP=resource-group-teste
export LOCATION=brazilsouth
export EXISTINGRESOURCEGROUP=$(az group list --query "[?contains(name, '$RESOURCEGROUP')].name" -o tsv)
if [ ! -z $EXISTINGRESOURCEGROUP ]
then
    echo "Resurce group já existe"
    exit 0
fi

az group create --name $RESOURCEGROUP --location $LOCATION