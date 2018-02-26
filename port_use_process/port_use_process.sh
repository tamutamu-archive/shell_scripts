#!/bin/bash

. ../common/common.sh
. ./usage.sh


set -euo pipefail

ss -natp | column -t

