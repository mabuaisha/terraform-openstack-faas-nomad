# This declares a job named "docs". There can be exactly one
# job declaration per job file.
job "faas-idler" {
  datacenters = ["dc1"]

  type = "service"


  # A group defines a series of tasks that should be co-located
  # on the same client (host). All tasks within a group will be
  # placed on the same host.
  group "faas-idler" {
    # Specify the number of these tasks we want.
    count = 1

    # Create an individual task (unit of work). This particular
    # task utilizes a Docker container to front a web application.
    task "faas-idler-service" {
      # Specify the driver to be "docker". Nomad supports
      # multiple drivers.
      driver = "docker"

      # Configuration is specific to each driver.
      config {
        image = "openfaas/faas-idler:0.3.0"
         args = [
          "/home/app/faas-idler",
          "-dry-run=true",
        ]
      }

      # The service block tells Nomad how to register this service
      # with Consul for service discovery and monitoring.
      service {
        # This tells Consul to monitor the service on the port
        # labelled "http". Since Nomad allocates high dynamic port
        # numbers, we use labels to refer to them.
        port = "http"
        name = "faas-idler"
        tags = ["faas"]
      }

      # It is possible to set environment variables which will be
      # available to the task when it runs.
      env {
        gateway_url = "http://192.168.0.26:8080/"
        prometheus_host = "192.168.0.26"
        # This port should be opened before running this job
        prometheus_port = "9090"
        inactivity_duration = "30m"
        reconcile_interval = "2m"
      }

      # Specify the maximum resources required to run the task,
      # include CPU, memory, and bandwidth.
      resources {
        cpu    = 500 # MHz
        memory = 128 # MB

        network {
          mbits = 100
          port "http" {}
        }
      }
    }
  }
}