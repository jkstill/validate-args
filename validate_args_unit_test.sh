#!/bin/bash


echo =========================================================
echo
echo delete dictionary stats from table - should succeed
echo ./validate_args.sh -u system -d orcl -n system -T DICTIONARY_STATS -t mytable
./validate_args.sh -u system -d orcl -n system -T DICTIONARY_STATS -t mytable
echo 
echo =========================================================
echo
echo delete dictionary stats from table - should succeed
echo ./validate_args.sh -u system -d orcl -n system -T DICTIONARY_STATS -t my_table
./validate_args.sh -u system -d orcl -n system -T DICTIONARY_STATS -t my_table
echo 
echo =========================================================
echo
echo delete dictionary stats from dictionary - should succeed
echo ./validate_args.sh -u system -d orcl  -T DICTIONARY_STATS 
./validate_args.sh -u system -d orcl  -T DICTIONARY_STATS 
echo
echo =========================================================
echo
echo delete SYSTEM stats from table - should succeed
echo ./validate_args.sh -u system -d orcl -n system -T SYSTEM_STATS -t mytable
./validate_args.sh -u system -d orcl -n system -T SYSTEM_STATS -t mytable
echo 
echo =========================================================
echo
echo delete SYSTEM stats from dictionary - should succeed
echo ./validate_args.sh -u system -d orcl  -T SYSTEM_STATS 
./validate_args.sh -u system -d orcl  -T SYSTEM_STATS 
echo
echo =========================================================
echo
echo delete FIXED stats from table - should succeed
echo ./validate_args.sh -u system -d orcl -n system -T FIXED_OBJECTS_STATS -t mytable
./validate_args.sh -u system -d orcl -n system -T FIXED_OBJECTS_STATS -t mytable
echo 
echo =========================================================
echo
echo delete FIXED stats from dictionary - should succeed
echo ./validate_args.sh -u system -d orcl  -T FIXED_OBJECTS_STATS 
./validate_args.sh -u system -d orcl  -T FIXED_OBJECTS_STATS 
echo
echo =========================================================
echo
echo delete SCHEMA stats from table - should succeed
echo ./validate_args.sh -u system -d orcl -n system -T SCHEMA -t mytable -s scott
./validate_args.sh -u system -d orcl -n system -T SCHEMA -t mytable -s scott
echo 
echo =========================================================
echo
echo delete SCHEMA stats from dictionary - should succeed
echo ./validate_args.sh -u system -d orcl  -T SCHEMA -s scott
./validate_args.sh -u system -d orcl  -T SCHEMA -s scott
echo


# the following should all fail

echo =========================================================
echo
echo delete dictionary stats from table - should fail
echo ./validate_args.sh -u system -d orcl -n system -T dictionary -t mytable 
./validate_args.sh -u system -d orcl -n system -T dictionary -t mytable
echo 
echo =========================================================
echo
echo delete dictionary stats from dictionary - should fail
echo ./validate_args.sh -u system -d orcl  -T DICT_T
./validate_args.sh -u system -d orcl  -T DICT_T
echo
echo =========================================================
echo
echo delete SYSTEM stats from table - should fail
echo ./validate_args.sh -u system -d orcl -n system -T SYSTEM_STATS -t mytable -s scott
./validate_args.sh -u system -d orcl -n system -T SYSTEM_STATS -t mytable -s scott
echo 
echo =========================================================
echo
echo delete SYSTEM stats from dictionary - should fail
echo ./validate_args.sh -u system -d orcl  -T SYSTEM_STATS -t mytable
./validate_args.sh -u system -d orcl  -T SYSTEM_STATS -t mytable
echo
echo =========================================================
echo
echo delete FIXED stats from table - should fail
echo ./validate_args.sh -u system -d orcl -n system -T FIXED_OBJECTS_STATS -t mytable -s scott
./validate_args.sh -u system -d orcl -n system -T FIXED_OBJECTS_STATS -t mytable -s scott
echo 
echo =========================================================
echo
echo delete FIXED stats from dictionary - should fail
echo ./validate_args.sh -u system -d orcl  -T FIXUP
./validate_args.sh -u system -d orcl  -T FIXUP
echo
echo =========================================================
echo
echo delete SCHEMA stats from table - should fail
echo ./validate_args.sh -u system -d orcl -n system -T SCHEMAS -t mytable -s scott
./validate_args.sh -u system -d orcl -n system -T SCHEMAS -t mytable -s scott
echo 
echo =========================================================
echo
echo delete SCHEMA stats from dictionary - should fail
echo ./validate_args.sh -u system -d orcl  -T SCHEMA -s scott -n system
./validate_args.sh -u system -d orcl  -T SCHEMA -s scott -n system
echo
echo =========================================================
echo
echo delete SCHEMA stats from dictionary - should fail - owner too short
echo ./validate_args.sh -u system -d orcl -n sy -T SCHEMA -t mytable -s scott
./validate_args.sh -u system -d orcl -n sy -T SCHEMA -t mytable -s scott
echo
echo =========================================================
echo

#-----------------------

