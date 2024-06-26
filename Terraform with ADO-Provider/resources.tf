resource "azuredevops_project" "test_project" {
  name        = "test_project"   
  description        = "An example project created with Terraform"
  visibility         = "private"
  version_control    = "Git"
}

#Agent pools in Azure DevOps are scoped at the organization level
resource "azuredevops_agent_pool" "test_pool" {
  name = "test_pool"
}

#Manages an agent queue within Azure DevOps. In the UI, this is equivalent to ( adding an Organization defined pool to a project)
resource "azuredevops_agent_queue" "test_agent_queue" {
  project_id    = azuredevops_project.test_project.id
  agent_pool_id = azuredevops_agent_pool.test_pool.id
}

#he created queue is not authorized for use by all pipelines in the project. However, 
#the azuredevops_resource_authorization resource can be used to grant authorization.

resource "azuredevops_resource_authorization" "bool-auth" {
  project_id  = azuredevops_project.test_project.id
  resource_id = azuredevops_agent_queue.test_agent_queue.id
  type        = "queue"
  authorized  = true
}