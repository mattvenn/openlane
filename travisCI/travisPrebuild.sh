# Copyright 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
TOOL=$1
REPO=$2
BRANCH=$3
export PDK_ROOT=$(pwd)/pdks
export RUN_ROOT=$(pwd)
echo $PDK_ROOT
echo $RUN_ROOT
git submodule update --init $RUN_ROOT/docker_build/docker/$TOOL/$REPO
cd $RUN_ROOT/docker_build/docker/$TOOL/$REPO
git checkout $BRANCH
git pull
cd $RUN_ROOT
sh $RUN_ROOT/docker_build/docker/$TOOL/prep.sh $RUN_ROOT
cd $RUN_ROOT/docker_build
make build-$TOOL
make export-$TOOL
echo "done pre-build"
cd $RUN_ROOT
exit 0