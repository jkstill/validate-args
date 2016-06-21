#!/bin/bash

# similar to validate_args_proto.sh
# but uses the function from the functions file

FUNCTIONS_FILE=/home/jkstill/bin/functions.sh; export FUNCTIONS_FILE

. $FUNCTIONS_FILE

# -d database
# -u username
# -s schema
# -T stats type
# -t table_name
# -n owner

# valid combinations are
# -d and -u in all cases
# -s if -T is 'SCHEMA'
# -t and -n must both have a value or be blank

function usage {
printf "
-d database
-u username
-s schema
-T stats type
-t table_name
-n owner

"
}

while getopts d:u:s:T:t:n: arg
do
	case $arg in
		d) DATABASE=$OPTARG
			echo DATABASE: $DATABASE;;
		u) USERNAME=$OPTARG
			echo USERNAME: $USERNAME;;
		s) SCHEMA=$OPTARG
			echo SCHEMA: $SCHEMA;;
		T) TYPE=$OPTARG
			echo TYPE: $TYPE;;
		t) TABLE_NAME=$OPTARG;;
			#echo TABLE_NAME: $TABLE_NAME
		n) OWNER=$OPTARG
			echo OWNER: $OWNER;;
		*) echo "invalid argument specified"; usage;exit 1;
	esac

done

printf "
DATABASE: $DATABASE
OWNER:    $OWNER
SCHEMA:   $SCHEMA
TABLE :   $TABLE_NAME
TYPE:     $TYPE
USERNAME: $USERNAME

"

# valid combinations are
# -d and -u in all cases
# -s if -T is 'SCHEMA'
# -t and -n must both have a value or be blank

# concat all args together
ALLARGS=":$USERNAME:$DATABASE:$OWNER:$TABLE_NAME:$SCHEMA:$TYPE:"
# upper case arges
ALLARGS=$(echo $ALLARGS | tr "[a-z]" "[A-Z]")
echo ALLARGS: $ALLARGS

# this is the regex used 
export ALNUM1="[[:alnum:]]+"
export ALNUM3="[[:alnum:]]{3,}"
export USER_RE=$ALNUM3
export DATABASE_RE=$ALNUM3
export OWNER_RE='[[:alnum:]_$]{3,}'
export TABLE_RE='[[:alnum:]_#$]+'
export SCHEMA_RE='[[:alnum:]_$]+'

# 1: non-schema args - from stats table
# 2: non-schema args - from dictionary
# 3: schema args - from stats table
# 4: schema args - from dictionary

#   :   user        :  db           :  owner        :  table     : schema        : type

# bash
VALID_ARGS=(":$USER_RE:$DATABASE_RE:$OWNER_RE:$TABLE_RE::(DICTIONARY_STATS|SYSTEM_STATS|FIXED_OBJECTS_STATS):" \
	":$USER_RE:$DATABASE_RE::::(DICTIONARY_STATS|SYSTEM_STATS|FIXED_OBJECTS_STATS):" \
	":$USER_RE:$DATABASE_RE:$OWNER_RE:$TABLE_RE:$SCHEMA_RE:(SCHEMA):" \
	":$USER_RE:$DATABASE_RE:::$SCHEMA_RE:SCHEMA:")

i=0
while (( i < ${#VALID_ARGS[*]} ))
do
	echo "VA1 $i: ${VALID_ARGS[$i]}"
	(( i = i + 1 ))
done


printf "VALID_ARGS1: ${VALID_ARGS[*]}\n"
printf "ALLARGS: $ALLARGS\n"

# VALID_ARGS must NOT be quoted or it will appear as a single arg in the function
validate_args $ALLARGS ${VALID_ARGS[*]}
ARG_RESULTS=$?

echo ARG RESULTS: $ARG_RESULTS

if [ "$ARG_RESULTS" == '0' ]; then
	echo OK
else
	echo not OK
fi


