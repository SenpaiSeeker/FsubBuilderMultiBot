import os
import sys

import dotenv

dotenv.load_dotenv(sys.argv[1] if len(sys.argv) > 1 else ".env")


API_ID = int(os.getenv("API_ID"))
API_HASH = os.getenv("API_HASH")
BOT_TOKEN = os.getenv("BOT_TOKEN")
OWNER_ID = int(os.getenv("OWNER_ID"))
DB_NAME = os.getenv("DB_NAME")
DB_KEY = os.getenv("DB_KEY")
FILE_KEY = os.getenv("FILE_KEY")
