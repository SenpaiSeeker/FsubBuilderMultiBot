while true; do
    read -p $'\033[38;2;255;255;0mMasukkan nama file konfigurasi (harus diakhiri dengan .env) contoh robot.env: \033[0m' config_file
    if [[ "$config_file" =~ \.env$ ]]; then
        break
    else
        echo -e "\033[38;2;255;0;0mNama file harus diakhiri dengan .env! Coba lagi.\033[0m"
    fi
done

declare -a env_variables=("API_ID" "API_HASH" "BOT_TOKEN" "DB_KEY" "DB_NAME" "OWNER_ID")

export TZ="Asia/Jakarta"
formatted_date=$(LC_TIME=id_ID.UTF-8 date +"%A, %d %B %Y %H:%M:%S")

> "$config_file"
echo "# Configuration File - Dibuat pada $formatted_date" >> "$config_file"
echo "" >> "$config_file"

function get_input() {
    local var_name="$1"
    local value=""
    while true; do
        read -p $'\033[1;38;5;46mMasukkan config untuk '"$var_name"$': \033[0m' value
        if [[ -z "$value" ]]; then
            echo -e "\033[38;2;255;0;0mInput tidak boleh kosong! Coba lagi.\033[0m" >&2
        else
            break
        fi
    done
    echo "$value"
}

declare -A config_values
for var in "${env_variables[@]}"; do
    config_values["$var"]="$(get_input "$var")"
done

echo -e "\033[38;2;0;191;255mKonfigurasi yang telah dimasukkan:\033[0m"
for var in "${!config_values[@]}"; do
    echo -e "\033[38;2;173;216;230m$var\033[0m=\033[38;2;144;238;144m${config_values[$var]}\033[0m"
done

read -p $'\033[38;2;255;255;0mApakah Anda yakin ingin menyimpan konfigurasi? (y/n): \033[0m' confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
    for var in "${!config_values[@]}"; do
        echo "$var=${config_values[$var]}" >> "$config_file"
    done
    echo -e "\033[38;2;0;255;0mFile config berhasil disimpan di $config_file\033[0m"
else
    echo -e "\033[38;2;255;0;0mPenyimpanan dibatalkan.\033[0m"
fi
