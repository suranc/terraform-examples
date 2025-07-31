terraform {
  backend "http" {
    address = "https://app.harness.io/gateway/iacm/api/orgs/default/projects/Test_Bed/workspaces/test_migration_2/terraform-backend?accountIdentifier=TEyxLP87RquOEph_GrbYvQ"
    username = "harness"
    lock_address = "https://app.harness.io/gateway/iacm/api/orgs/default/projects/Test_Bed/workspaces/test_migration_2/terraform-backend/lock?accountIdentifier=TEyxLP87RquOEph_GrbYvQ"
    lock_method = "POST"
    unlock_address = "https://app.harness.io/gateway/iacm/api/orgs/default/projects/Test_Bed/workspaces/test_migration_2/terraform-backend/lock?accountIdentifier=TEyxLP87RquOEph_GrbYvQ"
    unlock_method = "DELETE"
    }
}
