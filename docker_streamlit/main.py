import os
import streamlit as st

title = os.environ.get('TITLE', None)

st.title(f'Testing title {title}')