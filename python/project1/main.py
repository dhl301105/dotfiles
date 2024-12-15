from asyncio import sleep
import os
import requests
import urllib3
from bs4 import BeautifulSoup
import ebooklib
from ebooklib import epub
import shutil


abspath = os.path.abspath(__file__)
dname = os.path.dirname(abspath)
os.chdir(dname)

url='https://metruyencv.com/truyen/tro-tan-van-minh'

http=urllib3.PoolManager()

html_epub=http.request("GET", url=url).data
soup=BeautifulSoup(html_epub,features="lxml")
epub_img_url=str(soup.findAll('img')[2]).split('"')[7]
epub_title = soup.findAll('a')[3].text
author = soup.findAll('a')[4].text
chapter_count=int(soup.findAll('span')[10].text)

# print(chapter_conten)
# print(chapter_title)
print(epub_img_url)
print(epub_title)
print(author)
print(chapter_count)

i=1

test=3





book = epub.EpubBook()

# set metadata
book.set_identifier("id123456")
book.set_title(epub_title)
book.set_language("vi")

book.add_author(author)



img_data = requests.get(epub_img_url).content

# create image from the local image
# image_content = open("ebooklib.gif", "rb").read()
img = epub.EpubImage(
    uid="image_1",
    file_name="static/epub.jpg",
    media_type="image/jpg",
    content=img_data,
)

# define Table Of Contents
toc = ()

# basic spine
book.spine = ["nav"]

while i <= chapter_count:
    url_chapter=url+'/chuong-'+str(i)
    html_chapter=http.request("GET", url=url_chapter).data
    soup_chapter = BeautifulSoup(html_chapter,features="lxml")
    chapter_conten=str(soup_chapter.findAll('div', 'break-words')[0]).replace('<div class="break-words" data-x-bind="ChapterContent">','').replace('<div id="middle-content-one"></div>','').replace('<div id="middle-content-two"></div>','').replace('<div id="middle-content-three"></div>','').replace('</div>','').replace('<div id="middle-content-one"></div>','').replace('<div id="middle-content-two"></div>','').replace('<div id="middle-content-three"></div>','')
    chapter_title=soup_chapter.h2.text
    print(str(i)+' '+chapter_title)

    # create chapter
    c1 = epub.EpubHtml(title=chapter_title, file_name=f"chap_{i}.xhtml", lang="vi")
    c1.content = (
        chapter_conten
    )

    toc=toc+(epub.Link(f"chap_{i}.xhtml", chapter_title, f"chapter{i}"),)

    # add chapter
    book.add_item(c1)

    # basic spine
    book.spine.append(c1)

    i+=1

book.toc=toc
# add image
book.add_item(img)



# add default NCX and Nav file
book.add_item(epub.EpubNcx())
book.add_item(epub.EpubNav())

# define CSS style
style = "BODY {color: white;}"
nav_css = epub.EpubItem(
    uid="style_nav",
    file_name="style/nav.css",
    media_type="text/css",
    content=style,
)

# add CSS file
book.add_item(nav_css)


# write to the file
epub.write_epub("Tro Tàn văn minh.epub", book, {})
