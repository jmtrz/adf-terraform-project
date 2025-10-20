# Option 1: Using Azure CLI with inline properties JSON
az datafactory dataset create `
    --factory-name "df-personal-sandbox-39f61d4c" `
    --resource-group "rg-personal-sandbox-39f61d4c" `
    --name "blobDataset" `
    --properties "@blob-properties.json"
    # --properties '{
    #     "linkedServiceName": {
    #         "referenceName": "AzureStorageLinkedService",
    #         "type": "LinkedServiceReference"
    #     },
    #     "annotations": [],
    #     "type": "Binary",
    #     "typeProperties": {
    #         "location": {
    #             "type": "AzureBlobStorageLocation",
    #             "fileName": "emp.txt",
    #             "folderPath": "input",
    #             "container": "adftutorial"
    #         }
    #     }
    # }'

# Option 1B: Alternative using properties file
# az datafactory dataset create `
#     --factory-name "df-personal-sandbox-39f61d4c" `
#     --resource-group "rg-personal-sandbox-39f61d4c" `
#     --name "blobDataset" `
#     --properties "@blob-properties.json"

# Option 2: If you prefer Azure PowerShell, first install and import the module:
# Install-Module -Name Az.DataFactory -Force -AllowClobber
# Import-Module Az.DataFactory
# Connect-AzAccount
# Set-AzDataFactoryV2Dataset -DataFactoryName "df-personal-sandbox-39f61d4c" -ResourceGroupName "rg-personal-sandbox-39f61d4c" -Name "blobDataset" -DefinitionFile ".\blob.json"