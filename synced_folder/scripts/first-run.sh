target_file=~/synced_folder/local_config/user-env.sh

function cleanup {
  # Reset colors
  tput sgr 0
  exit $?
}
trap cleanup SIGINT

# Make text green to grab attention
tput setaf 2
echo
echo "It looks like this is your first time using codemachine"
echo "Let's collect some info to help set up your env."
echo

user_vars=$(find ~/synced_folder/ -maxdepth 2 -type f -exec grep -o 'CM_[_A-Z]\+' {} + | cut -d : -f 2 | sort | uniq)
for var in $user_vars
do
  human=$(echo ${var} | sed 's/\(CM\)\?_/ /g')
  echo "Enter the value for ${human} and press [Enter]"
  var_name="${var}_VAL"
  read $var_name
  echo "export ${var}=${!var_name}" >> ${target_file}
done
echo "You can change these values anytime in: ~/synced_folder/local_config/user-env.sh"
echo "Make sure to source .bash_profile afterwards."

cleanup
