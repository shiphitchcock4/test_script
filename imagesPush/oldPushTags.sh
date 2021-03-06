#!/bin/bash -e

export VAN_CURR_JOB="push_image_tag2"
export VAN_PRE_JOB_VER="mytest_previous_state"
###### remove this export VAN_RES_VER="ship_ver"
export VAN_RES_DH="ship_dh"
export VAN_RES_REPO="scriptami_repo"
export RES_IMAGE_OUT="test_out_img"

# since resources here have dashes Shippable replaces them and UPPER cases them
###### remove this export VAN_RES_VER_UP=$(echo ${VAN_RES_VER//-/} | awk '{print toupper($0)}')

# get dockerhub EN string
export VAN_RES_DH_UP=$(echo $VAN_RES_DH | awk '{print toupper($0)}')
export VAN_RES_DH_INT_STR=$VAN_RES_DH_UP"_INTEGRATION"

# since resources here have dashes Shippable replaces them and UPPER cases them
export VAN_RES_REPO_UP=$(echo $VAN_RES_REPO | awk '{print toupper($0)}')
export VAN_RES_REPO_STATE=$(eval echo "$"$VAN_RES_REPO_UP"_STATE")

export RES_IMAGE_OUT_UP=$(echo $RES_IMAGE_OUT | awk '{print toupper($0)}')
export RES_IMAGE_OUT_VERSION=$(eval echo "$"$RES_IMAGE_OUT_UP"_VERSIONNUMBER")
echo RES_IMG_OUT_VERSION=$RES_IMAGE_OUT_VERSION
echo RES_IMG_OUT_UP=$RES_IMAGE_OUT_UP
echo "<<<<<<<<<<<<<<<<<<<<<<============== THIS IS ABOUT JOBS AND BUILDS ==============>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo RESO_ID_RUNSH_REPO=$RESOURCE_ID
echo MY_JOB_NAME=$JOB_NAME
echo MY_JOB_TYPE=$JOB_TYPE

echo "MY_BUILD_ID=$BUILD_ID"
echo "MY_BUILD_NUMBER=$BUILD_NUMBER"
echo "MY_BUILD_JOB_ID=$BUILD_JOB_ID"
echo "MY_BUILD_JOB_NUMBER=$BUILD_JOB_NUMBER"

echo MY_JOB_STATE=$JOB_STATE
echo MY_JOB_PREVIOUS_STATE=$JOB_PREVIOUS_STATE
echo MY_JOB_MESSAGE_PATH=$JOB_MESSAGE

export MY_JOBNAME_PREVIOUS_STATE=$(eval echo "$"$JOB_NAME"_PREVIOUS_STATE")
export MY_JOBNAME_STATE=$(eval echo "$"$JOB_NAME"_STATE")
export MY_JOBNAME_PATH=$(eval echo "$"$JOB_NAME"_PATH")
export MY_JOBNAME_MESSAGE=$(eval echo "$"$JOB_NAME"_MESSAGE")

echo $MY_JOBNAME_STATE
echo $MY_JOBNAME_PREVIOUS_STATE
echo $MY_JOBNAME_PATH
echo $MY_JOBNAME_MESSAGE

echo "<<<<<<<<<<<<<<<<<<<<<<============== THIS IS ALL ABOUT JOBS AND BUILDS ==============>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

echo "<<<<<<<<<<<<<<<<<<<<<<============== THIS IS ABOUT GITREPO ==============>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
set_context() {
 ###### remove this  export VAN_VERSION=$(eval echo "$"$VAN_RES_VER_UP"_VERSIONNAME")
  export VAN_VERSION=$(eval echo "$"$VAN_RES_REPO_UP"_VERSIONNUMBER")
  
  export MY_REPO_BRANCH=$(eval echo "$"$VAN_RES_REPO_UP"_BRANCH")
  export MY_REPO_COMMIT=$(eval echo "$"$VAN_RES_REPO_UP"_COMMIT")
  export MY_REPO_COMMIT_MESSAGE=$(eval echo "$"$VAN_RES_REPO_UP"_COMMIT_MESSAGE")
  export MY_REPO_COMMITTER=$(eval echo "$"$VAN_RES_REPO_UP"_COMMITTER")  
  #export MY_REPO_PULL_REQUEST=$(eval echo "$"$VAN_RES_REPO_UP"_PULL_REQUEST")
  #export MY_REPO_BASE_BRANCH=$(eval echo "$"$VAN_RES_REPO_UP"_BASE_BRANCH")
  #export MY_REPO_HEAD_BRANCH=$(eval echo "$"$VAN_RES_REPO_UP"_HEAD_BRANCH")

  export VAN_DH_USERNAME=$(eval echo "$"$VAN_RES_DH_INT_STR"_USERNAME")
  export VAN_DH_PASSWORD=$(eval echo "$"$VAN_RES_DH_INT_STR"_PASSWORD")
  export VAN_DH_EMAIL=$(eval echo "$"$VAN_RES_DH_INT_STR"_EMAIL")

 # echo "CURR_JOB=$CURR_JOB"
 # echo "RES_VER=$RES_VER"
 # echo "RES_DH=$RES_DH"
  echo "MY_RES_REPO=$VAN_RES_REPO"
 # echo "RES_VER_UP=$RES_VER_UP"
 # echo "RES_DH_UP=$RES_DH_UP"
 # echo "RES_DH_INT_STR=$RES_DH_INT_STR"
  echo "MY_RES_REPO_UP=$VAN_RES_REPO_UP"
  echo "MY_RES_REPO_STATE=$VAN_RES_REPO_STATE"

  echo "MY_REPO_RESO_VERSION=$VAN_VERSION"
  
  echo MY_BRANCH=$MY_REPO_BRANCH
  echo MY_COMMIT=$MY_REPO_COMMIT
  echo MY_COMMIT_MESSAGE=$MY_REPO_COMMIT_MESSAGE
  echo MY_RESO_COMMITER=$MY_REPO_COMMITTER
  #echo MY_RESO_PULL_REQUEST=$MY_REPO_PULL_REQUEST
  #echo MY_RESO_BASE_BRANCH=$MY_REPO_BASE_BRANCH
  #echo MY_RESO_HEAD_BRANCH=$MY_REPO_HEAD_BRANCH
  echo "<<<<<<<<<<<<<<<<<<<<<<============== THIS IS ALL ABOUT GITREPO ==============>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

  echo "<<<<<<<<<<<<<<<<<<<<<<============== THIS IS ABOUT INTEGRATION ==============>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

  echo "MY_DH_USERNAME=$VAN_DH_USERNAME"
  echo "MY_DH_PASSWORD_LENGTH=${#VAN_DH_PASSWORD}" #show only count
 # echo "MY_DH_EMAIL=$VAN_DH_EMAIL"
  echo "<<<<<<<<<<<<<<<<<<<<<<============== THIS IS ALL ABOUT INTEGRATION ==============>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

}
echo "<<<<<<<<<<<<<<<<<<<<<<========== PARAMS =============>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
export RES_PARAMS="test_params"
export RES_PARAMS_UP=$(echo $RES_PARAMS | awk '{print toupper($0)}')
export RES_PARAMS_STR=$RES_PARAMS_UP"_PARAMS"
export USER_PARAM=$(eval echo "$"$RES_PARAMS_STR"_TEST")
export SEC_PARAM=$(eval echo "$"$RES_PARAMS_STR"_DEV")

echo RES_PARAMS_STR=$RES_PARAMS_STR
echo USER_PARAM=$USER_PARAM
echo SEC_PARAM=$SEC_PARAM

echo "<<<<<<<<<<<<<<<<<<<<<<========== those are my env ===============>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<========= VERSIONS ===========>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo PACKER_VERSION=$(packer version)
echo TERRAFORM_VERSION=$(terraform version)
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<========= THATS ABOUT VERSIONS ===========>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

get_image_list() {
  pushd "$VAN_RES_REPO_STATE/imagesPush"
  export VAN_IMAGE_NAMES=$(cat imgs.txt)
  export VAN_IMAGE_NAMES_SPACED=$(eval echo $(tr '\n' ' ' < imgs.txt))
  popd

  echo "MY_IMAGE_NAMES=$VAN_IMAGE_NAMES"
  echo "MY_IMAGE_NAMES_SPACED=$VAN_IMAGE_NAMES_SPACED"

  # create a state file so that next job can pick it up
  echo "versionName=$VAN_REPO_RESO_VERSION" > /build/state/$VAN_CURR_JOB.env #adding version state
  echo "VAN_IMAGE_NAMES=$VAN_IMAGE_NAMES_SPACED" >> /build/state/$VAN_CURR_JOB.env
}

dockerhub_login() {
  echo "Logging in to Dockerhub"
  echo "----------------------------------------------"
  sudo docker login -u $VAN_DH_USERNAME -p $VAN_DH_PASSWORD -e $VAN_DH_EMAIL
}


create_out_state() {
  echo "Creating a state file for $RES_IMG_OUT_UP"
  echo "MY_REPO_RESO_VERSION=$VAN_VERSION"
  echo "MY_COMMIT=$MY_REPO_COMMIT"
  echo "MY_J_STATE=$JOB_STATE"
  #echo "MY_I_OUT=$RES_IMAGE_OUT"
  echo versionName=$VAN_VERSION > "$JOB_STATE/$RES_IMAGE_OUT.env"
  echo commitSHA=$MY_REPO_COMMIT >> "$JOB_STATE/$RES_IMAGE_OUT.env"
  
  echo "Creating a state file for $VAN_CURR_JOB"
  echo versionName=$VAN_VERSION > "$JOB_STATE/$VAN_CURR_JOB.env"
  #echo CURRENT=current_gitrepo_versionnumber > "$JOB_STATE/$VAN_CURR_JOB.env"
  cat "$JOB_STATE/$VAN_CURR_JOB.env"

  echo "Creating a previous state file for $VAN_PRE_JOB_VER"
 # echo versionName=$(VAN_VERSION) > "$JOB_PREVIOUS_STATE/$VAN_PRE_JOB_VER.env"
  #echo PREVIOUS=previous_gitrepo_versinnumber > "$JOB_PREVIOUS_STATE/$VAN_PRE_JOB_VER.env"
  #echo RC=qa > "$JOB_PREVIOUS_STATE/$VAN_PRE_JOB_VER.env"
  #echo ALPHA=engg > "$JOB_PREVIOUS_STATE/$VAN_PRE_JOB_VER.env"
  cat "$JOB_PREVIOUS_STATE/$VAN_CURR_JOB.env"
    
}

main() {
  set_context
  get_image_list
  dockerhub_login
  create_out_state  
}

main
