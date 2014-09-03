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
  echo "export ${var}=${!var_name}" >> ~/synced_folder/user-env.sh
done

echo "You can change these values anytime at: ~/synced_folder/user-env.sh"
