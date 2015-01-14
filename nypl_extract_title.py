#*- encoding: utf-8 -*

import os
import re
import requests

pat = '<h1 class="title" id="page-title">(.*)</h1>'
titles = []

meta = '''<dc:title>%s</dc:title>\n\
<dc:language>en-US</dc:language>\n\
<dc:creator opf:file-as="NYPL" opf:role="aut">NYPL</dc:creator>\n\
<dc:publisher>NYPL</dc:publisher>\n\
<dc:date opf:event="publication">2015-01-15</dc:date>\n\
<dc:rights>Copyright ©2015 by Cornell Law and NYPL</dc:rights>'''


for f in os.listdir('html/'): 
	with open('html/'+f, 'r') as p:
		try: 
			p = p.readlines()[0]
			title = re.findall(pat, p)[0]
			titles.append(title)
			newdir = '/home/MZ/Desktop/judiciary_ebooks/titles/'+f.strip('.html')
			os.makedirs(newdir)


			with open(newdir + '/' + 'metadata.xml', 'w') as o:
				o.write(meta % str(title))
		except: 
			pass

