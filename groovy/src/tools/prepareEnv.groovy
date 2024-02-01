import groovy.json.JsonSlurper

class prepareEnv implements Serializable {


@NonCPS
def getdata(jdata){

    return new JsonSlurper().parseText(jdata)
}

            

@NonCPS
    def prepareEnv (jdata, printer) {
       
        def return_value = [ 'PR_BRANCH'  : "",
                             'PR_NUMBER'  : "", 
                             'PR_REPONAME': "",
                             'PR_REPOURL' : "", 
                             'PR_USER'    : ""
                            ]
        def list_head = this.getdata(jdata)
        def item = this.getdata(list_head[0])
        def branch_name = "Unknown"
        def pr_data
        def user_data
        def user_name 
        def is_merged = false
        
        try {
            if (item.keySet().any {k -> k == 'action' }) {
                pr_data = item['pull_request']
                if (pr_data) {
                    return_value['PR_BRANCH']    = pr_data['head']['ref']
                    return_value['PR_NUMBER']    = item['number']
                    return_value['PR_REPONAME']  = item['repository']['full_name']
                    return_value['PR_REPOURL']   = item['repository']['ssh_url']
                    return_value['PR_USER']      = pr_data['user']['login']
                
                } else  {
                    printer.println "there is no PR info returning empty data structure"
                }
            } else {
                printer.println "there is no action to process return empty data"
            }
        } catch (e) {
            printer.println "Problem with payload parsing " + e.toString()
        }
        return return_value
    }
}

