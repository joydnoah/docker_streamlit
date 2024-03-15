import os
import streamlit as st
from dotenv import load_dotenv

load_dotenv()

title = os.environ.get('TITLE', None)

st.title(f'Testing title {title}')