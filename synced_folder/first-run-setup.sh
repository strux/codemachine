target_file=~/synced_folder/local_config/.user-env.sh

# Make it green
tput setaf 2
echo
echo "It looks like this is your first time using codemachine"
echo "Let's collect some info to help set up your env."
echo

user_vars=$(egrep -ro 'CM[_A-Z]+' ~/synced_folder | cut -d : -f 2 | sort | uniq)

for var in $user_vars
do
  echo "Enter the value for ${var} and press [Enter]"
  var_name="${var}_VAL"
  read $var_name
  echo "export ${var}=${!var_name}" >> ${target_file}
done
[ -n ${target_file} ] && ln -s ${target_file} ~/$(basename $target_file)

echo "You can change these values anytime in: ~/.user-env.sh"
# Reset colors
tput sgr 0
