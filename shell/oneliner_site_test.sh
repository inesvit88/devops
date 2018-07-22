#!/bin/bash

SITES=(https://bsro-fcac-qa.icrossing.com https://bsro-tp-qa.icrossing.com https://bsro-ht-qa.icrossing.com https://bsro-wwt-qa.icrossing.com bla_site ) && for site in ${SITES[@]}; do echo $site; time curl $site 2>/dev/null | grep "<title>" && echo -e " \e[30;48;5;84m CONNECTED \e[0m" || echo -e " \e[29;48;5;90mCONNECTION FAILED\e[0m"; done
