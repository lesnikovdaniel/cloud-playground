#!/bin/bash
terraform apply -auto-approve | grep '- compute_instance_nat-instance' 
