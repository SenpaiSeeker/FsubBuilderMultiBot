import nsdev

from config import BOT_TOKEN, DB_KEY, DB_NAME, OWNER_ID

db = nsdev.DataBase(
    storage_type="local",
    file_name=DB_NAME,
    keys_encrypt=DB_KEY,
    method_encrypt="bytes",
    auto_backup=True,
    backup_bot_token=BOT_TOKEN,
    backup_chat_id=OWNER_ID,
    backup_interval_hours=3,
)
