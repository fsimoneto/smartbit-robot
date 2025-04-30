import os
from dotenv import load_dotenv

load_dotenv()

BASE_URL = os.getenv('BASE_URL')
BROWSER = os.getenv('BROWSER')
HEADLESS = os.getenv('HEADLESS', 'False').strip().lower() in ('true', '1', 'yes')
