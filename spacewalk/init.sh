#!/bin/bash
/init_database.sh
spacewalk-setup --external-postgresql --answer-file=/answer.txt --clear-db --skip-services-restart --non-interactive
