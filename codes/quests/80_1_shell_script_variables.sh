V_VAR1="$1"
V_VAR2="$2"

touch "$V_VAR1"
echo "$V_VAR2" >> "$V_VAR1"

echo "$V_VAR1 is created successfully"