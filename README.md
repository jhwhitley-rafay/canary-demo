# Rafay GitOps Canary Deployments
In this demo, we will illustrate how to use Rafay GitOps pipelines to enable zero downtime canary deployments by using an Ingress Controller to direct client traffic.

<br>

## Build Demo Application
The demo application contains two simple webserver applications, one serving _"coffee"_, the other _"tea"_, and is based on the [nginxinc/ingress-demo](https://hub.docker.com/r/nginxinc/ingress-demo) container image. To build the application container images, follow the steps listed below:

1. Clone the repo.
   
   ```bash
   [user@host] git clone https://github.com/matt-rafay/canary-demo.git
   ```

2. Navigate to the `build` directory and run the `build.sh` shell script.
   
   ```bash
   [user@host] cd canary-demo/build
   [user@host] ./build.sh
   
     Usage: build.sh [required] [optional]
     
       Required:
         --registry                  example:  registry.example.com
       
       Optional:
         --push                      push image to repository
         --repo-prefix               example:  demo-app (e.g. demo-app-coffee and demo-app-tea)
   ```
   
   Provide the registry name using the `--registry` flag.
   
   Optionally provide a repo prefix name by using the `--repo-prefix` flag (if no prefix name is specified, the default container image names are `demo-app-coffee` and `demo-app-tea`).
   
   Use the `--push` flag to have the script automatically push the container images to your registry.
   
   ```bash
   [user@host] ./build.sh --registry registry.example.com --repo-prefix canary --push
   ```
