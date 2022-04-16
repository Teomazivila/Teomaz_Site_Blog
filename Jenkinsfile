node("CentOS8"){
    timeout(unit: 'SECONDS', time: 36005){
        stage("Directory"){
            echo "going to remove old containers and volumes"
//             sh 'cd /docker-compose/Teomaz_Site_Blog/ && docker-compose down --remove-orphans'
            sh 'sudo rm -rf /docker-compose && sudo mkdir  /docker-compose'
            sh 'docker rmi -f $(docker images -q) && docker volume rm $(docker volume ls -q)'
        }
        stage("Set_Permissios"){
            sh 'sudo chmod 0777 /docker-compose'
        }
        stage("Clone - Git"){
            sh 'cd /docker-compose && ls'
            sh 'cd /docker-compose/ &&  git clone https://github.com/Teomazivila/Teomaz_Site_Blog'
//             git branch: 'Dorckerize', credentialsId: 'd24f2487-0e5d-4f24-8b03-407b62048095', url: 'https://github.com/Teomazivila/Teomaz_Site_Blog'
            sh 'sudo ls /docker-compose/'
        }
        stage("Build"){
            echo "Starting  Build process to the target folder based on docker compose"
            sh 'cd /docker-compose/Teomaz_Site_Blog/ && git checkout Dorckerize'
            sh 'cd /docker-compose/Teomaz_Site_Blog/ && docker-compose build'
        }
        stage("Deploy"){
            echo "Starting  Deployemnt to the target folder based on docker compose"
            echo "This is might take a few minutes to complete the run"
            sh 'cd /docker-compose/Teomaz_Site_Blog/ && docker-compose up -d'
            sh 'sleep 10 && cd /docker-compose/Teomaz_Site_Blog/ && docker-compose ps -a'
        }
    }
}