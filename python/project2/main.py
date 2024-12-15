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

text=''
i=1

test=3

navs=''

mucluc_item=''

os.makedirs('./'+epub_title+'/META-INF', exist_ok=True)
os.makedirs('./'+epub_title+'/Text', exist_ok=True)

while i <= test:
    url_chapter=url+'/chuong-'+str(i)
    html_chapter=http.request("GET", url=url_chapter).data
    soup_chapter = BeautifulSoup(html_chapter,features="lxml")
    chapter_conten=str(soup_chapter.findAll('div', 'break-words')[0]).replace('<div class="break-words" data-x-bind="ChapterContent">','').replace('<div id="middle-content-one"></div>','').replace('<div id="middle-content-two"></div>','').replace('<div id="middle-content-three"></div>','').replace('</div>','').replace('<div id="middle-content-one"></div>','').replace('<div id="middle-content-two"></div>','').replace('<div id="middle-content-three"></div>','')
    chapter_title=soup_chapter.h2.text
    print(str(i)+' '+chapter_title)
    chapter_id=i
    chapter_text=f'''<?xml version="1.0" encoding="UTF-8" standalone="no"?>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <title>{chapter_title}</title>
    <link href="../stylesheet.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    </head>
    <body>
    <div class="header">{epub_title}</div>
    <div class="author">{author}</div>
    <div class="author">www.dtv-ebook.com</div>
    <h4 id="C{chapter_id}">{chapter_title}</h4>
    {chapter_conten}
    </body>
    </html>
    '''
    print(chapter_text)

    file = open('./'+epub_title+f'/Text/C{i}.html', 'w')
    file.write(chapter_text)
    file.close()

    navs=navs+f'''
    <navPoint id="nav{i}" playorder="{i}">
	  <navLabel>
	    <text>{chapter_title}</text>
	  </navLabel>
	  <content src="Text/C{i}.html"/>
	</navPoint>'''

    mucluc_item=mucluc_item+f'<div class="lv2"><a href="../Text/C{i}.html">{chapter_title}</a></div>'
    i=i+1



container='''<?xml version="1.0" encoding="UTF-8"?>
<container version="1.0" xmlns="urn:oasis:names:tc:opendocument:xmlns:container">
    <rootfiles>
        <rootfile full-path="content.opf" media-type="application/oebps-package+xml"/>
   </rootfiles>
</container>
'''

file = open('./'+epub_title+'/META-INF/container.xml', 'w')
file.write(container)
file.close()

items=''

for i in range(test):
    items=items+f'<item id="C{i}" href="Text/C{i}.html" media-type="application/xhtml+xml"/>'

itemrefs=''

for i in range(test):
    itemrefs=itemrefs+f'''<itemref idref="C{i}"/>'''

content=f'''
<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<package xmlns="http://www.idpf.org/2007/opf" unique-identifier="BookId" version="2.0">
  <metadata xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:opf="http://www.idpf.org/2007/opf">
    <dc:title>{epub_title}</dc:title>
    <dc:creator opf:role="aut">{author}</dc:creator>
    <dc:identifier id="BookId" opf:scheme="UUID">urn:uuid:e5cb99bd-0e41-4213-b61e-1b93b7240d30</dc:identifier>
    <dc:date>28-10-2018</dc:date>
    <dc:language>vi</dc:language>
    <meta name="cover" content="cover"/>
	<meta content="2.0" name="Ebook Builder"/>
  </metadata>
  <manifest>
  	<item id="mucluc" href="Text/mucluc.html" media-type="application/xhtml+xml"/>
    {items}
    <item id="ncx" href="toc.ncx" media-type="application/x-dtbncx+xml"/>

    </manifest>
    <spine toc="ncx">
	<itemref idref="mucluc"/>
    {itemrefs}
</spine>
  <guide>
  </guide>
</package>
'''

file = open('./'+epub_title+'/content.opf', 'w')
file.write(content)
file.close()


img_data = requests.get(epub_img_url).content
with open('./'+epub_title+'/cover.jpg', 'wb') as handler:
    handler.write(img_data)

file = open('./'+epub_title+'/mimetype', 'w')
file.write('application/epub+zip')
file.close()

stylesheet='''
.header {
    font-size: 200%;
    font-weight: bold;
    margin: 0 0 5px;
    text-transform: uppercase;
    text-align: center;
    color: #73562D;
    text-shadow: 0px 0px 1px #000;
}


.author {
    font-size: 100%;
    text-align: center;
    color: #8c8e6f;
    text-shadow: 0px 0px 1px #8c8e6f;
}

.chap, .part {
    font-size: 150%;
    font-weight: bold;
    text-align: center;
    text-shadow: 0px 0px 1px #000;
}

.tho {
    font-style: italic;
    margin-top: -0.5em;
    font-size: 85%;
}

h4 {
    text-align: center;
    color: #666633;
    text-shadow: 0px 0px 1px #000;
}

p {
    text-indent: 20pt;
    line-height: 140%;
    font-size: 100%;
}

.ebook {
    color: #888;
    font-style: italic;
    font-size: 75%;
    text-align: right;
}

.lv1 {
    font-size: 120%;
    font-weight: bold;
    line-height: 90%;
    text-indent: 20pt;
    margin-left: 0em;
}

.lv2 {
    line-height: 120%;
    text-indent: 10pt;
    font-size: 80%;
    font-weight: bold;
    margin-left: 2em;
}

a {
    color: #666633;
}

.drop {
    font-size: 150%;
    font-weight: bold;
}
'''

file = open('./'+epub_title+'/stylesheet.css', 'w')
file.write(stylesheet)
file.close()



toc=f'''
<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE ncx PUBLIC "-//NISO//DTD ncx 2005-1//EN"
 "http://www.daisy.org/z3986/2005/ncx-2005-1.dtd">
<ncx version="2005-1" xmlns="http://www.daisy.org/z3986/2005/ncx/">
  <head>
    <meta content="urn:uuid:e5cb99bd-0e41-4213-b61e-1b93b7240d30" name="dtb:uid"/>
    <meta content="0" name="dtb:depth"/>
    <meta content="0" name="dtb:totalPageCount"/>
    <meta content="0" name="dtb:maxPageNumber"/>
  </head>
  <docTitle>
    <text>{epub_title}</text>
  </docTitle>
  <navMap>
    <navPoint id="mucluc" playorder="0">
      <navLabel>
        <text>Mục lục</text>
      </navLabel>
      <content src="Text/mucluc.html"/>
    </navPoint>
    {navs}
</navMap>
</ncx>
'''


file = open('./'+epub_title+'/toc.ncx', 'w')
file.write(toc)
file.close()


mucluc=f'''
<?xml version="1.0" encoding="utf-8" standalone="no"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
  "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Mục lục</title>
  <link href="../stylesheet.css" rel="stylesheet" type="text/css" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>
<h4>Mục lục</h4>
{mucluc_item}
</body>
</html>
'''

file = open('./'+epub_title+'/Text/mucluc.html', 'w')
file.write(mucluc)
file.close()

# shutil.make_archive(epub_title+".zip", 'zip', "./"+epub_title)
