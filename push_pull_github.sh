#!/bin/bash

# Navigate to the local repository directory
cd D:\Tosca_Projects\Tosca_Devops
dir
git status
git branch
git checkout master

# Pull changes from the remote repository


# Add changes to the staging area
git add .

# Commit changes with a descriptive message
git commit -m "Tosca Changes are Commited"
git pull origin

# Push changes to the remote repository
git push origin master
