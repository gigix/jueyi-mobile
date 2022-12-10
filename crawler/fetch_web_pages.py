import os
import requests
from bs4 import BeautifulSoup
from opencc import OpenCC

def fetch_page(index):
    url='https://www.eee-learning.com/book/neweee{:02}'.format(index)
    print('Start fetching page #{:02}'.format(index))

    response = requests.get(url)
    html_content = response.text

    soup = BeautifulSoup(html_content, 'html.parser')
    text = soup.find('div', class_='field--name-body').text

    cc = OpenCC('t2s')
    simplified_chinese_text = cc.convert(text)
    if '（图：小配）' in simplified_chinese_text:
        simplified_chinese_text = simplified_chinese_text.split('（图：小配）')[1]
    simplified_chinese_text = simplified_chinese_text.strip()

    current_path = os.path.dirname(__file__)
    raw_text_dir = os.path.join(current_path, 'raw_text')
    os.makedirs(raw_text_dir, exist_ok=True)

    with open(os.path.join(raw_text_dir, '{:02}.md'.format(index)), 'w') as f:
        f.write(simplified_chinese_text)
    print('Finished fetching page #{:02}'.format(index))
    

for i in range(1, 65):
    fetch_page(i)
