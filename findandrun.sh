#!/bin/bash
set -x
_PYTEST_HOME="./"
_py_main="tr_main.py"
_execv=$_py_main" -h"

echo "[.] looking for our py script to exec..."
_pymain_full_path=$(find $_PYTEST_HOME -type f -name "$_py_main")
echo "[.] fpath=$_pymain_full_path"
_strlen=$(echo "-"${#_py_main})
# cut last chars from the string
_pymain_dir=${_pymain_full_path::$_strlen}
echo "[.] PY_MAIN_HOME=$_pymain_dir"
cd $_pymain_dir

if hash python3 2>/dev/null; then
  python3 $_execv
else
  echo "[!] ERROR: No python3 found, check your path or install python3: sudo yum install python3"
  exit 1
fi
