pipeline {
   agent {
       docker{
           image 'ralphh1/pywd'
       }
   }

   stages {
      stage('Build') {
         steps {
            echo 'Compilando/baixando dependências do projeto'
            sh 'pip install -r requirements.txt'
         }
      }
      stage('Teste-SIT'){
          steps {
              echo 'Executando testes de regressão SIT'
              sh 'robot -d ./logs testes/'
              robot 'log'
          }
      }
      stage('Teste-DEV'){
          steps{
             echo 'Executando testes de regressão DEV'
       }
    }
 }   
}