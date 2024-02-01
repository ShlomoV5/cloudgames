
def checkoutBranch (repo, branch) {
    c_Id = 'XXXXXXXXXXXXXX'
    println "Checking out ${branch} from ${repo} directory"
    git branch: branch, credentialsId: c_Id, poll: false, url: repo
    
}

return this;
