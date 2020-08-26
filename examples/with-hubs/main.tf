module "simple" {
    source = "../../"

    name = "Hub-test-brubank"
    location = "eastus"
    resource_group_name = "Brubank-POC"
    sku = "Standard"
    capacity = 1

    hubs = [
        {
            name = "input"
            partitions = 1
            message_retention = 1
            consumers = [
                "app1",
                "app2"
            ]
            keys = [
                {
                    name = "app1"
                    listen = true
                    send = false
                },
                {
                    name = "app2"
                    listen = true
                    send = true
                }
            ]
        }
    ]
}
