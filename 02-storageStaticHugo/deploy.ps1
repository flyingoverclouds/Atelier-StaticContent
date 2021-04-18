$saName="ncwebstorage"
$key=az storage account keys list -n ncwebstorage -o tsv --query "[? keyName=='key1'][].value"
$sas=az storage container generate-sas --account-name $saName --name="`$web" --expiry 2032-1-6 --permissions dlrw -o tsv
$webContainerUriSas="https://$saName.blob.core.windows.net/`$web?$sas"
azcopy copy .\site-statique-with-HUGO\public\* $webContainerUriSas --recursive --overwrite true