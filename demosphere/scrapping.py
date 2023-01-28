# ---
# jupyter:
#   jupytext:
#     formats: ipynb,py:percent
#     text_representation:
#       extension: .py
#       format_name: percent
#       format_version: '1.3'
#       jupytext_version: 1.13.8
#   kernelspec:
#     display_name: Python 3 (ipykernel)
#     language: python
#     name: python3
# ---

# %%
import requests
from bs4 import BeautifulSoup

# %%
base = "https://paris.demosphere.net"

# %%
start = f"{base}/?selectStartTime=1672527601&showArchiveLinks=1"


# %%
def get_months(page):
    res = requests.get(page)
    html = BeautifulSoup(res.text)

    return [
        a.get('href')
        for a in html.find_all('a')
        if
            'selectStartTime' in str(a.get('href'))
            and 'endTime' in str(a.get('href'))
    ]


# %%
months = get_months(start)

len(months)


# %%
def get_rv_links(page):
    res = requests.get(page)
    html = BeautifulSoup(res.text)
    links = [ link.get('href') for link in html.find_all('a') if '/rv/' in str(link.get('href')) ]

    return links

links = get_rv_links(f'{base}{months[0]}')

len(links)


# %%
def get_rv_content(page):
    html = BeautifulSoup(requests.get(page).text)
    return html.find("div", {"id": "event"})

get_rv_content(f'{base}{links[0]}')

# %%
