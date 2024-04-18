param(
    [string]$storageAccountName,
    [string]$containersToCreate,
    [string]$resourceGroupName
)

Connect-AzAccount -Identity
$containers = $containersToCreate | ConvertFrom-Json -AsHashtable
$stg = Get-AzStorageAccount -Name $storageAccountName -ResourceGroupName $resourceGroupName
$context = $stg.Context

invoke-WebRequest -Uri "https://raw.githubusercontent.com/mullertron/sql-training/main/lab04/DSC/configureDomain.ps1.zip" -OutFile "configureDomain.ps1.zip"
invoke-WebRequest -Uri "https://raw.githubusercontent.com/mullertron/sql-training/main/lab04/DSC/addMachineToDomain.ps1.zip" -OutFile "addMachineToDomain.ps1.zip"
invoke-WebRequest -Uri "https://raw.githubusercontent.com/mullertron/sql-training/main/lab04/DSC/CreateADPDC.ps1.zip" -OutFile "CreateADPDC.ps1.zip"

foreach ($container in $containers.keys) {
    Write-Host "`n Creating container $container"
    New-AzStorageContainer -Name $container -Context $context -Permission Off
    Write-Host "`n Creating blobs in $container container"
    foreach ($blob in $containers[$container]) {
        Write-Host "`n Creating blob $blob"
        $Blob1HT = @{
            File             = "./$blob"
            Container        = $container
            Blob             = $blob
            Context          = $context
            StandardBlobTier = 'Hot'
        }
        Set-AzStorageBlobContent @Blob1HT
    }
}