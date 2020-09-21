function log(){
  kubectl logs -f $(kubectl get pod $PODNAME)
}

function status(){
  # curl ${URL}/actuator/health
}


function secrets(){
  SECRETKEY=$1
  SECRETVALUE=$2
  SECRETPATH=/secrets/app
  # vault put -field $SECRETKEY $SECRETPATH $SECRETVALUE
}

function run(){
  #docker-compose up
  #mvn start
}

function test(){
  TESTPYRAMIDE=$1
  if [ $TESTPYRAMIDE == "unit" ];then
    #npm test
    #go test
    #mvn test
  elif [ $TESTPYRAMIDE == "integration" ];then
    # docker-compose start
  elif [ $TESTPYRAMIDE == "e2e" ];then
    # docker-compose start
  fi
}

function deploy(){
  STAGE=$1
  if [ $STAGE == "test" ];then
    # helm upgrade --install -f values.yaml -f values_test.yaml --set customvaluefromenv=$CUSTOMVALUE
    # terraform apply
  elif [ $STAGE == "staging" ];then
    # helm upgrade --install -f values.yaml -f values_staging.yaml --set customvaluefromenv=$CUSTOMVALUE
    # terraform apply
  elif [ $STAGE == "production" ];then
    # helm upgrade --install -f values.yaml -f values_production.yaml --set customvaluefromenv=$CUSTOMVALUE
    # terraform apply
  fi
  
  # helm upgrade --install -f values.yaml -f values_$STAGE.yaml --set customvaluefromenv=$CUSTOMVALUE
  # terraform apply
}

if [ $# -gt 0 ]; then
    export ACTION=$1
    shift
    export PARAMETERS=$@
    if [ $ACTION == "deploy" ];then
      deploy $PARAMETERS
    elif [ $ACTION == "test" ];then
      test $PARAMETERS
    elif [ $ACTION == "run" ];then
      run $PARAMETERS
    elif [ $ACTION == "status" ];then
      status $PARAMETERS
    elif [ $ACTION == "log" ];then
      log $PARAMETERS
    elif [ $ACTION == "secrets" ];then
      secrets $PARAMETERS
    fi
else
    echo "Your command line contains no arguments."
    echo "execute it like this ./go.sh <ACTION> <OPTIONS>"
    echo "ACTIONS - deploy, test, run, status, log"
fi
