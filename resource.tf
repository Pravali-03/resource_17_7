resource "azurerm_resource_group" "storeterra" {
    name     = "churiRG17_7"
    location = "East US"
}
 
resource "azurerm_storage_account" "saterra" {
    name                     = "terrastorage1ppchuri"
    resource_group_name      = azurerm_resource_group.storeterra.name
    location                 = azurerm_resource_group.storeterra.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
}
 
resource "azurerm_storage_container" "sacontainer" {
    name                  = "terra-container"
    storage_account_name  = azurerm_storage_account.saterra.name
    container_access_type = "private"
}


resource "azurerm_storage_container" "container" {
  name                  = "churiblobcontainer"
  storage_account_name  = azurerm_storage_account.saterra.name
  container_access_type = "private"
}