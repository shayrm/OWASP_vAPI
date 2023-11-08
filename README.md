# vAPI [![Tweet](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?text=Check%20out%20vAPI%20on%20Github!&url=https://github.com/roottusk/vapi&via=vk_tushar&hashtags=apisecurity,apitop10,owasp)

[![Docker](https://img.shields.io/badge/docker-support-%2300D1D1)](https://docs.docker.com/compose/) 
[![kubernetes](https://img.shields.io/badge/kubernetes-support-%2300D1D1)](https://eksctl.io/getting-started/) 
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blueviolet.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Version](https://img.shields.io/badge/version-v1.1-blue)](https://github.com/roottusk/vapi) 
[![PHP](https://img.shields.io/badge/php-7.3^-yellow)](https://github.com/roottusk/vapi)

<p align="center">
<img src="vapi_logo.png" >
</p>

vAPI is Vulnerable Adversely Programmed Interface which is Self-Hostable API that mimics OWASP API Top 10 scenarios in the means of Exercises. 

This environment was build to create a PoC for API most common vulnerabilities. 
At first, instead of vAPI, I thought of taking a "real life" case. 
I use Shodan to search for open systems (found quite a lot of mongo Ex opened servers)

But I decided to “go the extra mile” and produce a consolidated solution that will combine futures demos.
 

Solution description:

1) I used vAPI project to be able to demo all OWASP API top 10 including BOLA 
(more info could be found [here](https://www.traceable.ai/blog-post/a-deep-dive-on-the-most-critical-api-vulnerability-bola-broken-object-level-authorization))

2) The original vAPI project was made on docker-compose and I managed to convert it to K8s and installed on AWS EKS. 
Many adjustments were needed to make it fit to EKS.
For that I use the `kompose` and `eksctl` tools. 

3) Enable VPC mirroring to be able to capture the API request. It allow me to create pcap (capture) files and record the attacks simulation.

4) The setup is available and I includes API calls and the postman requests.


# Requirements

* PHP
* MySQL
* PostMan
* MITM Proxy

# Installation (EKS)
Create a new cluster on EKS or skip this part and use existing one

```bash
./create_k8s_cluster_on_eks.sh
```

Get into the deployment directory and apply the deployment
(better to create a namespace before apply)

```bash
kubectl apply -f ./kube_deploy/
```

# Installation (Docker)

```bash
docker-compose up -d
```

# Installation (Manual)

## Copying the Code

```bash
cd <your-hosting-directory>
```

```bash
git clone https://github.com/roottusk/vapi.git
```

## Setting up the Database

Import `vapi.sql` into MySQL Database

Configure the DB Credentials in the `vapi/.env`


## Starting MySQL service

Run following command (Linux)

```bash
service mysqld start
```

## Starting Laravel Server

Go to `vapi` directory and Run 

```bash
php artisan serve
```

## Setting Up Postman

- Import `vAPI.postman_collection.json` in Postman
- Import `vAPI_ENV.postman_environment.json` in Postman

OR

Use Public Workspace 

https://www.postman.com/roottusk/workspace/vapi/

# Usage

Browse `http://localhost/vapi/` for Documentation

After Sending requests, refer to the Postman Tests or Environment for Generated Tokens

# Deployment

[Helm](https://helm.sh/) can be used to deploy to a Kubernetes namespace. The chart is in the `vapi-chart` folder. The chart requires one secret named `vapi` with the following values:

```
DB_PASSWORD: <database password to use>
DB_USERNAME: <database username to use>
```

Sample Helm Install Command: `helm upgrade --install vapi ./vapi-chart --values=./vapi-chart/values.yaml`

*** Important *** 

The MYSQL_ROOT_PASSWORD on line 232 in the `values.yaml` must match that on line 184 in order to work. 

# Presented At
[OWASP 20th Anniversary](https://owasp20thanniversaryevent20.sched.com/event/ll1k)

[Blackhat Europe 2021 Arsenal](https://www.youtube.com/watch?v=7_Q5Rlm7Too)

[HITB Cyberweek 2021, Abu Dhabi, UAE](https://cyberweek.ae/2021/hitb-armory/)

[@Hack, Riyadh, KSA](https://athack.com/speakers?keys=Tushar)



# Mentions and References
[1] https://apisecurity.io/issue-132-experian-api-leak-breaches-digitalocean-geico-burp-plugins-vapi-lab/

[2] https://dsopas.github.io/MindAPI/references/

[3] https://dzone.com/articles/api-security-weekly-issue-132

[4] https://owasp.org/www-project-vulnerable-web-applications-directory/

[5] https://github.com/arainho/awesome-api-security

[6] https://portswigger.net/daily-swig/introducing-vapi-an-open-source-lab-environment-to-learn-about-api-security

[7] https://apisecurity.io/issue-169-insecure-api-wordpress-plugin-tesla-3rd-party-vulnerability-introducing-vapi/

# Walkthroughs/Writeups/Videos

[1] https://cyc0rpion.medium.com/exploiting-owasp-top-10-api-vulnerabilities-fb9d4b1dd471 (vAPI 1.0 Writeup)

[2] https://www.youtube.com/watch?v=0F5opL_c5-4&list=PLT1Gj1RmR7vqHK60qS5bpNUeivz4yhmbS (Turkish Language) (vAPI 1.1 Walkthrough)

[3] https://medium.com/@jyotiagarwal3190/roottusk-vapi-writeup-341ec99879c (vAPI 1.1 Writeup)


