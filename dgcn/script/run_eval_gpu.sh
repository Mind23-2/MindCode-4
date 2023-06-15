#!/bin/bash
# Copyright 2021 Huawei Technologies Co., Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ============================================================================

if [[ $# != 2 ]]; then
    echo "Usage: bash ./scripts/run_eval_gpu.sh [CHECKPOINT] [DATASET_NAME]"
exit 1
fi

CHECKPOINT=$1
echo $CHECKPOINT

DATASET_NAME=$2
echo $DATASET_NAME

if [ ! -d "eval" ]; then
        mkdir eval
fi
cp ../*.py ./eval
cp -r ../src ./eval
cp -r ../data ./eval
cd ./eval || exit
nohup python -u eval.py --device_target=GPU --checkpoint=$CHECKPOINT --dataset=$DATASET_NAME > eval_gpu.log 2>&1 &